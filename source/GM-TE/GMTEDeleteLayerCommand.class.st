Class {
	#name : #GMTEDeleteLayerCommand,
	#superclass : #GMTETilemapSizeCommand,
	#instVars : [
		'layers'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:20'
}
GMTEDeleteLayerCommand class >> fromLayers: aLayerList editor: anEditor [

	^ (self new)
		layers: aLayerList;
		editor: anEditor;
		yourself
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:18'
}
GMTEDeleteLayerCommand >> do [

	self editor deleteTilemapLayers: self layers
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:19'
}
GMTEDeleteLayerCommand >> layers [
	^ layers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:19'
}
GMTEDeleteLayerCommand >> layers: anObject [
	layers := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:31'
}
GMTEDeleteLayerCommand >> undo [
	self flag: 'NEEDS TO BE EXPENDED TO MULTIPLE LAYERS'.
	
	self editor addTilemapLayer
]
