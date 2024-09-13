"
A pluggable panel morph which deals with changing children.
"
Class {
	#name : #PluggablePanelMorph,
	#superclass : #AlignmentMorph,
	#instVars : [
		'model',
		'getChildrenSelector'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'ar 2/11/2005 20:13'
}

{
	#category : #private,
	#'squeak_changestamp' : 'cmm 8/25/2013 13:09'
}
PluggablePanelMorph >> canBeEncroached [
	^ submorphs allSatisfy:
		[ : each | each canBeEncroached ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cmm 8/22/2013 21:50'
}
PluggablePanelMorph >> children [
	^ model perform: getChildrenSelector
]

{
	#category : #layout,
	#'squeak_changestamp' : 'mt 2/9/2022 16:14'
}
PluggablePanelMorph >> displayScaleChangedBy: factor [
	"Overwritten the reset the #cellGap (and #splitters)."

	| priorCellGap |
	priorCellGap := self cellGap. "Can be #panelSpacing, #windowSpacing, or -1 in browsers...."
	super displayScaleChangedBy: factor.

	self cellGap: (priorCellGap * factor) rounded.
	self layoutInset: (self layoutInset * factor) rounded.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:47'
}
PluggablePanelMorph >> getChildrenSelector [
	^getChildrenSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:47'
}
PluggablePanelMorph >> getChildrenSelector: aSymbol [
	getChildrenSelector := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:48'
}
PluggablePanelMorph >> model [
	^model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:48'
}
PluggablePanelMorph >> model: aModel [
	model ifNotNil:[model removeDependent: self].
	model := aModel.
	model ifNotNil:[model addDependent: self].
]

{
	#category : #private,
	#'squeak_changestamp' : 'ct 7/5/2022 09:25'
}
PluggablePanelMorph >> rebuildPaneAfter: replacePaneMorphsBlock [
	"Performance. Reset layout properties during children update to avoid intermediate relayouting."

	| cellGap wantsGrips wantsPaneSplitters |
	self flag: #duplication. "See PluggableSystemWindow>>#rebuildPaneAfter: and MorphicToolBuilder>>#buildPluggableWindow:."
	
	cellGap := self cellGap.
	wantsGrips := self wantsGrips.
	wantsPaneSplitters := self wantsPaneSplitters.
	
	self cellGap: 0.
	self wantsPaneSplitters: false; wantsGrips: false.
	self removePaneSplitters; removeGrips.
	
	^ replacePaneMorphsBlock ensure: [
		wantsPaneSplitters ifTrue: [
			self wantsPaneSplitters: wantsPaneSplitters.
			self addPaneSplitters].
		wantsGrips ifTrue: [
			self wantsGrips: wantsGrips.
			self addGrips].
		self cellGap: cellGap]
]

{
	#category : #update,
	#'squeak_changestamp' : 'ct 7/4/2022 18:39'
}
PluggablePanelMorph >> update: selectorSymbolOrNil [

	selectorSymbolOrNil ifNil: [^ self].
	selectorSymbolOrNil = getChildrenSelector ifTrue: [
		self rebuildPaneAfter: [
			| children |
			children := self children.
			self
				 removeAllMorphs;
				 addAllMorphs: children.
			self containingWindow ifNotNil: [:window |
				children do: [:child |
					child adoptPaneColor: window paneColor]].
			
			"Let my children take all the place unless my extent is described by them."
			self hResizing ~~ #shrinkWrap ifTrue:
				[self submorphsDo: [:m | m hResizing: #spaceFill]].
			self vResizing ~~ #shrinkWrap ifTrue:
				[self submorphsDo: [:m | m vResizing: #spaceFill]].
			
			"Tell dependents about this update. There is no pluggable notification for changed submorphs."
			self changed: #submorphs]].
]
