io
finishLoading: visualProgress
	"passing true here results in a visual progress bar that shows how mush still needs to get loaded"
	self isCurrentlyLoading
		ifTrue: [visualProgress ifTrue: [self displayProgress].
			self loadingLock wait].