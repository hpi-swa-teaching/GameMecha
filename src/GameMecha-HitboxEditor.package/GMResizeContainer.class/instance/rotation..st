accessing
rotation: aNumber

	self isRotated ifFalse: [
		self addFlexShell.
		self isRotated: true].
	"self content rotation: aNumber."
	self owner angle: aNumber degreesToRadians
