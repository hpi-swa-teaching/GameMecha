instance creation
fromFile: fileName rows: rows colums: columns
	^ self fromFile: fileName withDimensions: columns@rows.