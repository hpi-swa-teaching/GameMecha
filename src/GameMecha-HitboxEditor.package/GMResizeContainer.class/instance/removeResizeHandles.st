handels
removeResizeHandles

	resizeHandles do: [ :h | h delete ].
	resizeHandles removeAll.
	self borderColor: Color transparent
