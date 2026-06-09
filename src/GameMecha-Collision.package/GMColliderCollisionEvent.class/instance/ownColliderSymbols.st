accessing
ownColliderSymbols

	| symbols |
	symbols := Set new.
	self collectColliderSymbolsFor: #own into: symbols.
	
	^ symbols asArray