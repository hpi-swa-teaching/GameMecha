adding/removing
addEntry: anEntry

	| entry |
	entry := anEntry class name asString.
	self entries add: anEntry.
	self addMorphBack: (TextMorph new contents: entry)