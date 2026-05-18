as yet unclassified
toolButtonLabeled: name

	| btn |
	btn := SimpleButtonMorph new.
	btn
		label: name;
		color: Color gray;
		borderColor: Color lightBlue;
		borderWidth: 1.
	^ btn