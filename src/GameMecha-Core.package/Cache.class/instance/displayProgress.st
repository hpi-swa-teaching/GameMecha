io
displayProgress
	'Loading assets...'
		displayProgressAt: Sensor cursorPoint
		from: 0 to: 1
		during: [:bar | 
			[self isCurrentlyLoading]
				whileTrue: [bar value: self progress. Processor yield]].