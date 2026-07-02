initialize
initializeThemeButton: aLabel Target: aTarget

	^ PluggableButtonMorph new
		label: aLabel;
		color: self buttonColor;
		borderColor: self buttonBorderColor;
		target: aTarget;
		actionSelector: #value;
		borderWidth: 1;
		textColor: self buttonTextColor;
		height: 20 px