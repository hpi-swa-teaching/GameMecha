as yet unclassified
drawOn: aCanvas

	| w h x y |
	w := self width.
	h := self height.
	
	"Hintergrund"
	aCanvas fillRectangle: self bounds color: bgColor.
	
	"Vertikale Linien - immer ab 0"
	x := 0.
	[x <= w] whileTrue: [
		aCanvas line: self left + x @ self top to: self left + x @ self bottom width: 1 color: gridColor.
		x := x + tileSize].
	
	"Horizontale Linien - immer ab 0"
	y := 0.
	[y <= h] whileTrue: [
		aCanvas line: self left @ (self top + y) to: self right @ (self top + y) width: 1 color: gridColor.
		y := y + tileSize]