accessing
supportedTypes
	^ Dictionary newFrom: 
		{'wav' -> [:filename | SampledSound fromWaveFileNamed: filename].
		'aiff' -> [:filename | SampledSound fromAIFFfileNamed: filename]}