submorphs - add/remove
addToDeleteQueue

	self isRotated
		ifTrue: [self game addToRotatedDeleteQueue: self owner]
		ifFalse: [self game addToDeleteQueue: self]