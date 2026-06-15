import
importColliderValuesFrom: aGMCompositeCollider inRelationTo: aMorph

	aGMCompositeCollider children do: [:c | | e |
		e := c editorNodeType new
			initializeFromCollider: c inRelationTo: aMorph withParent: self;
			yourself.
		
		self addChildren: e].
	self morph color: Color transparent