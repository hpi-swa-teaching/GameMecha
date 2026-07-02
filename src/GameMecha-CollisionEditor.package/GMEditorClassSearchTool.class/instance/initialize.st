initialize
initialize

	self
		selectedIndex: 0;
		filteredClasses: #();
		searchString: '';
		allClasses: ((Smalltalk allClasses select: [:c | c includesBehavior: Morph]) asSortedCollection: [:a :b | a name < b name]);
		filteredClasses: (self allClasses collect: [:c | c name])