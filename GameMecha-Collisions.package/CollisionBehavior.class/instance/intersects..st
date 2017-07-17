collision
intersects: otherMorph
	"TODO find better name in Morph"
	"(self touchMargin min: otherMorph touchMargin) negated."
	^ self intersects: otherMorph withMargin: 0.