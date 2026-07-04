initialize-release
initializeRectButton

	| rectBtn |
	rectBtn := GMRectangleButtonMorph new action: [ | rectangle |
		rectangle := Morph new extent: 250 px @ 150 px.
		self selectedMorph ifNil: [UIManager default inform: 'You need to select a Morph first!'] ifNotNil: [
			self canvasMorph addHitboxToCanvas: rectangle.
			self addRectangleCollider: rectangle atNode: self colliderTree.
			self updateSidebarColliderList]].
	^ rectBtn