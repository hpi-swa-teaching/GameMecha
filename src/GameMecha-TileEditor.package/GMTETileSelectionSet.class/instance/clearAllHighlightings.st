highlighting
clearAllHighlightings
	"Clear tile selection and remove applied highlightings if any"
	
	self do: [:tile |
		self removeHighlightingVisuals: tile].
	self removeAll