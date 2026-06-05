collision
onCollision: aCollisionEvent 

	"aCollisionEvent right now only returns the morph that was collided with"
	(aCollisionEvent layers includes: 5) ifTrue: [self game deleteQueue add: self]