pheno
initializeButtons
	| button |
	self
		addStyleClass: #withPadding;
		add: (PHButtonGroup new
			add: ((PHButton label: 'store "collision"')
				when: #clicked send: #storeCollision to: self);
			add: ((PHButton label: 'save tests')
				when: #clicked send: #save to: self);
			add: ((PHButton label: 'reset tests')
				when: #clicked send: #resetChecks to: self);
			add: ((PHButton label: 'store "no collision"')
				when: #clicked send: #storeNoCollision to: self);
			add: (button := PHButton label: 'collision' iconSuffix: #iconCaret_down)).
	self initializeDropdownMenu: button.