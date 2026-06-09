collision
checkCollisionWithCirclePrimitiveRotated: aCircleCollider

	| axes closestCorner dx dy len |
	(aCircleCollider maskIncludes: self layers) ifFalse: [^ false].
	
	axes := Array with: self localAxisX with: self localAxisY.
	axes do: [:axis | (self isSeparatedFromCircle: aCircleCollider onAxis: axis) ifTrue: [^ false]].
	
	closestCorner := self corners inject: self corners first into: [:nearest :corner | | d1 d2 |
		d1 := aCircleCollider center - nearest.
		d2 := aCircleCollider center - corner.
		(d1 x * d1 x) + (d1 y * d1 y) < ((d2 x * d2 x) + (d2 y * d2 y)) ifTrue: [nearest] ifFalse: [corner]].
	
	dx := aCircleCollider center x - closestCorner x.
	dy := aCircleCollider center y - closestCorner y.
	len := ((dx * dx) + (dy * dy)) sqrt.
	len = 0.0 ifTrue: [^ true].
	
	(self isSeparatedFromCircle: aCircleCollider onAxis: dx / len @ (dy / len)) ifTrue: [^ false].
	
	^ true