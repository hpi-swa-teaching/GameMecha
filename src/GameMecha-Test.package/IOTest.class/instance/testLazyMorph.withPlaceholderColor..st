as yet unclassified
testLazyMorph: lazyMorph withPlaceholderColor: placeholderColor
	| prevBounds postBounds |
	(Imports default isCurrentlyLoading) ifTrue: [
		prevBounds := lazyMorph bounds.
		
		self assert: lazyMorph image equals: (Form new fill: prevBounds fillColor: placeholderColor). 
		Imports default finishLoading.
	
		self deny: Imports default isCurrentlyLoading.
		postBounds := lazyMorph bounds.
		
		self assert: postBounds equals: prevBounds].