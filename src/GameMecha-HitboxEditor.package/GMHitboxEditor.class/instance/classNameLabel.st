textInput
classNameLabel

	^ classNameLabel ifNil: [
		classNameLabel := StringMorph new
			contents: '–';
			color: self textColor]