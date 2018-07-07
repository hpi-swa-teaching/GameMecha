initialization
initialize
	super initialize.
	self
		extent: self class defaultExtent;
		color: Color white;
		addMorph: (StringMorph new
			contents: 'click me or drag somthing over me';
			center: self center;
			yourself).