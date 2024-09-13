instance creation
width: aWidth height: aHeight
	"comment stating purpose of message"

	| newCoordinateSystem |
	newCoordinateSystem := self new.
	
	^ newCoordinateSystem
		width: aWidth;
		height: aHeight;
		origin: ((aWidth / 2) ceiling) @ ((aHeight / 2) ceiling);
		definitionArea: (Interval 
			from: newCoordinateSystem origin x negated + 1
			 to: aWidth - newCoordinateSystem origin x);
		valueArea: (Interval
			from: newCoordinateSystem origin y negated + 1
			to: aHeight - newCoordinateSystem origin y)