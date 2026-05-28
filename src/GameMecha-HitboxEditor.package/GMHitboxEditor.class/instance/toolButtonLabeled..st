ui-components
toolButtonLabeled: name

	^ SimpleButtonMorph new
		label: name;
		color: self buttonColor;
		borderColor: Color transparent;
		borderWidth: 1;
		yourself