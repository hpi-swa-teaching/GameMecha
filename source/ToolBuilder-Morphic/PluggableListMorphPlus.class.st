"
Extensions for PluggableListMorph needed by ToolBuilder
"
Class {
	#name : #PluggableListMorphPlus,
	#superclass : #PluggableListMorph,
	#instVars : [
		'dragItemSelector',
		'dropItemSelector',
		'wantsDropSelector',
		'dragTypeSelector',
		'dragStartedSelector'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'ar 7/15/2005 11:10'
}

{
	#category : #'drag and drop',
	#'squeak_changestamp' : 'mt 3/30/2016 15:51'
}
PluggableListMorphPlus >> acceptDroppingMorph: aTransferMorph event: evt [

	dropItemSelector ifNil: [^ self].
	potentialDropRow ifNil: [^ self].
	
	model
		perform: dropItemSelector
		withEnoughArguments: {
			aTransferMorph passenger.
			self modelIndexFor: potentialDropRow.
			aTransferMorph shouldCopy.
			aTransferMorph}.
			
	self resetPotentialDropRow.
	evt hand releaseMouseFocus: self.
	Cursor normal show.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/15/2005 11:24'
}
PluggableListMorphPlus >> dragItemSelector [
	^dragItemSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/15/2005 11:26'
}
PluggableListMorphPlus >> dragItemSelector: aSymbol [
	dragItemSelector := aSymbol.
	aSymbol ifNotNil:[self dragEnabled: true].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 11/4/2015 14:42'
}
PluggableListMorphPlus >> dragStartedSelector [
	^ dragStartedSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 11/4/2015 14:43'
}
PluggableListMorphPlus >> dragStartedSelector: symbol [
	dragStartedSelector := symbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/10/2015 10:18'
}
PluggableListMorphPlus >> dragTypeSelector [
	^dragTypeSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/10/2015 10:18'
}
PluggableListMorphPlus >> dragTypeSelector: aSymbol [
	dragTypeSelector := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/15/2005 11:25'
}
PluggableListMorphPlus >> dropItemSelector [
	^dropItemSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/15/2005 11:25'
}
PluggableListMorphPlus >> dropItemSelector: aSymbol [
	dropItemSelector := aSymbol.
	aSymbol ifNotNil:[self dropEnabled: true].
]

{
	#category : #'drag and drop',
	#'squeak_changestamp' : 'mt 11/26/2019 17:22'
}
PluggableListMorphPlus >> startDrag: evt [ 

	| item itemMorph modelIndex |	
	dragItemSelector ifNil:[^self].
	evt hand hasSubmorphs ifTrue: [^ self].
	self model okToChange ifFalse: [^ self].

	"Ensure selection to save additional click."
	(self modelIndexFor: (self rowAtLocation: evt position)) in: [:evtIndex |
		self selectionIndex = evtIndex ifFalse: [self changeModelSelection: evtIndex]].

	item := self selection ifNil: [^ self].
	itemMorph := StringMorph contents: item asStringOrText.
	modelIndex := self modelIndexFor: self selectionIndex.

	[ "Initiate drag."
		(self model perform: dragItemSelector with: modelIndex) ifNotNil: [:passenger | | ddm |
			ddm := (self valueOfProperty: #dragTransferClass ifAbsent: [TransferMorph]) withPassenger: passenger from: self.
			ddm dragTransferType: (self dragTypeSelector ifNotNil: [:s | self model perform: s with: modelIndex]).
			ddm updateFromUserInputEvent: evt.
			self dragStartedSelector ifNotNil: [:s | self model perform: s with: itemMorph with: ddm].
			evt hand grabMorph: ddm.
			self mouseEnterDragging: evt "Enable internal move"].
	] ensure: [Cursor normal show]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/15/2005 12:07'
}
PluggableListMorphPlus >> wantsDropSelector [
	^wantsDropSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/15/2005 12:07'
}
PluggableListMorphPlus >> wantsDropSelector: aSymbol [
	wantsDropSelector := aSymbol
]

{
	#category : #'drag and drop',
	#'squeak_changestamp' : 'ct 8/20/2020 18:02'
}
PluggableListMorphPlus >> wantsDroppedMorph: aTransferMorph event: anEvent [

	dropItemSelector ifNil: [^ false].
	aTransferMorph isTransferMorph ifFalse: [^ false].
	wantsDropSelector ifNil: [^ true].

	^ model perform: wantsDropSelector withEnoughArguments: {
		aTransferMorph passenger.
		aTransferMorph dragTransferType.
		aTransferMorph source.
		aTransferMorph}
]
