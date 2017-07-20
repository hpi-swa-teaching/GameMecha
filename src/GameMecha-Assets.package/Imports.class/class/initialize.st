initialize
initialize
	super initialize.
	self imageExtensions: ((ImageReadWriter allTypicalFileExtensions add: 'form';
				 yourself)
				collect: [:ex | '.' , ex]).