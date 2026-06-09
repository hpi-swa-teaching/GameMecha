collision
onCollision: aCollisionEvent
	"Note: This should be refactored into a double dispatch pattern."
	
	"hit by an enemy"
	(aCollisionEvent reason other layers includes: 4) ifTrue: [self game deleteQueue add: self].
	
	"hit by the other players projectile"
	(aCollisionEvent reason other layers includes: (self mask at: 2)) ifTrue: [self ammo: self ammo - 1].
	
	"inside of the glowing area"
	(aCollisionEvent reason other layers includes: 8) ifTrue: [self ammo: self ammo + 0.02]