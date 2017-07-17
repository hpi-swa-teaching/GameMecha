collision
touches: otherMorph
	^ self intersects: otherMorph withMargin: (self touchMargin max: otherMorph touchMargin).