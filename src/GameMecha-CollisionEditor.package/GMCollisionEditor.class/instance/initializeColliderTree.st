initialize-release
initializeColliderTree

	self colliderTree: (GMCompositeEditorNode new
		collider: GMCompositeCollider new;
		editor: self;
		yourself)