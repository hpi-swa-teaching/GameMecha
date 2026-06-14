test cases
testNullColliderParentIsItself

	| nullCollider |
	nullCollider := GMNullCollider new.
	self assert: nullCollider parent == nullCollider