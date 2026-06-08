as yet unclassified
calcColliderTypeSpecifiyAttributes: aCollider with: aGMEditorNode

	| collider morph |
	collider := aCollider.
	morph := aGMEditorNode morph.
	
	aGMEditorNode colliderType
		caseOf: {
			[GMCompositeCollider] -> [
				aGMEditorNode children do: [:child |
					collider addChild: (self
						exportFromNode: child
						withParent: collider)]].
			[GMPrimitiveCircleCollider] -> [collider radius: (self calcRadius: morph)].
			[GMPrimitiveRectangleCollider] -> [
				collider
					width: (self calcWidth: morph);
					height: (self calcHeights: morph)]}
		otherwise: [self error: 'The colliderType of ' + aGMEditorNode symbol asString + ' is invalid'].
	
	^ collider