private
rows: aNumber1 columns: aNumber2

	| newMatrix |
	newMatrix := super rows: aNumber1 columns: aNumber2.
	^ newMatrix coordinateSystem: (GMTECoordinateSystem 
		width: newMatrix columnCount 
		height: newMatrix rowCount)