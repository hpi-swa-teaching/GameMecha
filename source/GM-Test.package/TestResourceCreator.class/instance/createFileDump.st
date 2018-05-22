as yet unclassified
createFileDump
	| output |
	output := (WriteStream on:'').
	(GMImageManager instance getImageForm: 'squeak2.gif' ) storeOn: output.
	(FileDirectory new
		forceNewFileNamed: ((FileDirectory uri: 'testingResources\output.txt') name))
			nextPutAll: (output contents);
			close.