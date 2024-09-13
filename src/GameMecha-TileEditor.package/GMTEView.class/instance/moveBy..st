updating
moveBy: aPoint
	"Move origin but also respect view not overlapping reference view"

	self origin: (self correctedOrigin: (self origin + aPoint) withExtent: self extent)