as yet unclassified
addCollider: aMorph withSymbol: aSymbol atNode: aGMEditorNode

	aGMEditorNode addChildren: (GMEditorNode new
		morph: aMorph;
		symbol: aSymbol;
		parent: aGMEditorNode;
		yourself)