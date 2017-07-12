instance creation
fromFile: fileName withDimensions: dimensions
	^ (self new)
		columsAndRows: dimensions;
		fileName: fileName;
		yourself.