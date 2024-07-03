Class {
	#name : #GMTECompositeCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'commands'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/3/2024 16:41'
}
GMTECompositeCommand class >> fromCommands: aCollection [
	
	^ (self new)
		commands: aCollection;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/3/2024 16:41'
}
GMTECompositeCommand >> commands [
	^ commands
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/3/2024 16:41'
}
GMTECompositeCommand >> commands: anObject [
	commands := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/3/2024 16:41'
}
GMTECompositeCommand >> do [

	self commands do: [:command | command do ]
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/3/2024 16:41'
}
GMTECompositeCommand >> undo [

	self commands do: [:command | command undo ]
]
