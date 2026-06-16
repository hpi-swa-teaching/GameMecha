collision
onCollision: aCollisionEvent
	"Note: This should be refactored into a double dispatch pattern. This could also be optimzed by checking the layer for the shared layer of the projectiles, but looses readability that way"
	
	| collidedSymbols |
	collidedSymbols := aCollisionEvent reason otherColliderSymbols.
	((collidedSymbols includes: #p1Projectile) or: [collidedSymbols includes: #p2Projectile]) ifTrue: [self game deleteQueue add: self]