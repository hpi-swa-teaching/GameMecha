handlers
onDownSend: aMsg to: anObject
	self keyDownHandlers add: [anObject perform: aMsg].