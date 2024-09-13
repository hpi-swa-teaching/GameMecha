accessing
at: row at: column
	
	(self inBounds: column@row) ifFalse: [^ nil].
	^ super at: row at: column