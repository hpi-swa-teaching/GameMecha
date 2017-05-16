collision
intersectsRect: anotherRect withMargin: tolerance
	"uses the intersects:  method defined on Rectangle"
	^ (self bounds expandBy: tolerance)
		intersects: (anotherRect bounds expandBy: tolerance).