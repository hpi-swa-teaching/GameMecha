io
burndownQueue
	[self loadingQueue isEmpty]
		whileFalse: [
			|first|
			first := self loadingQueue first.
			self loadingQueue: self loadingQueue copyWithoutFirst.
			first value do: [:block | block value: (self get: first key)]].