Class {
	#name : #PluggableMultiColumnListSpec,
	#superclass : #PluggableListSpec,
	#instVars : [
		'itemAlignments',
		'itemPaddings',
		'columnResizings',
		'columnSpaceFillWeights'
	],
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #building,
	#'squeak_changestamp' : 'tpr 11/7/2017 10:01'
}
PluggableMultiColumnListSpec >> buildWith: builder [
	^builder buildPluggableMultiColumnList: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 13:09'
}
PluggableMultiColumnListSpec >> columnResizings [
	"For each column, define the horizontal resizing (or #hResizing) behavior. Choose from #rigid, #shrinkWrap, and #spaceFill."
	
	^ columnResizings ifNil: [#(spaceFill)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 13:02'
}
PluggableMultiColumnListSpec >> columnResizings: someSymbols [

	columnResizings := someSymbols.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 13:30'
}
PluggableMultiColumnListSpec >> columnSpaceFillWeights [
	"For each column, define the relative space-fill weight, which will be used if the resizing strategy is set to #spaceFill."
	
	^ columnSpaceFillWeights ifNil: [#(1)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 13:31'
}
PluggableMultiColumnListSpec >> columnSpaceFillWeights: someNumbers [
	
	columnSpaceFillWeights := someNumbers.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 11:18'
}
PluggableMultiColumnListSpec >> itemAlignments [
	"For each column, define the alignment of each list item in its layout cell. The value can encode both horizontal and vertical dimensions."
	
	^ itemAlignments ifNil: [self itemAlignment ifNil: [#()] ifNotNil: [:alignment | {alignment}]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 11:19'
}
PluggableMultiColumnListSpec >> itemAlignments: someSymbols [
	"For convenience, map #left and #right to their correct values. At least for Morphic."

	itemAlignments := someSymbols collect: [:alignment |
		alignment == #left ifTrue: [#leftCenter] ifFalse: [
		alignment == #right ifTrue: [#rightCenter] ifFalse: [
		alignment]]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'eem 4/12/2021 11:19'
}
PluggableMultiColumnListSpec >> itemPaddings [
	
	^ itemPaddings ifNil: [self itemPadding ifNil: [#()] ifNotNil: [:pad | {pad}]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 11:39'
}
PluggableMultiColumnListSpec >> itemPaddings: someNumbersOrPointsOrRectangles [
	
	itemPaddings := someNumbersOrPointsOrRectangles.
]
