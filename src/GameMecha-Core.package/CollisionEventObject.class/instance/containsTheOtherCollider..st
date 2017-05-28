collision type testing
containsTheOtherCollider: aPossibleCollider
	
	(self isCollider: aPossibleCollider)
		ifFalse: [^ false].
		
	^ self colliderContainsOtherMap 
		at: aPossibleCollider 
		ifAbsentPut: [(self collisionPartnerOf: aPossibleCollider) contains: aPossibleCollider].