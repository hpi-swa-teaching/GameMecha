as yet unclassified
open

	self initialize.
	window := SystemWindow new setLabel: 'Klassensuche'.
	allClasses := Smalltalk allClasses asSortedCollection: [:a :b | a name < b name].
	
	window := SystemWindow new setLabel: 'Klassensuche'.
	
	searchField := GMEditorSearchField new.
	searchField actionBlock: [:text | | query |
		query := text asString asLowercase withBlanksTrimmed.
		filteredClasses := query isEmpty
			ifTrue: [allClasses collect: [:c | c name]]
			ifFalse: [(allClasses select: [:c | c name asString asLowercase includesSubstring: query]) collect: [:c | c name]].
		self changed: #currentList].
	
	"Korrekte PluggableListMorph-Initialisierung"
	classList := PluggableListMorph
		on: self
		list: #currentList
		selected: #selectedIndex
		changeSelected: #selectedIndex:
		menu: nil.
	
	window addMorph: searchField frame: (0 @ 0 corner: 1 @ 0.08).
	window addMorph: classList frame: (0 @ 0.08 corner: 1 @ 1).
	window openInWorld