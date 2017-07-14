handlers
onChangedDo: aBlock
	self keyDownHandlers add: [aBlock value: true].
	self keyUpHandlers add: [aBlock value: false].