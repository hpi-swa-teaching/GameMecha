handels
placeHandles

	resizeHandles keysAndValuesDo: [ :pos :handle |
		handle center: (self perform: pos) ]
