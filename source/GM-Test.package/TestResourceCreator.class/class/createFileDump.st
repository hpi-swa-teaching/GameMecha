utility
createFileDump
	| output |
	output := WriteStream on: ''.
	(GMSoundManager instance cache at: 'squeak.wav') storeOn: output.
		(FileDirectory new
		forceNewFileNamed: ((FileDirectory uri: 'testingResources\output.txt') name))
			nextPutAll: (output contents);
			close.
