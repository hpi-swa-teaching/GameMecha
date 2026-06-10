export
exportColliderInRelationTo: aMorph

	| collider |
	collider := self colliderType new.
	self assignDefaultColliderValues: collider inRelationTo: aMorph.
	self assignColliderValues: collider inRelationTo: aMorph.
	^ collider