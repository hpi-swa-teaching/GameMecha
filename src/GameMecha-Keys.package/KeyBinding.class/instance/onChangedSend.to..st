handlers
onChangedSend: aMsg to: anObject
	self keyDownHandlers add: [anObject perform: aMsg with: true].
	self keyUpHandlers add: [anObject perform: aMsg with: false].