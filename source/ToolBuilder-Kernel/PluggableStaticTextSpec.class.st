"
PluggableStaticText is supposed to enable simple text that seamlessly fits into the window
"
Class {
	#name : #PluggableStaticTextSpec,
	#superclass : #PluggableTextSpec,
	#category : #'ToolBuilder-Kernel',
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
	#'squeak_changestamp' : 'TW 6/10/2024 00:24'
}
PluggableStaticTextSpec >> color [

	^Color transparent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/9/2024 18:33'
}
PluggableStaticTextSpec >> indicateUnacceptedChanges [

	^false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/9/2024 18:34'
}
PluggableStaticTextSpec >> readOnly [

	^true
]
