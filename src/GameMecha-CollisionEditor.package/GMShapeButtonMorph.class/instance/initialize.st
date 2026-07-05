initialize-release
initialize

	super initialize.
	self
		isHovered: false;
		isPressed: false;
		extent: 40 px @ 40 px;
		color: Color transparent;
		borderColor: self buttonBorderColor;
		borderWidth: 1