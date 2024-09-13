building
onClose
	"asks the user whether they want to save their progress"
	
	self savedSinceModified
		ifFalse: [(PopUpMenu confirm: 'Save before closing?')
			ifTrue: [self exportAsMorph]]