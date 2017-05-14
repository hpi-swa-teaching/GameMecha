accessing
collisionGroups
	collisionGroups ifNil: [self collisionGroups: Set new].
	^ collisionGroups.