initialize
initialize

	selectedIndex := 0.
	filteredClasses := #().
	searchString := ''.
	allClasses := Smalltalk allClasses asSortedCollection: [:a :b | a name < b name].
	filteredClasses := allClasses collect: [:c | c name]