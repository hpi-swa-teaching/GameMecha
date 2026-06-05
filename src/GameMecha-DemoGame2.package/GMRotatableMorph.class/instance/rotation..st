accessing
rotation: aNumber

	self isRotated ifFalse: [
		self
			addFlexShell;
			isRotated: true].
	self owner angle: aNumber