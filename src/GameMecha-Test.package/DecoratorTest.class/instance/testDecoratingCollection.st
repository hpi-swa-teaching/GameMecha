as yet unclassified
testDecoratingCollection
	|d|
	d := Decorator wrap: OrderedCollection new.
	d add: 42.
	self assert: 1 equals: d size.
	self assert: 42 equals: (d at: 1).
	self assert: d equals: d wrappedObject.
	self should: [d fooBar] raise: MessageNotUnderstood.