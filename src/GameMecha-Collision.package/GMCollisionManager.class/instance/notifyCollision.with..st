collision
notifyCollision: aMorph with: aCollisionEvent

	(aMorph respondsTo: #onCollision:) ifTrue: [aMorph onCollision: aCollisionEvent]