Extension { #name : #DialogWindow }

{
	#category : #'*ToolBuilder-Morphic-opening',
	#'squeak_changestamp' : 'mt 8/7/2019 17:44'
}
DialogWindow >> openAsTool [

	^ self getUserResponse
]
