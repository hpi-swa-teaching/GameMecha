updating
updateSprite: anImage
	"Update sprite by also carrying the fullResolutionSprite"

	self 
		fullResolutionSprite: anImage;
		extent: self extent