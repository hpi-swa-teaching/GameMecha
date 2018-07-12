event handling
mouseEnterDragging: anEvent
	"Overwritten to handle the mouse entering the morph while pressing a mouse button."
	self borderColor: Color red.
	self borderWidth: 10.