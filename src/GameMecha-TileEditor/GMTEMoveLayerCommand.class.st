"
Command that moves a layer up or down in the hierarchy
"
Class {
	#name : #GMTEMoveLayerCommand,
	#superclass : #GMTECommand,
	#instVars : [
		'layerID',
		'moveDirection',
		'editor'
	],
	#category : #'GameMecha-TileEditor'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:17'
}
GMTEMoveLayerCommand class >> fromLayerID: aNumber1 withDirection: aNumber2 withEditor: anEditor [

	^ (self new)
		layerID: aNumber1;
		moveDirection: aNumber2;
		editor: anEditor;
		yourself
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:26'
}
GMTEMoveLayerCommand >> do [
	
	"moveDirection = 1 for up, -1 for down"
	self editor
		swapLayer: self layerID with: self layerID + self moveDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:17'
}
GMTEMoveLayerCommand >> editor [
	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:17'
}
GMTEMoveLayerCommand >> editor: anObject [
	editor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:12'
}
GMTEMoveLayerCommand >> layerID [
	^ layerID
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:12'
}
GMTEMoveLayerCommand >> layerID: anObject [
	layerID := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:12'
}
GMTEMoveLayerCommand >> moveDirection [
	^ moveDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:12'
}
GMTEMoveLayerCommand >> moveDirection: anObject [
	moveDirection := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:26'
}
GMTEMoveLayerCommand >> undo [
	
	"moveDirection = 1 for up, -1 for down"
	self editor
		swapLayer: self layerID + self moveDirection with: self layerID
]
