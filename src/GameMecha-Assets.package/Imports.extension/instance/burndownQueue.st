*GameMecha-Assets-Parallel
burndownQueue
	[self loadingQueue isEmpty]
		whileFalse: [ |first result|
			first := self loadingQueue first.
			self loadingQueue: self loadingQueue copyWithoutFirst.
			result := (self get: first key).
			self addToLoadedFileSize: (self fileSizeOf: first key).
			first value do: [:block | block value: result].
			Processor yield].