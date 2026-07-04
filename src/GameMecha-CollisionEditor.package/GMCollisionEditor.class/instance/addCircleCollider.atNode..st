collider-tree
addCircleCollider: aMorph atNode: aGMEditorNode

	| colliderNode |
	colliderNode := GMCircleEditorNode new
		morph: aMorph;
		parent: aGMEditorNode;
		collider: GMPrimitiveCircleCollider new;
		yourself.
	aGMEditorNode addChildren: colliderNode.
	aMorph owner editorNode: colliderNode