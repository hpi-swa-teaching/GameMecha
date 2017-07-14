accessing
keyUpHandlers
	keyUpHandlers ifNil: [self keyUpHandlers: OrderedCollection new]. 
	^ keyUpHandlers.