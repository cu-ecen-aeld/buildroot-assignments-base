include $(sort $(wildcard $(BR2_EXTERNAL_AESD_ASSIGNMENTS_PATH)/package/*/*.mk))

# flash-my-board:
#     $(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/flash-image \
#         --image $(BINARIES_DIR)/image.bin \
#         --address $(BAR_42_FLASH_ADDR)