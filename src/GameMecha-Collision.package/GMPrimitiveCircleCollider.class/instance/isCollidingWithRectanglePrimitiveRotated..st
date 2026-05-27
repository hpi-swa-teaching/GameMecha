collision
isCollidingWithRectanglePrimitiveRotated: aRectangleCollider

	| axes closestCorner dx dy len |
	
	axes := Array with: aRectangleCollider localAxisX with: aRectangleCollider localAxisY.
	
	axes do: [:axis | (aRectangleCollider isSeparatedFromCircle: self onAxis: axis) ifTrue: [^ false]].
	
	closestCorner := aRectangleCollider corners inject: aRectangleCollider corners first into: [:nearest :corner | | d1 d2 |
		d1 := self center - nearest.
		d2 := self center - corner.
		d1 x * d1 x + (d1 y * d1 y) < (d2 x * d2 x + (d2 y * d2 y)) ifTrue: [nearest] ifFalse: [corner]].
	
	dx := self center x - closestCorner x.
	dy := self center y - closestCorner y.
	len := (dx * dx + (dy * dy)) sqrt.
	len = 0.0 ifTrue: [^ true].
	
	(aRectangleCollider isSeparatedFromCircle: self onAxis: dx / len @ (dy / len)) ifTrue: [^ false].
	
	^ true