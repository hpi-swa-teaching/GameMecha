initialize-release
initializeCircleButton

	^ GMCircleButtonMorph new action: [ | circle |
		circle := EllipseMorph new extent: 200 px @ 200 px.
		self selectedMorph ifNil: [UIManager default inform: 'You need to select a Morph first!'] ifNotNil: [
			self canvasMorph addHitboxToCanvas: circle.
			self addCircleCollider: circle atNode: self colliderTree.
			self updateSidebarColliderList]]