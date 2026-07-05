initialize-release
open

	| classList |
	classList := PluggableListMorph
		on: self
		list: #currentList
		selected: #selectedIndex
		changeSelected: #selectedIndex:
		menu: nil.
	
	self
		window: (SystemWindow new
			setLabel: 'class search';
			addMorph: self searchField frame: (0 @ 0 corner: 1 @ 0.08);
			addMorph: classList frame: (0 @ 0.08 corner: 1 @ 1));
		allClasses: (Smalltalk allClasses asSortedCollection: [:a :b | a name < b name]).
	self window openInWorld