initialization
initializeButtons

	| row |
	row := AlignmentMorph newRow
		vResizing: #shrinkWrap;
		color: Color transparent.
	row
		addMorphBack: (self
			buttonName: 'store "collision"'
			action: #storeCollision);
		addMorphBack: (self
			buttonName: 'store "no collision"'
			action: #storeNoCollision);
		addMorphBack: (self
			buttonName: 'reset current scenarios'
			action: #resetChecks);
		addMorphBack: (self
			buttonName: 'generate tests'
			action: #save).
	self addMorphFront: row.
	
	row := AlignmentMorph newRow
		vResizing: #shrinkWrap;
		color: Color transparent.
	row
		addMorphFront: (StaticTextMorph
			string: 'Presets:'
			size: 12);
		addMorphBack: (self
			buttonName: 'Circle-Rectangle'
			action: #chooseCollisionScenario:with: 
			target: self collisionMorph
			arguments: {#circleCollisionMorph. #rectangleCollisionMorph});
		addMorphBack: (self
			buttonName: 'Circle-RotatedRectangle'
			action: #chooseCollisionScenario:with: 
			target: self collisionMorph
			arguments: {#circleCollisionMorph. #rotatedRectangleCollisionMorph});
	 	addMorphBack: (self
			buttonName: 'Rectangle-RotatedRectangle'
			action: #chooseCollisionScenario:with:
			target: self collisionMorph
			arguments: {#rectangleCollisionMorph. #rotatedRectangleCollisionMorph}).
	self addMorphBack: row.