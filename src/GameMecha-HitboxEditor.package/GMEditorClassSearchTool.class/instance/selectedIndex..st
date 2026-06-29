accessing
selectedIndex: anIndex

	| name |
	selectedIndex := anIndex.
	(anIndex = 0 or: [anIndex > filteredClasses size]) ifTrue: [^ self].
	name := filteredClasses at: anIndex ifAbsent: [^ self].
	target ifNotNil: [target perform: actionSelector with: name asSymbol].
	window delete