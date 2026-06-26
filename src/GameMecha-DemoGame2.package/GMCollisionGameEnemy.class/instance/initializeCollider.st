initialization
initializeCollider
	"Here we create the new colider on the fly and use a compositeCollider as the top collider. One could then add multiple colliders as the composite's children. This can be used for more complex collision areas or to differantiate between different parts of the collider when handling collision in onCollision:. To work as intended, a parent collider needs to have the mask/layers set that each of it's children has set as well. Children will inherit the mask/layers if not overwritten."

	self
		layers: #(5);
		mask: #(4);
		collider: (GMCompositeCollider new
			parent: self;
			symbol: #enemy;
			yourself).
	self collider addChild: (GMPrimitiveCircleCollider new radius: self radius)