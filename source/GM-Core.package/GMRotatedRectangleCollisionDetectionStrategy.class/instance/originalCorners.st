accessing
originalCorners
	self flag: #refactor.
	^ {1 @ 1. (-1) @ 1. 1 @ (-1). (-1) @ (-1)} collect: [:coefficient | 
		self originalRectangle center + ((self originalRectangle width / 2) @ (self originalRectangle height / 2) * coefficient)]