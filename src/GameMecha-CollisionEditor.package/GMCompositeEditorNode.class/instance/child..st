accessing
child: aSymbol

	^ self children detect: [:c | c symbol = aSymbol] ifNone: [^ GMNilEditorNode new]