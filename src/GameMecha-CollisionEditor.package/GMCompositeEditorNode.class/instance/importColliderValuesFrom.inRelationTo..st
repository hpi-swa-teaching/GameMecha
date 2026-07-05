import
importColliderValuesFrom: aGMCompositeCollider inRelationTo: aMorph

	aGMCompositeCollider children do: [:child | | node |
		node := child editorNodeType new editor: self editor.
		node createMorphFromCollider: child inRelationTo: aMorph withParent: self.
		self addChild: node]