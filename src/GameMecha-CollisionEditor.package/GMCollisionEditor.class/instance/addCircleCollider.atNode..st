collider-tree
addCircleCollider: aMorph atNode: aGMEditorNode

	| colliderNode |
	colliderNode := GMCircleEditorNode new
		morph: aMorph;
		parent: aGMEditorNode;
		collider: GMPrimitiveCircleCollider new;
		yourself.
	aGMEditorNode addChild: colliderNode.
	aMorph owner editorNode: colliderNode