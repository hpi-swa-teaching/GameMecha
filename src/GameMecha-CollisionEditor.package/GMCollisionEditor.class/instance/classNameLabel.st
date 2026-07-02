accessing
classNameLabel

	^ classNameLabel ifNil: [
		self classNameLabel: (StringMorph new
			contents: '-';
			color: self textColor)]