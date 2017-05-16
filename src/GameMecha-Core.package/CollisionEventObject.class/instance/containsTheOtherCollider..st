collision type testing
containsTheOtherCollider: aPossibleCollider
	
	(self isCollider: aPossibleCollider)
		ifFalse: [^ false].
		
	^ self colliderContainsOtherMap 
		at: aPossibleCollider 
		ifAbsentPut: [aPossibleCollider contains: (self collisionPartnerOf: aPossibleCollider)].