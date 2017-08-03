transformation
finalizeLoadingWith: anImage
	"TODO find out, why magnifyBy: doesnt work or figure out its purpose"
	| scalingFactor |
	scalingFactor := self image extent / anImage extent.
	self image: (anImage magnify: anImage boundingBox by: scalingFactor).