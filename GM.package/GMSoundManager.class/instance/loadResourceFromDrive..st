as yet unclassified
loadResourceFromDrive: aFilename
	^ SampledSound fromWaveFileNamed: (FileDirectory uri: aFilename) fullName