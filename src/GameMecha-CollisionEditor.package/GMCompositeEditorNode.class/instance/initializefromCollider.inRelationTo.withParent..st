import
initializefromCollider: aGMCollider inRelationTo: aMorph withParent: aGMEditorNode

	self morph: self morphType new.
	self collider: aGMCollider.
	
	self importColliderValuesFrom: aGMCollider inRelationTo: aMorph.
	self collider children: OrderedCollection new.
	self parent: aGMEditorNode