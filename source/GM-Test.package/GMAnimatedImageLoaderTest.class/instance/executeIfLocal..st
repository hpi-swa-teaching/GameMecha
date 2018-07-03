as yet unclassified
executeIfLocal: aBlock
	self class testRunsLocally ifTrue: [aBlock value].