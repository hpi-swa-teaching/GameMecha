event handling
mouseUp: anEvent
	| spawnArea |
	super mouseDown: anEvent.
	self extent: self class defaultExtent.
	spawnArea := self world extent - self extent.
	self position: spawnArea x random @ spawnArea y random.