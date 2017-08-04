as yet unclassified
testLazyMorph: lazyMorph withBounds: wantedBounds 
	| prevBounds postBounds|
	(Imports default isCurrentlyLoading) ifTrue: [
		prevBounds := lazyMorph bounds.
		self assert: prevBounds equals: wantedBounds.
		Imports default finishLoading.
	
		self deny: Imports default isCurrentlyLoading.
		postBounds := lazyMorph bounds.
	
		self assert: postBounds equals: wantedBounds].