initialization
initialize
	super initialize.
	self
		extent: self class defaultExtent;
		color: Color white;
		addMorph: (StringMorph new
			contents: 'click me';
			center: self center;
			yourself).