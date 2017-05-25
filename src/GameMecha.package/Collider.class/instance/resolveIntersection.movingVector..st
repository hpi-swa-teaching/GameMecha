obstacle
resolveIntersection: otherCollider movingVector: delta
	|lerpFactor stepSize |
	(self intersects: otherCollider) ifFalse: [^self].
	stepSize := 1.
	lerpFactor := 1.
	"self openInWorld. otherCollider openInWorld."
	[((self touches: otherCollider) and: (self intersects: otherCollider) not)] 
		whileFalse: [
			stepSize := stepSize / 2.0.
			(self intersects: otherCollider)
				ifTrue: [lerpFactor := lerpFactor - stepSize] 
				ifFalse: [lerpFactor := lerpFactor + stepSize].
			otherCollider position: otherCollider previousBounds origin + (delta * lerpFactor).
			]