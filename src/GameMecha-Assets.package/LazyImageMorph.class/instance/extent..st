transformation
extent: aPoint
	| form |
	form := self image.
	self image: (form magnifyBy: aPoint / form extent).  
	super extent: aPoint.