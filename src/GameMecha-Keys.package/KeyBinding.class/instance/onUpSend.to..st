handlers
onUpSend: aMsg to: anObject
	self keyUpHandlers add: [anObject perform: aMsg].