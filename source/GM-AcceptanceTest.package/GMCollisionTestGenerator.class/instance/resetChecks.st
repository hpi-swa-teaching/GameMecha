collision checks
resetChecks
	self collisionChecks: OrderedCollection new.
	self remove: self collisionDescriptions.
	self add: (PHDescriptionList items: {}).
	 