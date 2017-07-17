containing
intersects: otherMorph withMargin: tolerance
	^ (super intersects: otherMorph withMargin: tolerance)
		and: [otherMorph collisionBehavior intersectsCircle: self withMargin: tolerance].