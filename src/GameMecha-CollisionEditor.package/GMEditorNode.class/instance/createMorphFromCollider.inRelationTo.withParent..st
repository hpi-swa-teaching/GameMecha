import
createMorphFromCollider: aGMCollider inRelationTo: aMorph withParent: aGMEditorNode

	self morph: self morphType new.
	self collider: aGMCollider.
	
	self importColliderValuesFrom: aGMCollider inRelationTo: aMorph.
	self morph
		center: (self calculateImportCenter: aMorph From: aGMCollider);
		color: self morphColor.
	self parent: aGMEditorNode.
	self editor addImportedMorphToCanvas: self morph withRotation: aGMCollider rotation