adding/removing
addEntry: anEntry

	|occurence symbol entry|
	
	symbol := anEntry class name. 
	entry := symbol asString.
	
	occurence := 1 +  (self symbolBag occurrencesOf: entry).
	entry :=   entry, ' ' , (occurence asString).	
	
	self symbolBag add: symbol.
	self entryBag add: anEntry.
	self addMorphBack: (TextMorph new contents: entry )