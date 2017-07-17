collision
intersects: otherMorph withMargin: tolerance
	"returns true, if I'm colliding with a generic otherMorph and the boundingboxes intersect"
	^ (self collisionGroupsIntersectWith: otherMorph)
		and: [(self target bounds expandBy: tolerance) intersects: (otherMorph bounds expandBy: tolerance)].