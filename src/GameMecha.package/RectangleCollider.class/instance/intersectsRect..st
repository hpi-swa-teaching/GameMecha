collision
intersectsRect: anotherRect
	"uses the intersects:  method defined on Rectangle"
	^ self bounds intersects: anotherRect bounds.