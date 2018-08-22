initialization
initialize
	super initialize.
	self 
		extent: self class defaultExtent;
		stringMorph: StringMorph new;
		addMorph: self stringMorph.