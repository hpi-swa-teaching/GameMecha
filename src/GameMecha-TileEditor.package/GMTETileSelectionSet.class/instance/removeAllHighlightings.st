highlighting
removeAllHighlightings
	"Remove applied highlightings if any"
	
	self do: [:tile |
		self removeHighlightingVisuals: tile]