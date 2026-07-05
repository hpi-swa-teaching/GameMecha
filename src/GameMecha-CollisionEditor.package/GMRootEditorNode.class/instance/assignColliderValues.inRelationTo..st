export
assignColliderValues: aCollider inRelationTo: aMorph

	| totalMask totalLayers |
	totalMask := OrderedCollection new.
	totalLayers := OrderedCollection new.
	self children do: [:child |
		totalMask addAll: child collider maskAsOrderedCollection.
		totalLayers addAll: child collider layersAsOrderedCollection.
		aCollider addChild: (child exportColliderInRelationTo: aMorph)].
	aCollider
		mask: totalMask;
		layers: totalLayers