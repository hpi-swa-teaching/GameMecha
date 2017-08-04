as yet unclassified
testLazyMorph: lazyMorph
	| prevBounds postBounds|
	(Imports default isCurrentlyLoading) ifTrue: [
		prevBounds := lazyMorph bounds.
	
		Imports default finishLoading.
	
		self deny: Imports default isCurrentlyLoading.
		postBounds := lazyMorph bounds.
	
		self assert: postBounds equals: prevBounds.].