instance creation
newFromAsset: aGameMechaColliderAsset withOwner: aMorph
	"
	Create a collider with a GMC (GameMechaCollider) asset with an owner. 
	Note that the created instance should be cached to improve performance. Creating it on every
	`gmCollider` call is a bad idea. Instead initialize an instance variable with the collider instance and
	return this instance in `gmCollider`.
	"

	^ (STON fromString: aGameMechaColliderAsset asString) parent: aMorph