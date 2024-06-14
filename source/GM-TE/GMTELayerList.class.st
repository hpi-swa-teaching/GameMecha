Class {
	#name : #GMTELayerList,
	#superclass : #Morph,
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/11/2024 01:53'
}
GMTELayerList >> initialize [
	super initialize.
	self
		width:50;
		height:200;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
 		wrapCentering: #topLeft;
 		wrapDirection: #topToBottom.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/11/2024 01:55'
}
GMTELayerList >> resizeFromMenu: anEvent [
	super resizeFromMenu: anEvent.
	self submorphs do: [:morph | morph width: self width]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/11/2024 01:38'
}
GMTELayerList >> resizeMorph: anEvent [
	super resizeMorph: anEvent.
	self submorphs do: [:morph | morph width: self width]
]
