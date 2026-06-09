collision
onCollision: aCollisionEvent
	"Note: This should be refactored into a double dispatch pattern."

	(aCollisionEvent reason other layers includes: 5) ifTrue: [self game deleteQueue add: self]