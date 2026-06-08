as yet unclassified
asignTypeSpecificValues: aCollider inRelationTo: aMorph



	self asignDefaultColliderValues: aCollider inRelationTo: aMorph.
	self children do: [:child | aCollider addChild: (child exportColliderInRelationTo: aMorph)].
	