storing
storeChecksInInstanceOf: aClass
	"meta-programming warning"
	self cleanupClass: aClass.
	aClass organization addCategory: self generatedTestCategory.
	aClass class compile: (String streamContents: [:str |
		str nextPutAll: 'collisionSelectors' , String cr, String tab , '^ {'.
		self collisionChecks
			do: [:check |
				str nextPutAll: (self methodSelectorStringForCheck: check). str nextPutAll: '.', String cr, String tab.
				aClass compile: (self methodStringForCheck: check), ' ', check.
				aClass organization classify: (self methodStringForCheck: check) under: self generatedTestCategory].
		str nextPut: $}]).