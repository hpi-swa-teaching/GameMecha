Class {
	#name : #GMClickEvent,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'GameMecha-Test'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 16:02'
}
GMClickEvent class >> atPosition: aPos [
	^ GMClickEvent new position: aPos; yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 16:04'
}
GMClickEvent >> cursorPoint [
	^self position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 15:58'
}
GMClickEvent >> isMouse [
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 16:02'
}
GMClickEvent >> position [
	^position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 16:03'
}
GMClickEvent >> position: aPos [
	position := aPos.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 15:58'
}
GMClickEvent >> redButtonPressed [
	^false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 15:57'
}
GMClickEvent >> shiftPressed [
	^false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/4/2024 15:57'
}
GMClickEvent >> yellowButtonPressed [
	^true
]
