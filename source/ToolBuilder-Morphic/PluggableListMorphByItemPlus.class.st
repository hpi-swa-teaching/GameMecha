"
Like PluggableListMorphPlus but maps #setIndexSelector and #getIndexSelector to actual items instead of indexes.
"
Class {
	#name : #PluggableListMorphByItemPlus,
	#superclass : #PluggableListMorphPlus,
	#instVars : [
		'itemList'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'mt 10/13/2019 11:01'
}

{
	#category : #'model access',
	#'squeak_changestamp' : 'mt 10/13/2019 11:01'
}
PluggableListMorphByItemPlus >> changeModelSelection: anInteger [
	"Change the model's selected item to be the one at the given index."

	setIndexSelector ifNotNil: [
		model
			perform: setIndexSelector
			with: (self getFullList at: anInteger ifAbsent: [nil])].
]

{
	#category : #'model access',
	#'squeak_changestamp' : 'mt 10/13/2019 11:01'
}
PluggableListMorphByItemPlus >> getCurrentSelectionIndex [
	"Answer the index of the current selection."

	^ getIndexSelector
		ifNil: [0]
		ifNotNil: [self getFullList indexOf: (model perform: getIndexSelector)]
]
