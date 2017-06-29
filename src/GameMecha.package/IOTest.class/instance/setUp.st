as yet unclassified
setUp
	"create images to load"
	|img currentDirectory img1Path img2Path img3Path|
	GMTestSetUp setUp.
	img := ImageMorph new.
	rootDirectoryPath := 'GMTest'.
	currentDirectory := FileDirectory default.
	(currentDirectory / rootDirectoryPath) exists
		ifFalse: [currentDirectory createDirectory: rootDirectoryPath].
	currentDirectory := currentDirectory / rootDirectoryPath.
	(currentDirectory / 'res') exists
		ifFalse: [currentDirectory createDirectory: 'res'].
	currentDirectory := currentDirectory / 'res'.
	(currentDirectory / 'img') exists
		ifFalse: [currentDirectory createDirectory: 'img'].
	currentDirectory := currentDirectory / 'img'.
	(currentDirectory / 'sub') exists
		ifFalse: [currentDirectory createDirectory: 'sub'].
	currentDirectory := currentDirectory / 'sub'.
	(currentDirectory / 'sub') exists
		ifFalse: [currentDirectory createDirectory: 'sub'].
	currentDirectory := currentDirectory / 'sub'.
	
	img1Path := (FileDirectory default / rootDirectoryPath / 'res' / 'img').
	img2Path := (FileDirectory default / rootDirectoryPath / 'res' / 'img' / 'sub').
	img3Path := (FileDirectory default / rootDirectoryPath / 'res' / 'img' / 'sub' / 'sub').
	
	(img1Path fileExists: 'img1.png')
		ifFalse: [img exportAsPNGNamed: (img1Path / 'img1.png') fullName].
	(img2Path fileExists: 'img2.png')
		ifFalse: [img exportAsPNGNamed: (img2Path / 'img2.png') fullName].
	(img3Path fileExists: 'img3.png')
		ifFalse: [img exportAsPNGNamed: (img3Path / 'img3.png') fullName].