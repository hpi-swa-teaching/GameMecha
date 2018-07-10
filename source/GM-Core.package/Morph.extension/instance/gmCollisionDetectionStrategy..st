*GM-Core
gmCollisionDetectionStrategy: aCollisionDetectionShape
	self assureExtension assureOtherProperties at: #gmCollisionDetectionShape put: aCollisionDetectionShape.
	aCollisionDetectionShape owner: self.