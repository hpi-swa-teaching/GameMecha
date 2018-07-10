initialization
initialize
	super initialize.
	self
		extent: self class defaultExtent;
		color: Color white;
		addMorph: (StringMorph new
			contents: 'click me or drag something over me';
			center: self center;
			yourself).