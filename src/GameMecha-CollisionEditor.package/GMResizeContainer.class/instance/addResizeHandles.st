handels
addResizeHandles
 
	self hasHandles ifTrue: [ ^ self ].
	#(topLeft topRight bottomLeft bottomRight) do: [ :pos |
		self addHandleAt: pos ].
	self placeHandles.