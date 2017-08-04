transformation
extent: aPoint
	| form |
	"overrides super extent to make it possible to specify a wanted image size on object creation and scale holded images to that size instead of maybe not resizing the ImageMorph at all because the wanted and preferred extents aren't the same"
	form := self image.
	self image: (form magnifyBy: aPoint / form extent).  
	super extent: aPoint.