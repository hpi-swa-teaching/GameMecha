as yet unclassified
initialize

	super initialize.
	tileSize := 100.
	bgColor := Color r: 0.15 g: 0.15 b: 0.15.
	gridColor := Color r: 0.25 g: 0.25 b: 0.25.
	self borderWidth: 0.
	self hResizing: #spaceFill.
	self vResizing: #spaceFill