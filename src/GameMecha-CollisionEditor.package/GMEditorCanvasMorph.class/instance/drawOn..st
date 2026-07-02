drawing
drawOn: aCanvas

	| cx cy step |
	aCanvas fillRectangle: self bounds color: self backgroundColor.
	
	aCanvas clipBy: self bounds during: [:clipped |
		cx := self bounds center x.
		cy := self bounds center y.
		step := self tileSize.
		
		"Center to Right Edge"
		cx
			to: self right
			by: step
			do: [:x | clipped line: x @ self top to: x @ self bottom width: 1 color: self gridColor].
		
		"Center to Left Edge"
		cx
			to: self left
			by: step negated
			do: [:x | clipped line: x @ self top to: x @ self bottom width: 1 color: self gridColor].
		
		"Center to Bottom Edge"
		cy
			to: self bottom
			by: step
			do: [:y | clipped line: self left @ y to: self right @ y width: 1 color: self gridColor].
		
		"Center to Top Edge"
		cy
			to: self top
			by: step negated
			do: [:y | clipped line: self left @ y to: self right @ y width: 1 color: self gridColor]]