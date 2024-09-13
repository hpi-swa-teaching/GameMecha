brushes
rectangleBrush

	| endCol endRow startCol startRow |
	self resetOutputSet.
    	self firstMatrixIndex ifNil: [^ nil].

	startRow := (self currentMatrixIndex x min: self firstMatrixIndex x).
	endRow := (self currentMatrixIndex x max: self firstMatrixIndex x).
	startCol := (self currentMatrixIndex y min: self firstMatrixIndex y).
	endCol := (self currentMatrixIndex y max: self firstMatrixIndex y).

	startRow to: endRow do: [:row |
 		startCol to: endCol do: [:col |
			self outputSet add: (row @ col)]].

    ^ self outputSet
