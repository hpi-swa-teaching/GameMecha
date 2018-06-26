initialization
initialize
	super initialize.
	self extent: self class defalutExtent.
	self stringMorph: StringMorph new.
	self addMorph: self stringMorph.