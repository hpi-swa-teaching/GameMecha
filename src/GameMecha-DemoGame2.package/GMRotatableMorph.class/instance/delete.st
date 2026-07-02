submorphs - add/remove
delete 

	self isRotated ifTrue: [self owner delete].
	super delete