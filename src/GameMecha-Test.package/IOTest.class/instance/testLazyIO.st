as yet unclassified
testLazyIO
	|cache formCounter formCounterBlock|
	formCounter := 0.
	cache := ImageCache newOn: 'GMTest/res'.
	formCounterBlock := [:tex | tex isForm ifTrue: [formCounter := formCounter + 1]].
	
	cache getTexture: 'img/img1.png' andDo: formCounterBlock.
	cache getTexture: 'img/sub/img2.png' andDo: formCounterBlock.
	
	self assert: cache isCurrentlyLoading.
	(Delay forMilliseconds: 100) wait.
	"self assert: ((formCounter == 2) xor: cache isCurrentlyLoading).
	cache finishLoading."
	self deny: cache isCurrentlyLoading.