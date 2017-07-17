accessing
eventHandler
	eventHandler ifNil: [self eventHandler: OrderedCollection new].
	^ eventHandler.