brushes
radiusBrush

	(self calculateOffsetsForRadius: self offsetCorrectedRadius) do: [:i | 
		self outputSet add: (self currentMatrixIndex + i)].

    ^ self outputSet
