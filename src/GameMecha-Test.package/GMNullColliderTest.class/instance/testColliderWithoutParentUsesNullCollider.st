test cases
testColliderWithoutParentUsesNullCollider

	| collider |
	collider := GMPrimitiveRectangleCollider new.
	self assert: (collider parent isKindOf: GMNullCollider)