as yet unclassified
testBadSquekMultithreating
	|cache formCounter formCounterBlock timeStamp elapsed |
	formCounter := 0.
	cache := ImageCache newOn: 'HOP'.
	formCounterBlock := [:tex | tex isForm ifTrue: [formCounter := formCounter + 1]].
	
	cache getTexture: 'baum01.jpg' andDo: formCounterBlock.

	Transcript show: 'hello'.	
	timeStamp := DateAndTime now.
	(Delay forMilliseconds: 1) wait.		

		elapsed := ((DateAndTime now) - timeStamp) asMilliSeconds.
	self assert: elapsed < 50.
		Transcript show: ' you'.