as yet unclassified
testLazyIO
	|imports formCounter formCounterBlock|
	imports := Imports new.
	formCounter := 0.
	formCounterBlock := [:tex | tex isForm ifTrue: [formCounter := formCounter + 1]].
	
	imports get: 'GMTest/res/img/img1.png' andDo: formCounterBlock.
	imports get: 'GMTest/res/img/sub/img2.png' andDo: formCounterBlock.
	
	self assert: ((formCounter == 0) or: [imports isCurrentlyLoading] or: [formCounter == 2]).
	
	[imports isCurrentlyLoading] whileTrue: [Processor yield].
	self assert: formCounter equals: 2.