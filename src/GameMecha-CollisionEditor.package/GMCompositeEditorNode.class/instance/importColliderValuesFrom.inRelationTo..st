import
importColliderValuesFrom: aGMCompositeCollider inRelationTo: aMorph

	aGMCompositeCollider children do: [:child | | node |
		node := child editorNodeType new
			initializefromCollider: child inRelationTo: aMorph withParent: self;
			yourself.
		
		self addChildren: node]