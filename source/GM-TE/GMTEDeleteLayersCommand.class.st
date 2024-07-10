Class {
	#name : #GMTEDeleteLayersCommand,
	#superclass : #GMTETilemapSizeCommand,
	#instVars : [
		'layers'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/10/2024 04:21'
}
GMTEDeleteLayersCommand class >> fromLayers: aLayerList editor: anEditor [

	^ (self new)
		layers: ((SortedCollection sortBlock: [:a :b | a < b]) addAll: aLayerList; yourself);
		editor: anEditor;
		yourself
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:18'
}
GMTEDeleteLayersCommand >> do [

	self editor deleteTilemapLayers: self layers
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:19'
}
GMTEDeleteLayersCommand >> layers [
	^ layers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:19'
}
GMTEDeleteLayersCommand >> layers: anObject [
	layers := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/10/2024 04:05'
}
GMTEDeleteLayersCommand >> undo [

	self editor addTilemapLayersAt: self layers
]
