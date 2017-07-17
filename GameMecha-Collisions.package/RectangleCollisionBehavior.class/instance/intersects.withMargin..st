collision
intersects: otherMorph withMargin: tolerance
	^ (super intersects: otherMorph withMargin: tolerance)
		and: [otherMorph collisionBehavior intersectsRect: self withMargin: tolerance].