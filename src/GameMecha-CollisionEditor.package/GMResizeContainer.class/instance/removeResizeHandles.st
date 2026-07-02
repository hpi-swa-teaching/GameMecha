handels
removeResizeHandles

	self resizeHandles do: [ :h | h delete ].
	self resizeHandles removeAll.
	self borderColor: Color transparent
