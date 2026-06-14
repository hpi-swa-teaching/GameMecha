test cases
testAddAndRemoveChild

	| composite extra |
	composite := self buildCompositeCollider.
	extra := GMPrimitiveCircleCollider new
		radius: 5;
		yourself.
	composite addChild: extra.
	self assert: [composite children includes: extra].
	composite removeChild: extra.
	self deny: [composite children includes: extra]