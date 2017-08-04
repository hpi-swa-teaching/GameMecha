parallel
burndownQueue
	[self loadingQueue isEmpty]
		whileFalse: [ |first result|
			first := self loadingQueue first.
			Processor yield.
			result := (self get: first key).
			self addToLoadedFileSize: (self fileSizeOf: first key).
			self loadingQueue: self loadingQueue copyWithoutFirst.
			first value do: [:block | block value: result].
			Processor yield].