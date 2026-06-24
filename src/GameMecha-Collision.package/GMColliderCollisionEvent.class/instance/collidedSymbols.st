accessing
collidedSymbols

	| symbols |
	symbols := self reason ifNil: [OrderedCollection new] ifNotNil: [self reason collidedSymbols].
	self own symbol ifNotNil: [:symbol | symbols add: symbol].
	
	^ symbols