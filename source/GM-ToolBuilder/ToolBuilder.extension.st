Extension { #name : #ToolBuilder }

{
	#category : #'*GM-ToolBuilder',
	#'squeak_changestamp' : 'TW 6/9/2024 18:37'
}
ToolBuilder >> buildPluggableStaticText: aSpec [
	^self subclassResponsibility
]

{
	#category : #'*GM-ToolBuilder',
	#'squeak_changestamp' : 'ek 9/13/2024 14:44'
}
ToolBuilder >> pluggableImageButtonSpec [

	^ PluggableImageButtonSpec
]

{
	#category : #'*GM-ToolBuilder',
	#'squeak_changestamp' : 'ek 9/13/2024 14:45'
}
ToolBuilder >> pluggableStaticTextSpec [

	^ PluggableStaticTextSpec
]
