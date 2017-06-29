io
getSizeFor: path
	^ (self getResourceAsStream: (self ensureImageExtension: path)) size.