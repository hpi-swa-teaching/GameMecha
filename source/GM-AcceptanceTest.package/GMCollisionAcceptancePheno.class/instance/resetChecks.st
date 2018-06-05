collisionchecks
resetChecks
	self collisionChecks: OrderedCollection new.
	self remove: self collisionDescriptions.
	self collisionDescriptions: (PHDescriptionList items: {}).
	self add: self collisionDescriptions.
	 