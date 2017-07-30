as yet unclassified
testLazyMorph: lazyMorph
	| prevBounds postBounds|
	(Imports default isCurrentlyLoading) ifTrue: [
		"self deny: lazyMorph isImageMorph."
		"TODO find good new still-loading test"
		prevBounds := lazyMorph bounds.
	
		Imports default finishLoading.
	
		self deny: Imports default isCurrentlyLoading.
		postBounds := lazyMorph bounds.
		"self assert: lazyMorph isImageMorph."
	
		self assert: postBounds equals: prevBounds.].