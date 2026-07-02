handels
placeHandles

	self resizeHandles keysAndValuesDo: [ :pos :handle |
		handle center: (self perform: pos) ]
