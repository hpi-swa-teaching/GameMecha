accessing
rotation: aNumber

	(self isRotated not and: [aNumber abs >= 1.0e-10]) ifTrue: [
		self
			addFlexShell;
			isRotated: true].
	self owner angle: aNumber degreesToRadians