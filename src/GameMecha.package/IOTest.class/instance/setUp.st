as yet unclassified
setUp
	"create images to load"
	|img dir|
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
	
	((FileDirectory default / 'GMTest' / 'res' / 'img') fileExists: 'img1.png')
		ifFalse: [img exportAsPNGNamed: 'GMTest/res/img/img1.png'].
	((FileDirectory default / 'GMTest' / 'res' / 'img' / 'sub') fileExists: 'img2.png')
		ifFalse: [img exportAsPNGNamed: 'GMTest/res/img/sub/img2.png'].
	