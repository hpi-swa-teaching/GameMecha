as yet unclassified
newOn: aDirectory onSheet: aPath  withRows: rows andColumns: columns
	^ self new
		resourceDirectory: aDirectory;
		spritePath: aPath;
		rows: rows;
		columns: columns;
		yourself.