initialize-release
initializeLabelMorph: aText

	^ StringMorph new
		contents: aText;
		color: self textColor