obstacle
resolveIntersection: otherCollider movingVector: delta
	|lerpFactor stepSize |
	((delta isZero) or: [(self intersects: otherCollider) not]) ifTrue: [^self].
	stepSize := 1.
	lerpFactor := 1.
	"self openInWorld. otherCollider openInWorld."
	[ (stepSize > 0.01) and: [(self touches: otherCollider) not or: [self intersects: otherCollider]] ] 
		whileTrue: [
			stepSize := stepSize / 2.0.
			(self intersects: otherCollider)
				ifTrue: [lerpFactor := lerpFactor - stepSize] 
				ifFalse: [lerpFactor := lerpFactor + stepSize].
			otherCollider position: otherCollider previousBounds origin + (delta * lerpFactor).
			].