A GMCollisionTestMorph is a minimal Morph used in collision tests. It holds a GMCollider and counts how many times onCollision: has been called, allowing tests to verify that collision notifications are received.

Instance Variables
	collider:					<GMCollider>
	rotation:					<Number>
	onCollisionCallCount:		<Integer>