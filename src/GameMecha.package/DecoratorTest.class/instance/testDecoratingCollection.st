basic
testDecoratingCollection
	|d|
	d := Decorator wrap: OrderedCollection new.
	d add: 42.
	self assert: 1 equals: d size.
	self assert: 42 equals: (d first).
	self deny: (d = d wrappedObject).
	self assert: (d yourself) equals:d.
	self should: [d fooBar] raise: MessageNotUnderstood.
	self assert: (d add: 1)equals:1.
	self assert: (d do: [:a]) equals: d. 