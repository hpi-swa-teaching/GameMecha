obstacle
fetchPreviousBounds
	"TODO Look if PasteUpMorph resizing / moving causes Bugs here"
	"set the old bounds to the current ones. This conceptually starts a new moving cycle. You should only call this method, once all obstacle-collisions are resolved."
	self previousBounds: self target bounds copy.