"
Command that adds a new layer
"
Class {
	#name : #GMTEAddLayerCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'editor'
	],
	#category : 'GM-TE-Editor'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:30'
}
GMTEAddLayerCommand class >> withEditor: anEditor [

	^ (self new)
		editor: anEditor;
		yourself
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:13'
}
GMTEAddLayerCommand >> do [

	self editor addTilemapLayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:37'
}
GMTEAddLayerCommand >> editor [

	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:37'
}
GMTEAddLayerCommand >> editor: anObject [

	editor := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/7/2024 00:53'
}
GMTEAddLayerCommand >> undo [
	
	self editor deleteTilemapLayers: {self editor getLayerList size}
]
