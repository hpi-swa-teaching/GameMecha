brushes
fillBrush

	| startTile visited |
	self resetOutputSet.
	
	visited := Matrix rows: (self layer rowCount) columns: self layer columnCount.
	startTile := self layer at: self currentMatrixIndex y at: self currentMatrixIndex x.
	
	self outputSet add: self currentMatrixIndex.
	visited at: self currentMatrixIndex y at: self currentMatrixIndex x put: true.
	
	self fillDfsWithVisited: visited andIndex: self currentMatrixIndex andOriginTile: startTile.

    ^ self outputSet