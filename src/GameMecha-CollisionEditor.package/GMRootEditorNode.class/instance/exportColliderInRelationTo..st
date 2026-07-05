export
exportColliderInRelationTo: aMorph

	self children size > 1 ifTrue: [
		self collider: GMCompositeCollider new.
		self assignDefaultColliderValues: self collider inRelationTo: aMorph.
		self assignColliderValues: self collider inRelationTo: aMorph.
		
		^ self collider].
	self children first parent: nil.
	^ self children first exportColliderInRelationTo: aMorph