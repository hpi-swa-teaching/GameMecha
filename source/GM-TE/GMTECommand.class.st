Class {
	#name : #GMTECommand,
	#superclass : #Object,
	#category : #'GM-TE-CommandProcessor'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 6/28/2024 01:43'
}
GMTECommand >> do [
	
	self subclassResponsibility
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 6/28/2024 01:43'
}
GMTECommand >> undo [
	
	self subclassResponsibility
]
