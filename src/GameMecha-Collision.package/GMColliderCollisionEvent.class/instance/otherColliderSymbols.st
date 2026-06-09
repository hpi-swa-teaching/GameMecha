accessing
otherColliderSymbols

	| symbols |
	symbols := Set new.
	self collectColliderSymbolsFor: #other into: symbols.
	
	^ symbols asArray