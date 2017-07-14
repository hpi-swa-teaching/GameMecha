as yet unclassified
testLazyIO
	|formCounter formCounterBlock|
	formCounter := 0.
	formCounterBlock := [:tex | tex isForm ifTrue: [formCounter := formCounter + 1]].
	
	Imports default get: 'GMTest/res/img/img1.png' andDo: formCounterBlock.
	Imports default get: 'GMTest/res/img/sub/img2.png' andDo: formCounterBlock.
	
	self assert: ((formCounter == 0) or: [Imports default isCurrentlyLoading] or: [formCounter == 2]).
	
	[Imports default isCurrentlyLoading] whileTrue: [Processor yield].
	self assert: formCounter equals: 2.