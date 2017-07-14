*GameMecha-Animations
fileSizeOf: fileName
	|n|
	n := self normalizeFileName: fileName.
	FileDirectory splitName: n to: [:dir :file | ^((FileDirectory on: dir) fileNamed: file) size].