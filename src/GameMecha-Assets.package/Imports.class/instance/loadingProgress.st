parallel
loadingProgress
	self loadingProgressValues value = 0
		ifTrue: [^ 0].
	^ self loadingProgressValues key / self loadingProgressValues value.