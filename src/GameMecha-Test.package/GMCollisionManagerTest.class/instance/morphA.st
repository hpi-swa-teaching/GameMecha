accessing
morphA

	^ morphA ifNil: [morphA := self newCollisionMorph]