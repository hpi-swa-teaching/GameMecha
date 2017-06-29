accessing
getSpriteAtIndex: index
	^self 
		getSpriteAtColumn: (index - 1) \\ self columns + 1
		andRow: ((index - 1) / self columns) floor + 1.