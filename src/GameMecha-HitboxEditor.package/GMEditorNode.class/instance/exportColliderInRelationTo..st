as yet unclassified
exportColliderInRelationTo: aMorph

	| collider |
	collider := self colliderType new.
	self asignDefaultColliderValues: collider inRelationTo: aMorph.
	self asignTypeSpecificValues: collider inRelationTo: aMorph.
	^ collider