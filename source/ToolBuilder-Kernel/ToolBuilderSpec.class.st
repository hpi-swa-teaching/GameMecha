"
I am an abstract widget specification. I can be rendered using many different UI frameworks.
"
Class {
	#name : #ToolBuilderSpec,
	#superclass : #Object,
	#instVars : [
		'name',
		'help'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/11/2005 14:59'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:17'
}
ToolBuilderSpec >> buildWith: aBuilder [
	^self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'btr 11/26/2006 12:37'
}
ToolBuilderSpec >> help [
	"Answer the message to get the help texts of this element."
	^ help
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 2/10/2022 10:53'
}
ToolBuilderSpec >> help: aSymbolOrStringOrText [
	"Indicate the message to retrieve the help texts of this element. You can directly configure a static instance of String or Text as help."
	
	help := aSymbolOrStringOrText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cwp 4/25/2005 03:42'
}
ToolBuilderSpec >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cwp 4/25/2005 03:40'
}
ToolBuilderSpec >> name: anObject [
	name := anObject
]
