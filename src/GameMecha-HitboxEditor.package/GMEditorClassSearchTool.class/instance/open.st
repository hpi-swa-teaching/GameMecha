initialize
open

	window := SystemWindow new setLabel: 'Klassensuche'.
	allClasses := Smalltalk allClasses asSortedCollection: [:a :b | a name < b name].
	
	window := SystemWindow new setLabel: 'Klassensuche'.
	
	classList := PluggableListMorph
		on: self
		list: #currentList
		selected: #selectedIndex
		changeSelected: #selectedIndex:
		menu: nil.
	
	window addMorph: self searchField frame: (0 @ 0 corner: 1 @ 0.08).
	window addMorph: classList frame: (0 @ 0.08 corner: 1 @ 1).
	window openInWorld