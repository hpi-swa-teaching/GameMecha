accessing
entryBag
"this keeps all the objects in the list"
	^entryBag ifNil:[entryBag := Bag new]