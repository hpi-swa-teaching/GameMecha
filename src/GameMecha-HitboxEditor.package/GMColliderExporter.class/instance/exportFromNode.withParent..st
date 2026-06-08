as yet unclassified
exportFromNode: aGMEditorNode withParent: aCollider

	| collider morph |
	morph := aGMEditorNode morph.
	collider := aGMEditorNode colliderType new.
	collider
		parent: aCollider;
		center: (self calcCenter: morph);
		symbol: aGMEditorNode symbol;
		rotation: (self calcRotation: morph).
	
	"alternative different Node types for each colliderType"
	^ self calcColliderTypeSpecifiyAttributes: collider with: aGMEditorNode.
	
	