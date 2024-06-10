Extension { #name : #String }

{
	#category : #'*toolbuilder-kernel',
	#'squeak_changestamp' : 'RAA 5/15/2000 11:00'
}
String >> displayProgressAt: aPoint from: minVal to: maxVal during: workBlock [ 
	"Display this string as a caption over a progress bar while workBlock is evaluated.

EXAMPLE (Select next 6 lines and Do It)
'Now here''s some Real Progress'
	displayProgressAt: Sensor cursorPoint
	from: 0 to: 10
	during: [:bar |
	1 to: 10 do: [:x | bar value: x.
			(Delay forMilliseconds: 500) wait]].

HOW IT WORKS (Try this in any other language :-)
Since your code (the last 2 lines in the above example) is in a block,
this method gets control to display its heading before, and clean up 
the screen after, its execution.
The key, though, is that the block is supplied with an argument,
named 'bar' in the example, which will update the bar image every 
it is sent the message value: x, where x is in the from:to: range.
"
	^ProgressInitiationException 
		display: self
		at: aPoint 
		from: minVal 
		to: maxVal 
		during: workBlock
]

{
	#category : #'*toolbuilder-kernel',
	#'squeak_changestamp' : 'cmm 6/14/2011 22:21'
}
String >> displayProgressFrom: minVal to: maxVal during: workBlock [ 
	"Display this string as a caption over a progress bar while workBlock is evaluated.

EXAMPLE (Select next 6 lines and Do It)
'Now here''s some Real Progress'
	displayProgressFrom: 0 to: 10
	during: [:bar |
	1 to: 10 do: [:x | bar value: x.
			(Delay forMilliseconds: 500) wait]]."
	^ self
		displayProgressAt: nil
		from: minVal
		to: maxVal
		during: workBlock
]

{
	#category : #'*toolbuilder-kernel',
	#'squeak_changestamp' : 'tfel 8/29/2016 15:54'
}
String >> displaySequentialProgress: aBlock [ 
	"
	'This takes some time...' displaySequentialProgress: [
		(Delay forMilliseconds: 500) wait.
		ProgressNotification signal: 0.1 extra: 'just starting'.
		(Delay forMilliseconds: 500) wait.
		ProgressNotification signal: 0.5.
		(Delay forMilliseconds: 500) wait.
		ProgressNotification signal: '1.0' extra: 'done'.
		(Delay forMilliseconds: 500) wait.
	]
	"
	ProgressInitiationException
		display: self
		from: 0 to: 1
		during: [:bar | aBlock
				on: ProgressNotification
				do: [:e | 
					bar value: e messageText asNumber.
					e extraParam: self, (e extraParam ifNil: ['']).
					e pass]].

]

{
	#category : #'*toolbuilder-kernel',
	#'squeak_changestamp' : 'mt 1/25/2018 08:12'
}
String >> edit [

	UIManager default edit: self.
]

{
	#category : #'*toolbuilder-kernel',
	#'squeak_changestamp' : 'eem 1/25/2018 07:23'
}
String >> editWithLabel: label [

	UIManager default edit: self label: label
]
