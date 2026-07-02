initialize
initialize

	super initialize.
	self
		color: (UserInterfaceTheme current get: #customWindowColor for: #Browser);
		backgroundColor: (UserInterfaceTheme current get: #color for: #MenuMorph);
		borderWidth: 1;
		borderColor: (UserInterfaceTheme current get: #color for: #MenuMorph);
		contents: ''