initialize
searchField

	searchField := GMEditorSearchField new.
	searchField actionBlock: [:text | | query |
		query := text asString asLowercase withBlanksTrimmed.
		filteredClasses := query isEmpty
			ifTrue: [allClasses collect: [:c | c name]]
			ifFalse: [(allClasses select: [:c | c name asString asLowercase includesSubstring: query]) collect: [:c | c name]].
		self changed: #currentList].
	^searchField