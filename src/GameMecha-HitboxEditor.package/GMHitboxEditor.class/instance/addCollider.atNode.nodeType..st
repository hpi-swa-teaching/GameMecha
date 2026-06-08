as yet unclassified
addCollider: aMorph atNode: aGMEditorNode nodeType: aNodeType

	self symbolCounter: self symbolCounter + 1.
	
	aGMEditorNode addChildren: (aNodeType new
		morph: aMorph;
		symbol: self symbolCounter asString asSymbol;
		parent: aGMEditorNode;
		yourself)