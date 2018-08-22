event handling
mouseUp: anEvent
	"Overwritten to handle the button up event for a mouse button."
	| spawnArea |
	super mouseUp: anEvent.
	self extent: self class defaultExtent.
	spawnArea := self world extent - self extent.
	self position: spawnArea x random @ spawnArea y random.