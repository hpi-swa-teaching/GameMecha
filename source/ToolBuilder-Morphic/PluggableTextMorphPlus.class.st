"
A pluggable text morph with support for color.
"
Class {
	#name : #PluggableTextMorphPlus,
	#superclass : #PluggableTextMorph,
	#instVars : [
		'getColorSelector',
		'acceptAction',
		'unstyledAcceptText',
		'styler',
		'getTextColorSelector'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'ar 2/11/2005 21:53'
}

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 7/25/2016 11:07'
}
PluggableTextMorphPlus class >> themeProperties [

	^  super themeProperties, {
		{ #stylerClass. 'Editing'. 'The styler class you want to use for syntax highlighting' }.
		{ #balloonTextColor. 'Colors'. 'Color to use when drawing the balloon text on an empty text field.' }.
		{ #balloonTextFont. 'Fonts'. 'Font to use when drawing the balloon text on an empty text field.' }.
	}
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 3/14/2022 16:45'
}
PluggableTextMorphPlus >> accept [
	super accept.
	acceptAction ifNotNil:[acceptAction value: textMorph text].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/16/2005 19:01'
}
PluggableTextMorphPlus >> acceptAction [
	^acceptAction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/16/2005 19:01'
}
PluggableTextMorphPlus >> acceptAction: anAction [
	acceptAction := anAction
]

{
	#category : #styling,
	#'squeak_changestamp' : 'mt 3/14/2022 10:04'
}
PluggableTextMorphPlus >> acceptTextInModel [ 
	
	self okToStyle ifFalse:[^super acceptTextInModel].			
	"#correctFrom:to:with: is sent when the method source is
	manipulated during compilation (removing unused temps,
	changing selectors etc). But 	#correctFrom:to:with: operates 
	on the textMorph's text, and we may be saving an unstyled 
	copy of the text. This means that these corrections will be lost
	unless we also apply the corrections to the unstyled copy that
	we are saving.
		So remember the unstyled copy in unstyledAcceptText, so
	that when #correctFrom:to:with: is received we can also apply
	the correction to it"
	unstyledAcceptText := styler unstyledTextFrom: textMorph text.
	[^setTextSelector isNil or:
		[setTextSelector numArgs = 2
			ifTrue: [model perform: setTextSelector with: unstyledAcceptText with: self]
			ifFalse: [model perform: setTextSelector with: unstyledAcceptText]]
	] ensure:[unstyledAcceptText := nil]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 7/24/2016 13:21'
}
PluggableTextMorphPlus >> applyUserInterfaceTheme [

	super applyUserInterfaceTheme.

	self styler ifNotNil: [:s | 
		s reset.
		self updateStyle].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/30/2015 09:35'
}
PluggableTextMorphPlus >> balloonText [
	"Overridden to send selector to model and not self. Do not use #perform:orSendTo: because super does more than just the send.."
	
	self balloonTextSelector ifNotNil: [:selector |
		(self model respondsTo: selector) ifTrue: [
			^ self model perform: selector]].
	
	^ super balloonText
]

{
	#category : #styling,
	#'squeak_changestamp' : 'ar 8/17/2009 23:49'
}
PluggableTextMorphPlus >> correctFrom: start to: stop with: aString [
	"see the comment in #acceptTextInModel "
	unstyledAcceptText ifNotNil:[unstyledAcceptText replaceFrom: start to: stop with: aString ].
	^ super correctFrom: start to: stop with: aString
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'mt 2/19/2022 19:03'
}
PluggableTextMorphPlus >> drawBalloonTextOn: aCanvas [ 
	"Show balloon text in the text morph if it has no contents. Catch errors to guard against broken models."

	| helpText helpFont helpColor box |
	textMorph contents ifNotEmpty: [ ^ self ].
	helpText := [ self balloonText ] on: Error do: [ :err | '<error in #balloonText>' ].
	helpText ifNil: [ ^ self ].
	
	helpFont := self textMorph textStyle defaultFont.
	"self userInterfaceTheme balloonTextFont ifNil: [TextStyle defaultFont]."
	helpColor := self userInterfaceTheme balloonTextColor ifNil: [Color gray: 0.7].
	
	box := self innerBounds insetBy: (self textMorph margins ifNil: [0]).
	box := box insetBy: (0 @ helpFont lineGapSlice corner: 0@0).
	
	aCanvas drawString: helpText in: box font: helpFont color: helpColor.
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'mt 3/30/2015 09:30'
}
PluggableTextMorphPlus >> drawOn: aCanvas [

	super drawOn: aCanvas.
	self drawBalloonTextOn: aCanvas.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 21:21'
}
PluggableTextMorphPlus >> getColorSelector [
	^getColorSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 21:21'
}
PluggableTextMorphPlus >> getColorSelector: aSymbol [
	getColorSelector := aSymbol.
	self update: getColorSelector.
]

{
	#category : #menu,
	#'squeak_changestamp' : 'cwp 11/20/2011 23:15'
}
PluggableTextMorphPlus >> getMenu: shiftKeyState [
	"Answer the menu for this text view. We override the superclass implementation to
	so we can give the selection interval to the model."
	
	| menu aMenu |
	getMenuSelector == nil ifTrue: [^ nil].
	getMenuSelector numArgs < 3 ifTrue: [^ super getMenu: shiftKeyState].
	menu := MenuMorph new defaultTarget: model.
	getMenuSelector numArgs = 3 ifTrue:
		[aMenu := model 
			perform: getMenuSelector 
			with: menu 
			with: shiftKeyState 
			with: self selectionInterval.
		getMenuTitleSelector ifNotNil: 
			[aMenu addTitle: (model perform: getMenuTitleSelector)].
		^ aMenu].
	^ self error: 'The getMenuSelector must be a 1- or 2 or 3-keyword symbol'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/16/2016 13:12'
}
PluggableTextMorphPlus >> getTextColorSelector [
	^getTextColorSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/16/2016 13:12'
}
PluggableTextMorphPlus >> getTextColorSelector: aSymbol [
	getTextColorSelector := aSymbol.
	self update: getTextColorSelector.
]

{
	#category : #styling,
	#'squeak_changestamp' : 'mt 5/5/2015 14:32'
}
PluggableTextMorphPlus >> hasUnacceptedEdits: aBoolean [
	"re-implemented to re-style the text iff aBoolean is true"
	 
	super hasUnacceptedEdits: aBoolean.
	aBoolean ifTrue: [ self updateStyle ].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mt 12/8/2021 13:31'
}
PluggableTextMorphPlus >> okToStyle [

	^ (styler isNil or: [self plainTextOnly])
		ifTrue: [false]
		ifFalse: [model aboutToStyle: styler requestor: self]
]

{
	#category : #styling,
	#'squeak_changestamp' : 'mt 8/4/2019 10:34'
}
PluggableTextMorphPlus >> setText: aText [
	
	self okToStyle ifFalse:[^super setText: aText].
	super setText: (styler format: aText asText).
	aText size < 4096
		ifTrue:[self updateStyleNow]
		ifFalse:[self updateStyle]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 8/17/2009 23:51'
}
PluggableTextMorphPlus >> styler [
	"The styler responsible for highlighting text in the receiver"
	^styler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 8/17/2009 23:50'
}
PluggableTextMorphPlus >> styler: anObject [
	"The styler responsible for highlighting text in the receiver"
	styler := anObject
]

{
	#category : #styling,
	#'squeak_changestamp' : 'mt 12/21/2017 08:58'
}
PluggableTextMorphPlus >> stylerStyled: styledCopyOfText [
	"Sent after the styler completed styling the underlying text. The behavior is similar to #handleInteraction:event: but we do not have to copy text ore make those other checks."
	
	textMorph contents runs: styledCopyOfText runs .

	textMorph paragraph composeAll.
	textMorph editor recomputeSelection.
	textMorph updateFromParagraph.

	textMorph editor blinkParen.
	self scrollSelectionIntoView.
]

{
	#category : #styling,
	#'squeak_changestamp' : 'ar 8/17/2009 23:52'
}
PluggableTextMorphPlus >> stylerStyledInBackground: styledCopyOfText [ 
	"Sent after the styler completed styling of the text"

	"It is possible that the text string	has changed since the styling began. Disregard the styles if styledCopyOfText's string differs with the current textMorph contents string"
	textMorph contents string = styledCopyOfText string
		ifTrue: [self stylerStyled: styledCopyOfText]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 8/16/2016 13:14'
}
PluggableTextMorphPlus >> update: what [
	what ifNil:[^self].
	what == getColorSelector ifTrue: [self color: (model perform: getColorSelector)].
	what == getTextColorSelector ifTrue: [self setTextColor: (model perform: getTextColorSelector)].
	what == #style ifTrue: [self updateStyle].
	
	
	^super update: what
]

{
	#category : #styling,
	#'squeak_changestamp' : 'mt 5/5/2015 14:32'
}
PluggableTextMorphPlus >> updateStyle [

	self okToStyle
		ifTrue: [styler styleInBackgroundProcess: textMorph contents].
]

{
	#category : #styling,
	#'squeak_changestamp' : 'mt 8/4/2019 10:34'
}
PluggableTextMorphPlus >> updateStyleNow [

	self okToStyle
		ifTrue: [styler style: textMorph contents].
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'mt 7/21/2021 10:33'
}
PluggableTextMorphPlus >> useDefaultStyler [
	"This should be changed to a proper registry but as long as there is only shout this will do"
	
	(TextStyler for: #Smalltalk)
		ifNotNil: [:stylerClass | self styler: (stylerClass new view: self)].
]
