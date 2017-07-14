as yet unclassified
testPreloading
	|imports|
	imports := Imports new.
	
	self deny: (imports isLoaded: 'GMTest/img/img1.png').
	imports importDirectory: 'GMTest/img'. "only load the top-level folder"
	self assert: (imports isLoaded: 'GMTest/img/img1.png').
	self deny: (imports isLoaded: 'GMTest/img/sub/sub/img2.png').
	imports importDirectoryWithSubdirectories: 'GMTest/img/sub/sub/'.
	self assert: (imports isLoaded: 'GMTest/img/sub/sub/img3.png').
	self deny: (imports isLoaded: 'GMTest/img/sub/img2.png').
	imports importDirectoryWithSubdirectories: 'GMTest'. "recursively preload everything"
	self assert: (imports isLoaded: 'GMTest/img/sub/img2.png').