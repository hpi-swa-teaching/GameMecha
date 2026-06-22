collision
onCollision: aCollisionEvent
	"Note: This should be refactored into a double dispatch pattern."
	
	"hit by an enemy"
	(aCollisionEvent reason otherColliderSymbols includes: #enemy) ifTrue: [self addToDeleteQueue].
	
	"hit by the other players projectile"
	(aCollisionEvent reason otherColliderSymbols includes: self otherPlayerProjectileSymbol) ifTrue: [self ammo: self ammo - 1].
	
	"inside of the glowing area"
	(aCollisionEvent reason otherColliderSymbols includes: #area) ifTrue: [self ammo: self ammo + 0.02]