instance creation
fromFile: fileName withDimensions: dimensions

	^ (self new)
		columnsAndRows: dimensions;
		fileName: fileName;
		yourself.