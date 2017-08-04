transformation
finalizeLoadingWith: anImage
	| scalingFactor |
	scalingFactor := self image extent / anImage extent.
	self image: (anImage magnifyBy: scalingFactor).