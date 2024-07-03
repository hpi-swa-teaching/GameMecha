Class {
	#name : #GMTEAddLayerCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'editor'
	],
	#category : #'GM-TE-UI'
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
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:43'
}
GMTEAddLayerCommand >> do [
	"TODO: refactor this nicely by using inbuilt editor function while avoiding recursion"
	
	self editor tileMap tileMatrixStack pushLayer.
	self editor
		selectOnlyLayer: self editor layerCount;
		changed: #getLayerList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:37'
}
GMTEAddLayerCommand >> editor [
	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:37'
}
GMTEAddLayerCommand >> editor: anObject [
	editor := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:40'
}
GMTEAddLayerCommand >> undo [
	
	self editor
		selectLayer: self editor layerCount;
		deleteSelectedLayers
]
