as yet unclassified
toolButtonLabeled: name

	| btn |
	btn := SimpleButtonMorph new.
	btn
		label: name;
		color: self buttonColor;
		borderColor: Color transparent;
		borderWidth: 1.
	^ btn