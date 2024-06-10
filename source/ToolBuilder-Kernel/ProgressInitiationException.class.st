"
I provide a way to alter the behavior of the old-style progress notifier in String. See examples in:

ProgressInitiationException testWithout.
ProgressInitiationException testWith.

"
Class {
	#name : #ProgressInitiationException,
	#superclass : #Notification,
	#instVars : [
		'workBlock',
		'maxVal',
		'minVal',
		'aPoint',
		'progressTitle'
	],
	#classVars : [
		'PreferredProgressBarPosition'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #signalling,
	#'squeak_changestamp' : 'cmm 6/14/2011 22:17'
}
ProgressInitiationException class >> display: aString at: aPoint from: minVal to: maxVal during: workBlock [ 
	^ self new
		display: aString
		at: (aPoint ifNil: [ self preferredProgressBarPoint ])
		from: minVal
		to: maxVal
		during: workBlock
]

{
	#category : #signalling,
	#'squeak_changestamp' : 'cmm 6/14/2011 19:15'
}
ProgressInitiationException class >> display: aString from: minVal to: maxVal during: workBlock [ 
	^ self
		display: aString
		at: nil
		from: minVal
		to: maxVal
		during: workBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cmm 6/15/2011 14:52'
}
ProgressInitiationException class >> preferredProgressBarPoint [
	^ self preferredProgressBarPosition = #cursorPoint
		ifTrue: [ Sensor cursorPoint ]
		ifFalse: [ UIManager default screenBounds perform: self preferredProgressBarPosition ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cmm 6/14/2011 22:19'
}
ProgressInitiationException class >> preferredProgressBarPosition [
	^ PreferredProgressBarPosition ifNil: [ #center ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cmm 6/15/2011 10:39'
}
ProgressInitiationException class >> preferredProgressBarPosition: aSymbol [ 
	"Specify any of:  #center, #topCenter, #bottomCenter, #leftCenter, #rightCenter, #topLeft, #topRight, #bottomLeft or #bottomRight or #cursorPoint."
	^ PreferredProgressBarPosition
]

{
	#category : #'examples and tests',
	#'squeak_changestamp' : 'cmm 6/15/2011 10:57'
}
ProgressInitiationException class >> testInnermost [

	"test the progress code WITHOUT special handling"

	^'Now here''s some Real Progress'
		displayProgressFrom: 0 
		to: 10
		during: [ :bar |
			1 to: 10 do: [ :x | 
				bar value: x. (Delay forMilliseconds: 500) wait.
				x = 5 ifTrue: [1/0].	"just to make life interesting"
			].
			'done'
		].


]

{
	#category : #'examples and tests',
	#'squeak_changestamp' : 'RAA 5/15/2000 12:42'
}
ProgressInitiationException class >> testWith [

	"test progress code WITH special handling of progress notifications"

	^[ self testWithAdditionalInfo ] 
		on: ProgressInitiationException
		do: [ :ex | 
			ex sendNotificationsTo: [ :min :max :curr |
				Transcript show: min printString,'  ',max printString,'  ',curr printString; cr
			].
		].

]

{
	#category : #'examples and tests',
	#'squeak_changestamp' : 'RAA 5/15/2000 12:04'
}
ProgressInitiationException class >> testWithAdditionalInfo [

	^{'starting'. self testWithout. 'really!'}
]

{
	#category : #'examples and tests',
	#'squeak_changestamp' : 'RAA 5/15/2000 15:45'
}
ProgressInitiationException class >> testWithout [

	"test the progress code WITHOUT special handling"

	^[self testInnermost]
		on: ZeroDivide
		do: [ :ex | ex resume]


]

{
	#category : #handling,
	#'squeak_changestamp' : 'cmm 10/17/2011 23:10'
}
ProgressInitiationException >> defaultAction [
	self resume
]

{
	#category : #handling,
	#'squeak_changestamp' : 'cmm 10/17/2011 23:10'
}
ProgressInitiationException >> defaultResumeValue [
	^ UIManager default
		displayProgress: progressTitle
		at: aPoint
		from: minVal
		to: maxVal
		during: workBlock
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'RAA 5/15/2000 11:43'
}
ProgressInitiationException >> display: argString at: argPoint from: argMinVal to: argMaxVal during: argWorkBlock [

	progressTitle := argString.
	aPoint := argPoint.
	minVal := argMinVal.
	maxVal := argMaxVal.
	workBlock := argWorkBlock.
	^self signal
]

{
	#category : #handling,
	#'squeak_changestamp' : 'nice 4/28/2021 21:05'
}
ProgressInitiationException >> resumeSuppressingProgress [
	"Catch and suppress every ProgressInitiationException and ProgressNotification
	during the evaluation of workBlock"

	^self resumeEvaluating:
		[self rearmHandlerDuring:
			[[workBlock value: [ :barVal | "do nothing"]]
				on: ProgressNotification do: [:e | e resume]]]
]

{
	#category : #handling,
	#'squeak_changestamp' : 'nice 5/6/2022 16:37'
}
ProgressInitiationException >> sendNotificationsTo: aNewBlock [
	"Resume execution using aNewBlock as workBlock value.
	Note that the execution is resumed in signalContext (or outerContext).
	This is done so that inner exception handlers be active during workBlock execution.
	However, our own handlerContext should be deactivated, unless explicitely rearmed."
	| mustDeactivateHandler |
	mustDeactivateHandler := handlerContext notNil and: [handlerContext isHandlerActive not].
	mustDeactivateHandler
		ifTrue:
			["The handlerContext is de-activated during handleSignal:
			But it will be reactivated during unwinding when we will resumeEvaluating:
			That's unwanted, we don't generally want to rearm the handler during workBlock evaluation.
			Hence we have to deactivate it again inside the deferred block."
			self resumeEvaluating:
				[handlerContext deactivateHandler.
				[workBlock value: [ :barVal |
					aNewBlock value: minVal value: maxVal value: barVal]]
						ensure: [handlerContext reactivateHandler]]]
		ifFalse:
			["If the handler is active at this step, then it must have been rearmed
			with a #rearmHandlerDuring:
			It's thus intentional to keep the handler active during workBlock evaluation
			But the ensure: [self disarmHandler] will be evaluated during unwinding when we will resumeEvaluating:
			It is thus necessary to rearm again inside the evaluated block"
			self resumeEvaluating:
				[self rearmHandlerDuring:
					[workBlock value: [ :barVal |
						aNewBlock value: minVal value: maxVal value: barVal]]]]
]
