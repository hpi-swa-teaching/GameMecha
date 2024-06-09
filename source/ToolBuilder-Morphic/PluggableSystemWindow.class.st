"
A pluggable system window. Fixes the issues with label retrieval and adds support for changing children.
"
Class {
	#name : #PluggableSystemWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'getLabelSelector',
		'getChildrenSelector',
		'closeWindowSelector'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'ar 2/11/2005 20:14'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'md 8/31/2005 07:59'
}
PluggableSystemWindow >> addPaneMorph: aMorph [
	self addMorph: aMorph fullFrame: aMorph layoutFrame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 9/17/2005 21:05'
}
PluggableSystemWindow >> closeWindowSelector [
	^closeWindowSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 9/17/2005 21:05'
}
PluggableSystemWindow >> closeWindowSelector: aSymbol [
	closeWindowSelector := aSymbol
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'cmm 11/19/2015 16:23'
}
PluggableSystemWindow >> delete [
	(model notNil and: [ closeWindowSelector notNil ]) ifTrue: [ model perform: closeWindowSelector ].
	super delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:57'
}
PluggableSystemWindow >> getChildrenSelector [
	^getChildrenSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:57'
}
PluggableSystemWindow >> getChildrenSelector: aSymbol [
	getChildrenSelector := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:57'
}
PluggableSystemWindow >> getLabelSelector [
	^getLabelSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/13/2005 13:53'
}
PluggableSystemWindow >> getLabelSelector: aSymbol [
	getLabelSelector := aSymbol.
	self update: aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/13/2005 13:52'
}
PluggableSystemWindow >> label [
	^label contents
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/13/2005 13:51'
}
PluggableSystemWindow >> label: aString [
	self setLabel: aString.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ct 7/5/2022 09:25'
}
PluggableSystemWindow >> rebuildPaneAfter: replacePaneMorphsBlock [
	"Performance. Reset layout properties during children update to avoid intermediate relayouting."

	| cellGap wantsGrips wantsPaneSplitters |
	self flag: #duplication. "See PluggablePanelMorph>>#rebuildPaneAfter: and MorphicToolBuilder>>#buildPluggableWindow:."
	
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
	#category : #updating,
	#'squeak_changestamp' : 'ct 7/4/2022 18:54'
}
PluggableSystemWindow >> update: what [
	what ifNil:[^self].
	what == getLabelSelector ifTrue:[self setLabel: (model perform: getLabelSelector)].
	what == getChildrenSelector ifTrue: [
		self rebuildPaneAfter: [
			paneMorphs ifNil: [paneMorphs := #()].
			self removeAllMorphsIn: paneMorphs.
			paneMorphs := model perform: getChildrenSelector.
			self addAllMorphs: paneMorphs.
			paneMorphs do: [:child |
				child adoptPaneColor: self paneColor].
			paneMorphs do: [:m | m hResizing: #spaceFill; vResizing: #spaceFill]]].
	what == #windowColorToUse ifTrue: [
		self paneColor = model windowColorToUse ifFalse:
			[self refreshWindowColor]].
	^super update: what
]
