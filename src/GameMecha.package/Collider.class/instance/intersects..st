collision
intersects: anObject
	"(self touchMargin min: anObject touchMargin) negated."
	^ self intersects: anObject withMargin: 0.