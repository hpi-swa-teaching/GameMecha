export
assignColliderValues: aCollider inRelationTo: aMorph

	self assignDefaultColliderValues: aCollider inRelationTo: aMorph.
	self children do: [:child | aCollider addChild: (child exportColliderInRelationTo: aMorph)]