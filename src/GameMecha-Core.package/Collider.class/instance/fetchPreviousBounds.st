obstacle
fetchPreviousBounds
	"set the old bounds to the current ones. This conceptually starts a new moving cycle. You should only call this method, once all obstacle-collisions are resolved."
	self previousBounds: self bounds copy.