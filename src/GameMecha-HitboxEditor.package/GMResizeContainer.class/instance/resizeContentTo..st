event handling
resizeContentTo: aRectangle

	self contentIsCircle ifTrue: [ | size squareBounds |
		size := aRectangle width min: aRectangle height.
		squareBounds := aRectangle center - (size // 2) extent: size @ size.
		^ content bounds: squareBounds].
	content bounds: aRectangle