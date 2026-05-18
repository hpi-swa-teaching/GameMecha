accessing
removeChild: aCollider

	self children remove: aCollider ifAbsent: [].
	aCollider parent: nil