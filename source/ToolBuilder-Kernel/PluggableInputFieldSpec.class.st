"
PluggableInputField is intended as a HINT for the builder that this widget will be used as a single line input field. Unless explicitly supported it will be automatically substituted by PluggableText.
"
Class {
	#name : #PluggableInputFieldSpec,
	#superclass : #PluggableTextSpec,
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/12/2005 23:13'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableInputFieldSpec >> buildWith: builder [
	^builder buildPluggableInputField: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/27/2015 15:44'
}
PluggableInputFieldSpec >> hardLineWrap [

	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 5/12/2015 21:01'
}
PluggableInputFieldSpec >> softLineWrap [

	^ super softLineWrap ifNil: [false]
]
