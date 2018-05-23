utility
createFileDump
	| output |
	output := (GMSoundManager instance cache at: 'squeak.wav') samples asByteArray readStream.
		(FileDirectory new
		forceNewFileNamed: ((FileDirectory uri: 'testingResources\output.txt') name))
			nextPutAll: 	output contents;
			close.
