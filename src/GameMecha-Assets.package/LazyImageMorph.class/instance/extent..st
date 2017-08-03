transformation
extent: aPoint
	| form |
	form := self image.
	self image: (form magnify: form boundingBox by: aPoint / form extent).  
	super extent: aPoint.