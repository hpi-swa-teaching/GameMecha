updating
setPlaceholderWithExtent: anExtent color: aColor
	"Set a placeholder form with anExtent and aColor"

	| placeholderForm |
	placeholderForm := Form extent: anExtent depth: GMTEImageMorph placeholderDepth.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm