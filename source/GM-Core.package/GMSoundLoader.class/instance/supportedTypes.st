accessing
supportedTypes
	^ supportedTypes ifNil: [supportedTypes := Dictionary newFrom: 
		{'wav' -> [:filename | SampledSound fromWaveFileNamed: filename].
		'aiff' -> [:filename | SampledSound fromAIFFfileNamed: filename]}]