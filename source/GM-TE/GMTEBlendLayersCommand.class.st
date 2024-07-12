"
Command that blends a set of layers together into one
"
Class {
	#name : #GMTEBlendLayersCommand,
	#superclass : #GMTEDeleteLayersCommand,
	#category : #'GM-TE-UI',
	#'squeak_changestamp' : 'Alex M 7/12/2024 22:20'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/12/2024 20:46'
}
GMTEBlendLayersCommand >> do [
	
	self editor blendLayers: self layers
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 7/12/2024 23:27'
}
GMTEBlendLayersCommand >> undo [

	self editor addTilemapLayersAt: (self layers copyFrom: 2 to: self layers size).
	self tileMap silentlyResetLayers: (Set with: layers first).
		
	self restoreTiles
	
]
