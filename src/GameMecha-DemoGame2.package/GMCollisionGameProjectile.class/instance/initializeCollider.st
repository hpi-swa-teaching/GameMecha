initialize-release
initializeCollider
	"Here we use the simplest form of colliders: just one primitive. Note that neither the morph itself nor the collider has it's maks/layer set here directly. This is because that is done by the player when shooting and will diferantiate between player1 and player2"
	
	self collider: (GMPrimitiveCircleCollider new
		radius: self radius;
		parent: self;
		yourself)