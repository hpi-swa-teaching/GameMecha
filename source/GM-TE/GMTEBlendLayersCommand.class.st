Class {
	#name : #GMTEBlendLayersCommand,
	#superclass : #GMTEDeleteLayersCommand,
	#category : #'GM-TE-UI'
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
	#'squeak_changestamp' : 'Alex M 7/12/2024 21:28'
}
GMTEBlendLayersCommand >> undo [

	self editor
		addTilemapLayersAt: (self layers copyFrom: 2 to: self layers size);
		resetLayers: {self layers first}.
		
	self restoreTiles
	
]