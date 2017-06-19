as yet unclassified
setUp
	"create images to load"
	|img dir img1Path img2Path|
	img := ImageMorph new.
	dir := FileDirectory default.
	(dir / 'GMTest') exists
		ifFalse: [dir createDirectory: 'GMTest'].
	dir := dir / 'GMTest'.
	(dir / 'res') exists
		ifFalse: [dir createDirectory: 'res'].
	dir := dir / 'res'.
	(dir / 'img') exists
		ifFalse: [dir createDirectory: 'img'].
	dir := dir / 'img'.
	(dir / 'sub') exists
		ifFalse: [dir createDirectory: 'sub'].
	dir := dir / 'sub'.
	
	img1Path := (FileDirectory default / 'GMTest' / 'res' / 'img').
	img2Path := (FileDirectory default / 'GMTest' / 'res' / 'img' / 'sub').
	
	(img1Path fileExists: 'img1.png')
		ifFalse: [img exportAsPNGNamed: (img1Path / 'img1.png') fullName].
	(img2Path fileExists: 'img2.png')
		ifFalse: [img exportAsPNGNamed: (img2Path / 'img2.png') fullName].
	