assertion
containsPos: aPoint
	"Check if point (relative to screen origin) is captured by coordinate system"

	^ ((Interval from: 1 to: self width) includes: aPoint x) and: [(Interval from: 1 to: self height) includes: aPoint y]