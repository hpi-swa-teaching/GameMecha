as yet unclassified
addCollider: aMorph atNode: aGMEditorNode colliderType: aColliderType

	self symbolCounter: self symbolCounter + 1.
	
	aGMEditorNode addChildren: (GMEditorNode new
		morph: aMorph;
		symbol: self symbolCounter asString asSymbol;
		colliderType: aColliderType;
		parent: aGMEditorNode;
		yourself)