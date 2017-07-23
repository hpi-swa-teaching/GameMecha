instance creation
fromFile: fileName rows: rows columns: columns
	^ (self new)
		columnsAndRows: columns@rows;
		fileName: fileName;
		yourself.