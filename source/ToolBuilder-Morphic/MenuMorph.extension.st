Extension { #name : #MenuMorph }

{
	#category : #'*ToolBuilder-Morphic-opening',
	#'squeak_changestamp' : 'dtl 11/17/2017 22:37'
}
MenuMorph >> openAsTool [

	self popUpInWorld: Project current world.
]
