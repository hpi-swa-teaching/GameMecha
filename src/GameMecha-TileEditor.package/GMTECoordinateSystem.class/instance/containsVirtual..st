assertion
containsVirtual: aPoint
	"Check if point (relative to coordinate system origin) is captured by coordinate system"

	^ (self definitionArea includes: aPoint x) and: [self valueArea includes: aPoint y]