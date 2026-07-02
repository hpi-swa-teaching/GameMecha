event handling
resizeContentTo: aRectangle

	self contentIsCircle ifTrue: [ | size squareBounds |
		size := aRectangle width min: aRectangle height.
		squareBounds := aRectangle center - (size // 2) extent: size @ size.
		^ self content bounds: squareBounds].
	self content bounds: aRectangle