running
setUp
	| output |
	self imageManager: GMImageManager instance.
	output := (WriteStream on:'').
	(GMImageManager instance getImageForm: 'squeak.png' ) storeOn: output.
	(FileDirectory new forceNewFileNamed: ((FileDirectory uri: 'testingResources\output.txt') name))
		nextPutAll: (output contents);
		close.