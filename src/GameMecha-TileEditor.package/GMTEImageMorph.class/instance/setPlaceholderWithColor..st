updating
setPlaceholderWithColor: aColor
	"Set a placeholder form with aColor"

	| placeholderForm |
	placeholderForm := Form extent: self extent depth: GMTEImageMorph placeholderDepth.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm