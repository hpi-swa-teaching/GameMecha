as yet unclassified
testBadSquekMultithreating
	"|cache formCounter formCounterBlock timeStamp elapsed |
	formCounter := 0.
	cache := ImageCache newOn: 'GMTest'.
	formCounterBlock := [:tex | tex isForm ifTrue: [formCounter := formCounter + 1]].
	
	cache getTexture: 'smile.png' andDo: formCounterBlock.

	Transcript show: 'hello'.	
	timeStamp := DateAndTime now.
	(Delay forMilliseconds: 1) wait.		

		elapsed := ((DateAndTime now) - timeStamp) asMilliSeconds."
	"TODO this test does not work!"
	"self assert: elapsed < 50.
		Transcript show: ' you'.".