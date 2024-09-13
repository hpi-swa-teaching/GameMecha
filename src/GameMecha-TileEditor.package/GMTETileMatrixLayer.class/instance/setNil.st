removing
setNil

	1 to: self rowCount do: [:row |
   		1 to: self columnCount do: [:col | self at: row at: col put: nil]]