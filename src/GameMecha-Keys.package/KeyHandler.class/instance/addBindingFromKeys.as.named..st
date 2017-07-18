accessing
addBindingFromKeys: oneOrMultipleKeyCodes as: anAction named: aString
	|binding|
	binding := KeyBinding new.
	binding label: aString.
	(oneOrMultipleKeyCodes allSatisfy: [:element | element isCollection]) 
		ifTrue: [oneOrMultipleKeyCodes do: [:key | binding bindToKey: key]]
		ifFalse: [binding bindToKey: oneOrMultipleKeyCodes].
	self bindings add: anAction -> binding.