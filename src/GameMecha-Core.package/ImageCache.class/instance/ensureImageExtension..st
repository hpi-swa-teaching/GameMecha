io
ensureImageExtension: path
	^ ('*.*' match: path)
		ifTrue: [path]
		ifFalse: [path, '.png'].