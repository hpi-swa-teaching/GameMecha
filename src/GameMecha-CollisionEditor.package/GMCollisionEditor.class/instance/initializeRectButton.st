initialize
initializeRectButton

	| rectBtn |
	rectBtn := GMRectangleButtonMorph new action: [ | rectangle |
		rectangle := Morph new extent: 250 px @ 150 px.
		self selectedMorph ifNil: [UIManager default inform: 'You need to select a Morph first!'] ifNotNil: [
			self canvasMorph addHitboxToCanvas: rectangle.
			self addCollider: rectangle atNode: self colliderTree nodeType: GMRectangleEditorNode.
			self updateSidebarColliderList]].
	^ rectBtn