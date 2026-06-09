traversal
collectColliderSymbolsFor: side into: aCollection

	| collider |
	collider := side = #own ifTrue: [self own] ifFalse: [self other].
	collider ifNotNil: [aCollection add: collider symbol].
	self reason ifNotNil: [self reason collectColliderSymbolsFor: side into: aCollection]