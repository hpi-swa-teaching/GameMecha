collider-tree
addRectangleCollider: aMorph atNode: aGMEditorNode

	| colliderNode |
	colliderNode := GMRectangleEditorNode new
		morph: aMorph;
		parent: aGMEditorNode;
		collider: GMPrimitiveRectangleCollider new;
		yourself.
	aGMEditorNode addChildren: colliderNode.
	aMorph owner editorNode: colliderNode