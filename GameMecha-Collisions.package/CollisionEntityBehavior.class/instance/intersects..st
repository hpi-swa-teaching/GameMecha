collision
intersects: otherMorph
	"(self touchMargin min: otherMorph touchMargin) negated."
	^ self intersects: otherMorph withMargin: 0.