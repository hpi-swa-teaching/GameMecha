accessing
hasCollidedWithSymbol: aColliderSymbol
	"
	Note that this collider symbol must be part of the own collider tree.
	We intentionally do not provide utility functions for checking collisions against collider symbols belonging to the collision partner (other).
	Such functions would encourage code that depends on knowledge of the collision partner's internal collider structure, which is considered an anti-pattern.
	If you really need this access, you can implement it yourself by traversing the collision event tree.
	"

	^ self collidedSymbols includes: aColliderSymbol