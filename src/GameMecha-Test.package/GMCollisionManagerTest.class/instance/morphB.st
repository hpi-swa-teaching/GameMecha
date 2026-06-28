accessing
morphB

	^ morphB ifNil: [morphB := self newCollisionMorph]