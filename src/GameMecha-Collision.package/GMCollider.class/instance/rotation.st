accessing
rotation

	^ rotation + (self inheritRotation ifTrue: [self parent rotation] ifFalse: [0])