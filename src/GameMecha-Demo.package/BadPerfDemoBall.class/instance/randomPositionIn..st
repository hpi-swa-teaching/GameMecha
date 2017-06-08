as yet unclassified
randomPositionIn: bounds

	self x: (Random new next)*((bounds width) - 50) + (bounds origin x) + 25.
	self y: (Random new next)*((bounds height) - 50) + (bounds origin y) + 25.