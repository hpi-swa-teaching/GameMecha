Extension { #name : #Text }

{
	#category : #'*ToolBuilder-Kernel',
	#'squeak_changestamp' : 'mt 1/25/2018 08:13'
}
Text >> edit [

	UIManager default edit: self.
]

{
	#category : #'*ToolBuilder-Kernel',
	#'squeak_changestamp' : 'eem 1/25/2018 07:23'
}
Text >> editWithLabel: label [

	UIManager default edit: self label: label
]
