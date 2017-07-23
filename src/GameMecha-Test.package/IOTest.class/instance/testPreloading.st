as yet unclassified
testPreloading
	|imports|
	imports := Imports new.
	
	self deny: (imports isLoaded: 'GMTest/res/img/img1.png').
	imports importDirectory: 'GMTest/res/img'. "only load the top-level folder"
	self assert: (imports isLoaded: 'GMTest/res/img/img1.png').
	self deny: (imports isLoaded: 'GMTest/res/img/sub/sub/img2.png').
	imports importDirectoryWithSubdirectories: 'GMTest/res/img/sub/sub/'.
	self assert: (imports isLoaded: 'GMTest/res/img/sub/sub/img3.png').
	self deny: (imports isLoaded: 'GMTest/res/img/sub/img2.png').
	imports importDirectoryWithSubdirectories: 'GMTest/res'. "recursively preload everything"
	self assert: (imports isLoaded: 'GMTest/res/img/sub/img2.png').