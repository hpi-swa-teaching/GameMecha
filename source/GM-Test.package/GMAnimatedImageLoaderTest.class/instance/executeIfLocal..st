as yet unclassified
executeIfLocal: aBlock
	self runsLocally ifTrue: [aBlock value].