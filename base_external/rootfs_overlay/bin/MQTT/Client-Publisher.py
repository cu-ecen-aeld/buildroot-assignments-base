# FileName: Client-Publisher.py
# Auther: Sankalp Pund
# Description: This python script runs as mqtt client
# Reference: https://github.com/eclipse/paho.mqtt.python

#Importing Modules
try:
	import paho
	import sys
	import paho.mqtt.client as mqtt
#Error checking for module import
except Exception as e:
	print(e)

#port is the network port of the server host to connect to.
Port=1883
# Maximum period in seconds between communications with the broker.
Keepalive=60
try:
	print("I am Client")
	# Client Constructor
	# Function Defination: https://github.com/eclipse/paho.mqtt.python#client-1
	client = mqtt.Client()

	#IP address of the remote broker accepting 
	#from command line argument.
	IP_Address = sys.argv[-1]

	#Connect to a remote broker.
	#Function defination:https://github.com/eclipse/paho.mqtt.python/blob/1eec03edf39128e461e6729694cf5d7c1959e5e4/src/paho/mqtt/client.py#L908
	client.connect(IP_Address,Port,Keepalive)

	#Publish a message on a topic.
	#This causes a message to be sent to the broker and subsequently from
    #the broker to any clients subscribing to matching topics.
    #Function defination:https://github.com/eclipse/paho.mqtt.python/blob/1eec03edf39128e461e6729694cf5d7c1959e5e4/src/paho/mqtt/client.py#L1199
	client.publish("topic/test","Sending test data to Server...");
	print("Sending test data to Server...")
	while True:
		#Take input data to be sent to server.
		Data = raw_input("Enter Data to be sent to server: ")

		#Publish a message on a topic.
		#This causes a message to be sent to the broker and subsequently from
    	#the broker to any clients subscribing to matching topics.
		client.publish("topic/test", str(Data))
	
#Error Checking for script. 
except Exception as e:
	print(e)

