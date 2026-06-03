as yet unclassified
child: aSymbol
	"nil object?"
	^ self children detect: [:c | c symbol = aSymbol] ifNone: [^ nil]