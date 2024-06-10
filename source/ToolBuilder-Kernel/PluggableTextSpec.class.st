"
A text editor.

Instance variables:
	getText	<Symbol>	The selector to retrieve the text.
	setText	<Symbol>	The selector to set the text.
	selection <Symbol>	The selector to retrieve the text selection.
	menu	<Symbol>	The selector to offer (to retrieve?) the context menu.
	color	 <Symbol>	The selector to retrieve the background color.


"
Class {
	#name : #PluggableTextSpec,
	#superclass : #PluggableWidgetSpec,
	#instVars : [
		'getText',
		'setText',
		'selection',
		'menu',
		'askBeforeDiscardingEdits',
		'editText',
		'indicateUnacceptedChanges',
		'stylerClass',
		'font',
		'textStyle',
		'readOnly',
		'softLineWrap',
		'hardLineWrap',
		'textColor',
		'plainTextOnly'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/11/2005 21:58'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 10/4/2009 21:15'
}
PluggableTextSpec >> askBeforeDiscardingEdits [
	^askBeforeDiscardingEdits ifNil:[true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 10/4/2009 21:14'
}
PluggableTextSpec >> askBeforeDiscardingEdits: aBool [
	askBeforeDiscardingEdits := aBool
]

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableTextSpec >> buildWith: builder [
	^builder buildPluggableText: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/7/2015 08:54'
}
PluggableTextSpec >> editText [
	^ editText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/7/2015 08:54'
}
PluggableTextSpec >> editText: aSymbol [
	"Answer the selector for getting informed about any modifications of the text."
	editText := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 5/20/2019 10:30'
}
PluggableTextSpec >> font [
	^ font
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 2/10/2022 10:54'
}
PluggableTextSpec >> font: aFontOrSymbol [
	"Configure the font of the text field. You can provide a Symbol to let model's change their font dynamically."
	
	font := aFontOrSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:23'
}
PluggableTextSpec >> getText [
	"Answer the selector for retrieving the text"
	^getText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:23'
}
PluggableTextSpec >> getText: aSymbol [
	"Answer the selector for retrieving the text"
	getText := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/27/2015 15:43'
}
PluggableTextSpec >> hardLineWrap [

	^ hardLineWrap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/27/2015 15:43'
}
PluggableTextSpec >> hardLineWrap: aBoolean [

	hardLineWrap := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/16/2015 22:44'
}
PluggableTextSpec >> indicateUnacceptedChanges [
	^ indicateUnacceptedChanges ifNil: [true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/16/2015 22:44'
}
PluggableTextSpec >> indicateUnacceptedChanges: aBoolean [
	indicateUnacceptedChanges := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:25'
}
PluggableTextSpec >> menu [
	"Answer the selector for retrieving the text's menu"
	^menu
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:26'
}
PluggableTextSpec >> menu: aSymbol [
	"Indicate the selector for retrieving the text's menu"
	menu := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 12/8/2021 13:31'
}
PluggableTextSpec >> plainTextOnly [

	^ plainTextOnly ifNil: [false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 12/8/2021 13:19'
}
PluggableTextSpec >> plainTextOnly: aBoolean [

	plainTextOnly := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/19/2015 13:54'
}
PluggableTextSpec >> readOnly [

	^ readOnly ifNil: [false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/19/2015 13:54'
}
PluggableTextSpec >> readOnly: aBoolean [

	readOnly := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:25'
}
PluggableTextSpec >> selection [
	"Answer the selector for retrieving the text selection"
	^selection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:25'
}
PluggableTextSpec >> selection: aSymbol [
	"Indicate the selector for retrieving the text selection"
	selection := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:24'
}
PluggableTextSpec >> setText [
	"Answer the selector for setting the text"
	^setText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:24'
}
PluggableTextSpec >> setText: aSymbol [
	"Answer the selector for setting the text"
	setText := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/27/2015 15:43'
}
PluggableTextSpec >> softLineWrap [

	^ softLineWrap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/27/2015 15:43'
}
PluggableTextSpec >> softLineWrap: aBoolean [

	softLineWrap := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/17/2015 14:53'
}
PluggableTextSpec >> stylerClass [
	^ stylerClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/17/2015 14:53'
}
PluggableTextSpec >> stylerClass: aStylerClass [
	stylerClass := aStylerClass.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/16/2016 13:11'
}
PluggableTextSpec >> textColor [
	^ textColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/16/2016 13:11'
}
PluggableTextSpec >> textColor: aSymbol [
	textColor := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 2/10/2022 10:34'
}
PluggableTextSpec >> textStyle [
	^ textStyle
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 2/10/2022 10:55'
}
PluggableTextSpec >> textStyle: aTextStyleOrSymbol [
	"Configure the text style (i.e., usually same font family at different sizes to be used with TextFontChange attribute) of the text field. You can provide a Symbol to let model's change their text style dynamically."
	
	textStyle := aTextStyleOrSymbol.
]
