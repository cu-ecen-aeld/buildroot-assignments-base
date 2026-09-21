#!/bin/bash
# webfactory/ssh-agent writes per-repo deploy key state into the real $HOME:
#   ~/.ssh/key-<hash>            (public key used as IdentityFile)
#   ~/.ssh/config                (Host key-<hash>.github.com blocks)
#   ~/.gitconfig                 (url.git@key-<hash>.github.com:...insteadOf)
# On a self-hosted runner these persist after the job and break later git
# operations once the agent is gone, so remove them.
# Usage: cleanup-ssh-keys.sh [debug]
set -u

dump_state() {
    echo "--- whoami=$(whoami) HOME=$HOME"
    echo "--- ~/.ssh"; ls -la ~/.ssh 2>&1 || true
    echo "--- ~/.ssh/config"; cat ~/.ssh/config 2>&1 || true
    echo "--- global git insteadOf"; git config --global --get-regexp 'url\..*insteadof' 2>&1 || true
    echo "--- agent keys (public, truncated)"
    ssh-add -L 2>&1 | awk '{print $1, substr($2,1,20) "...", $3}' || true
}

[[ "${1:-}" == "debug" ]] && { echo "== state before cleanup"; dump_state; }

# gitconfig: drop url.*key-*.github.com* sections
git config --global --name-only --get-regexp 'url\..*key-[0-9a-f]+\.github\.com.*\.insteadof' 2>/dev/null \
    | sed 's/\.insteadof$//' | sort -u | while read -r section; do
        echo "Removing git config section ${section}"
        git config --global --remove-section "${section}"
    done

# ssh config: drop "Host key-*" blocks
if [[ -f ~/.ssh/config ]]; then
    awk '
        /^[[:space:]]*Host[[:space:]]+key-[0-9a-f]+\.github\.com/ { skip=1; next }
        /^[[:space:]]*Host[[:space:]]/ { skip=0 }
        !skip { print }
    ' ~/.ssh/config > ~/.ssh/config.tmp && mv ~/.ssh/config.tmp ~/.ssh/config && chmod 600 ~/.ssh/config
fi

# public key files
rm -fv ~/.ssh/key-[0-9a-f]*

[[ "${1:-}" == "debug" ]] && { echo "== state after cleanup"; dump_state; }
exit 0
