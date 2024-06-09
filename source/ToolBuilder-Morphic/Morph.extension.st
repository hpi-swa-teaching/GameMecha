Extension { #name : #Morph }

{
	#category : #'*ToolBuilder-Morphic-opening',
	#'squeak_changestamp' : 'tpr 10/2/2017 17:06'
}
Morph >> buildWith: aToolBuilder [
	"A Morph is already built, so simply return myself"
	^self
]

{
	#category : #'*ToolBuilder-Morphic',
	#'squeak_changestamp' : 'mt 4/2/2020 16:39'
}
Morph >> inspectorClass [

	^ MorphInspector
]

{
	#category : #'*ToolBuilder-Morphic-opening',
	#'squeak_changestamp' : 'mt 10/5/2017 08:40'
}
Morph >> openAsTool [

	self openInWorld.
]
