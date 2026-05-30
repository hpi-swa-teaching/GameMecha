accessing
selectedIndex

	^ (selectedIndex isNil or: [selectedIndex > filteredClasses size]) ifTrue: [0] ifFalse: [selectedIndex]