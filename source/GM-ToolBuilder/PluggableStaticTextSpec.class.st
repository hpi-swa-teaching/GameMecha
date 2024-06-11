"
PluggableStaticText is supposed to enable simple text that seamlessly fits into the window
"
Class {
	#name : #PluggableStaticTextSpec,
	#superclass : #PluggableWidgetSpec,
	#instVars : [
		'text'
	],
	#category : #'GM-ToolBuilder',
	#'squeak_changestamp' : 'TW 6/9/2024 18:31'
}

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/10/2024 17:28'
}
PluggableStaticTextSpec >> buildWith: builder [

	^builder buildPluggableStaticText: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/11/2024 15:52'
}
PluggableStaticTextSpec >> text [

	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/11/2024 15:52'
}
PluggableStaticTextSpec >> text: anObject [

	text := anObject.
]
