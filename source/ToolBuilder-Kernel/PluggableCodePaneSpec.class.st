"
A PluggableTextSpec specifically intended to edit code. Uses Syntax-Highlighting.
"
Class {
	#name : #PluggableCodePaneSpec,
	#superclass : #PluggableTextSpec,
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 8/18/2009 00:02'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 8/18/2009 00:03'
}
PluggableCodePaneSpec >> buildWith: builder [
	^builder buildPluggableCodePane: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/28/2015 12:04'
}
PluggableCodePaneSpec >> font [
	^ font ifNil: [Preferences standardCodeFont]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ct 11/1/2021 23:21'
}
PluggableCodePaneSpec >> stylerClass [

	^ super stylerClass ifNil: [TextStyler for: #Smalltalk]
]
