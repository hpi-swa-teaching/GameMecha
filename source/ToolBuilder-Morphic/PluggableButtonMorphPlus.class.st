"
An extended version of PluggableButtonMorph supporting enablement, color and block/message actions.
"
Class {
	#name : #PluggableButtonMorphPlus,
	#superclass : #PluggableButtonMorph,
	#instVars : [
		'enabled',
		'action',
		'getColorSelector',
		'getEnabledSelector',
		'updateMap',
		'disabledColor',
		'disabledTextColor'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'ar 2/11/2005 21:53'
}

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 7/26/2016 10:49'
}
PluggableButtonMorphPlus class >> themeProperties [

	^ super themeProperties, {
		{ #disabledColor. 'Colors'. 'Color when button cannot be clicked.' }.
		{ #disabledTextColor. 'Colors'. 'Color for label when button cannot be clicked.' }.
	}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 20:53'
}
PluggableButtonMorphPlus >> action [
	^action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 20:55'
}
PluggableButtonMorphPlus >> action: anAction [	
	action := nil.
	anAction isSymbol ifTrue:[^super action: anAction].
	action := anAction.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 7/22/2016 15:29'
}
PluggableButtonMorphPlus >> applyUserInterfaceTheme [

	super applyUserInterfaceTheme.
]

{
	#category : #'debug menu',
	#'squeak_changestamp' : 'mt 10/1/2020 16:05'
}
PluggableButtonMorphPlus >> browseImplementationOfActionSelector [

	action
		ifNil: [super browseImplementationOfActionSelector]
		ifNotNil: [action homeMethod browse].
]

{
	#category : #'debug menu',
	#'squeak_changestamp' : 'ct 1/3/2022 17:09'
}
PluggableButtonMorphPlus >> debugAction [

	action ifNil: [^ super debugAction].
	(Process
		forBlock: [self performAction]
		runUntil: [:context | context closure = action])
			debugWithTitle: ('Debug button action "{1}" in model "{2}"' translated format: {self label. self target printString}).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'dc 1/9/2008 18:17'
}
PluggableButtonMorphPlus >> enabled [
	^ enabled ifNil: [enabled := true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/22/2016 14:59'
}
PluggableButtonMorphPlus >> enabled: aBool [
	enabled := aBool.
	self updateFillStyle.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 21:36'
}
PluggableButtonMorphPlus >> getColorSelector [
	^getColorSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 21:36'
}
PluggableButtonMorphPlus >> getColorSelector: aSymbol [
	getColorSelector := aSymbol.
	self update: getColorSelector.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 19:51'
}
PluggableButtonMorphPlus >> getEnabledSelector [
	^getEnabledSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/23/2016 10:51'
}
PluggableButtonMorphPlus >> getEnabledSelector: aSymbol [
	getEnabledSelector := aSymbol.
	self update: getEnabledSelector.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 7/23/2016 10:27'
}
PluggableButtonMorphPlus >> handlesMouseDown: evt [
	^ enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 7/23/2016 10:28'
}
PluggableButtonMorphPlus >> handlesMouseOver: evt [
	^ enabled
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 7/23/2016 10:28'
}
PluggableButtonMorphPlus >> handlesMouseOverDragging: evt [
	^ enabled
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'mt 7/23/2016 10:54'
}
PluggableButtonMorphPlus >> initialize [

	enabled := true.
	super initialize.
]

{
	#category : #action,
	#'squeak_changestamp' : 'ar 2/11/2005 20:54'
}
PluggableButtonMorphPlus >> performAction [
	enabled ifFalse:[^self].
	action ifNotNil:[^action value].
	^super performAction
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'mt 7/31/2016 09:29'
}
PluggableButtonMorphPlus >> setDefaultParameters [

	disabledColor := (self userInterfaceTheme disabledColor ifNil: [Color transparent]).
	disabledTextColor := (self userInterfaceTheme disabledTextColor ifNil: [Color gray: 0.6]).

	super setDefaultParameters.	
	
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'mt 7/26/2016 10:55'
}
PluggableButtonMorphPlus >> textColorToUse [

	^ self enabled
		ifTrue: [super textColorToUse]
		ifFalse: [disabledTextColor ifNil: [Color gray: 0.6]]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'nice 6/10/2017 17:35'
}
PluggableButtonMorphPlus >> update: what [

	super update: what.
		
	getColorSelector ifNotNil: [:sel |
		what == sel ifTrue: [self offColor: (model perform: sel)]].

	getEnabledSelector ifNotNil: [:sel |
		what == sel ifTrue: [self enabled: (model perform: sel)]].

	updateMap ifNotNil:
		[(updateMap at: what ifAbsent: [])
			ifNotNil: [ :newTarget | self update: newTarget]].

]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'mt 5/4/2018 16:31'
}
PluggableButtonMorphPlus >> updateFillStylePressing: isPressing hovering: isHovering [

	enabled ifFalse: [
		self color: (disabledColor ifNil: [Color transparent]).
		self borderStyle baseColor: disabledTextColor.
		^ self].
	
	super updateFillStylePressing: isPressing hovering: isHovering.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'dtl 9/24/2011 08:54'
}
PluggableButtonMorphPlus >> updateMap [
	^ updateMap ifNil: [updateMap := Dictionary new]

]

{
	#category : #updating,
	#'squeak_changestamp' : 'dtl 9/24/2011 08:54'
}
PluggableButtonMorphPlus >> whenChanged: notification update: target [
	"On receipt of a notification, such as #contents notification from a CodeHolder,
	invoke an update as if target had been the original notification."

	self updateMap at: notification put: target
]
