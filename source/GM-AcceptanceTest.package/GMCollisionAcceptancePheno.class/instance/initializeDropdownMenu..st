pheno
initializeDropdownMenu: aButton
	PHDropdown new
		add: ((PHDropdownItem label: 'Circle-Rectangle')
			when: #clicked send: #chooseCollisionScenario:with: to: self withArguments: {#circleCollisionMorph. #rectangleCollisionMorph});
		add: ((PHDropdownItem label: 'Circle-RotatedRectangle')
			when: #clicked send: #chooseCollisionScenario:with: to: self withArguments: {#circleCollisionMorph. #rotatedRectangleCollisionMorph});
		add: ((PHDropdownItem label: 'Rectangle-RotatedRectangle')
			when: #clicked send: #chooseCollisionScenario:with: to: self withArguments: {#rectangleCollisionMorph. #rotatedRectangleCollisionMorph});
		attachTo: aButton.