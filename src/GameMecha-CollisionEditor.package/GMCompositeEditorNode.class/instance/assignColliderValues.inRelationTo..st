export
assignColliderValues: aCollider inRelationTo: aMorph

	aCollider children: OrderedCollection new.
	self children do: [:child | aCollider addChild: (child exportColliderInRelationTo: aMorph)]