brushes
lineBrush

	self resetOutputSet.
	self firstMatrixIndex ifNil: [^ nil].

	(self rasterizeLineBetweenStart: self firstMatrixIndex andEnd: self currentMatrixIndex) do: [:index |
		(self calculateOffsetsForRadius: self offsetCorrectedRadius) do: [:offset | 
			self outputSet add: (index + offset)]].

	^ self outputSet
