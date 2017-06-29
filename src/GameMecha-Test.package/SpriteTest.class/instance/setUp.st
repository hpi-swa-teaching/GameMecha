as yet unclassified
setUp
	"create images to load"
	"| currentDirectory |
	rootDirectoryPath := 'GMSpriteTest'.
	currentDirectory := FileDirectory default.
	(currentDirectory / rootDirectoryPath) exists
		ifFalse: [currentDirectory createDirectory: rootDirectoryPath].
	".