initialization
buttonName: aString action: aSymbol target: anObject

	^ SimpleButtonMorph new
		target: anObject;
		label: aString;
		actionSelector: aSymbol;
		color: (Color gray: 0.8);
		borderWidth: 1;
		borderRaised.