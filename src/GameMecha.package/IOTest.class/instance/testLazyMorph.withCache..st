as yet unclassified
testLazyMorph: lazyMorph withCache: cache
	| prevBounds postBounds|
	(cache isCurrentlyLoading) ifTrue: [
		self deny: lazyMorph isImageMorph.
		prevBounds := lazyMorph bounds.
	
		cache finishLoading.
	
		self deny: cache isCurrentlyLoading.
		postBounds := lazyMorph bounds.
		self assert: lazyMorph isImageMorph.
	
		self assert: postBounds equals: prevBounds.].