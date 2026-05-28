accessing
selectedIndex: anIndex

	| name |
	selectedIndex := anIndex.
	(anIndex = 0 or: [anIndex > filteredClasses size]) ifTrue: [^ self].
	name := filteredClasses at: anIndex ifAbsent: [^ self].
	(Smalltalk at: name asSymbol ifAbsent: [nil]) ifNotNil: [:c | c browse]