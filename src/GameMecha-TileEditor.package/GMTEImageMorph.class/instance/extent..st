accessing
extent: anExtent
	"Override ImageMorph extent functionality. ALWAYS KEEPS RATIO"

	super extent: anExtent.
	self image: (self fullResolutionSprite scaledToSize: anExtent)