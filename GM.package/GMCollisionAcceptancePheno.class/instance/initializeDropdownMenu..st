pheno
initializeDropdownMenu: aButton
	PHDropdown new
		add: ((PHDropdownItem label: 'Circle-Rectangle')
			when: #clicked send: #chooseCollisionScenario:with: to: self collisionMorph withArguments: {#circleCollisionMorph. #rectangleCollisionMorph});
		add: ((PHDropdownItem label: 'Circle-RotatedRectangle')
			when: #clicked send: #chooseCollisionScenario:with: to: self collisionMorph withArguments: {#circleCollisionMorph. #rotatedRectangleCollisionMorph});
		add: ((PHDropdownItem label: 'Rectangle-RotatedRectangle')
			when: #clicked send: #chooseCollisionScenario:with: to: self collisionMorph withArguments: {#rectangleCollisionMorph. #rotatedRectangleCollisionMorph});
		attachTo: aButton.