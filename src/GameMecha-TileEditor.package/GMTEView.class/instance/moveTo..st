updating
moveTo: anOrigin
	"Set origin but also respect view not overlapping reference view"

	self origin: (self correctedOrigin: anOrigin withExtent: self extent)
