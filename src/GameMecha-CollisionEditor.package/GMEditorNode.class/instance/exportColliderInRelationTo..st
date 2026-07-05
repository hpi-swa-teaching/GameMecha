export
exportColliderInRelationTo: aMorph

	self assignDefaultColliderValues: self collider inRelationTo: aMorph.
	self assignColliderValues: self collider inRelationTo: aMorph.
	
	^ self collider