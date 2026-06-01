accessing
symbolBag
"this stores the names of our morphs"
	^symbolBag ifNil: [symbolBag := Bag new]