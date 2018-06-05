accessing
corners
^ {1 @ 1. (-1) @ 1. 1 @ (-1). (-1) @ (-1)} collect: [:coefficient | 
		self owner center + ((self owner width / 2) @ (self owner height / 2) * coefficient)]