accessing
addBindingFromKeys: oneOrMultipleKeyCodes as: anAction
	|binding|
	binding := KeyBinding new.
	binding label: anAction asString.
	(oneOrMultipleKeyCodes allSatisfy: [:element | element isCollection]) 
		ifTrue: [oneOrMultipleKeyCodes do: [:key | binding bindToKey: key]]
		ifFalse: [binding bindToKey: oneOrMultipleKeyCodes].
	self bindings add: anAction -> binding.