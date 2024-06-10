"
UIManager is a dispatcher for various user interface requests, such as menu and dialog interactions. An instance of UIManager is associated with each Project to implement the appropriate functions for Morphic, MVC or other user interfaces.
"
Class {
	#name : #UIManager,
	#superclass : #Object,
	#instVars : [
		'builderClass'
	],
	#classVars : [
		'OpenToolsAttachedToMouseCursor'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'dtl 5/2/2010 16:06'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'tpr 1/29/2018 11:41'
}
UIManager class >> default [
	^ Project uiManager
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'nice 6/10/2017 17:39'
}
UIManager class >> getDefault [
	"Ensure that a more specific manager can always be made by subclassing
	a tool builder and implementing a more specific way of reacting to
	#isActiveManager. For example, a BobsUIManager can subclass
	MorphicUIManager and (if enabled, say Preferences useBobsUI) will
	be considered before the parent (generic MorphicUIManager)."

	^ (self allSubclasses
		detect: [:any | any isActiveManager
				and: [any subclasses
						noneSatisfy: [:sub | sub isActiveManager]]]
		ifNone: [])
		ifNotNil: [:mgrClass | mgrClass new]
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'ar 2/11/2005 15:41'
}
UIManager class >> isActiveManager [
	"Answer whether I should act as the active ui manager"
	^false
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 8/25/2021 14:53'
}
UIManager class >> openToolsAttachedToMouseCursor [

	<preference: 'Open Tools Attached to Mouse Cursor'
		categoryList: #(Tools mouse)
		description: 'If enabled, new tool windows will be attached to the mouse cursor to be positioned on screen with an additional click-drag. Only occurs if a mouse event triggered that tool opening to not interfere with keyboard-based interaction.'
		type: #Boolean>
	^ OpenToolsAttachedToMouseCursor ifNil: [false]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 8/16/2016 17:46'
}
UIManager class >> openToolsAttachedToMouseCursor: aBoolean [

	OpenToolsAttachedToMouseCursor := aBoolean.
]

{
	#category : #utilities,
	#'squeak_changestamp' : 'pre 7/9/2018 15:09'
}
UIManager >> askForProvidedAnswerTo: queryString ifSupplied: supplyBlock [

	^ (ProvideAnswerNotification signal: queryString asString) ifNotNil: supplyBlock
]

{
	#category : #builder,
	#'squeak_changestamp' : 'dtl 3/21/2015 11:50'
}
UIManager >> builderClass [
	"Answer the kind of tool builder to use, possibly influenced by project preferences"
	^ builderClass ifNil: [ builderClass := ToolBuilder findDefault ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'dtl 3/23/2015 07:29'
}
UIManager >> builderClass: aClass [
	builderClass := aClass
]

{
	#category : #'ui requests - code',
	#'squeak_changestamp' : 'jr 2/2/2017 12:01'
}
UIManager >> chooseClassOrTrait [
	"Let the user choose a Class or Trait"
	
	^self chooseClassOrTraitFrom: Smalltalk globals
]

{
	#category : #'ui requests - code',
	#'squeak_changestamp' : 'ul 12/12/2010 21:04'
}
UIManager >> chooseClassOrTrait: label [
	"Let the user choose a Class or Trait"
	
	^self chooseClassOrTrait: label from: Smalltalk environment
]

{
	#category : #'ui requests - code',
	#'squeak_changestamp' : 'fbs 12/7/2013 16:58'
}
UIManager >> chooseClassOrTrait: label from: environment [
	"Let the user choose a Class or Trait."
	
	| pattern |
	pattern := self request: label.
	^ self classOrTraitFrom: environment pattern: pattern label: label
	
]

{
	#category : #'ui requests - code',
	#'squeak_changestamp' : 'tpr 5/7/2022 15:31'
}
UIManager >> chooseClassOrTrait: label from: environment withRecentList: ignored [
	"Let the user choose a Class or Trait."
	
	| pattern |
	pattern := self request: label.
	^ self classOrTraitFrom: environment pattern: pattern label: label
	
]

{
	#category : #'ui requests - code',
	#'squeak_changestamp' : 'tpr 5/7/2022 15:28'
}
UIManager >> chooseClassOrTraitFrom: anEnvironment [
	"Let the user choose a Class or Trait from the given environment"
	
	^self chooseClassOrTrait: 'Class name or fragment?' from: anEnvironment withRecentList: nil
]

{
	#category : #'ui requests - code',
	#'squeak_changestamp' : 'tpr 5/7/2022 15:23'
}
UIManager >> chooseClassOrTraitFrom: anEnvironment withRecentList: recentList [
	"Let the user choose a Class or Trait from the given environment"
	
	^self chooseClassOrTrait: 'Class name or fragment?' from: anEnvironment withRecentList: recentList
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:41'
}
UIManager >> chooseDirectory [
	"Let the user choose a directory. Returns a proper directory."
	^self chooseDirectoryFrom: FileDirectory default
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:41'
}
UIManager >> chooseDirectory: label [
	"Let the user choose a directory. Returns a proper directory."
	^self chooseDirectory: label from: FileDirectory default
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:41'
}
UIManager >> chooseDirectory: label from: dir [
	"Let the user choose a directory. Returns a proper directory."
	"UIManager default chooseDirectory: 'Choose one' from: FileDirectory default"
	^self subclassResponsibility
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:41'
}
UIManager >> chooseDirectoryFrom: dir [
	"Let the user choose a directory. Returns a proper directory."
	^self chooseDirectory: nil from: dir
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:40'
}
UIManager >> chooseFileMatching: patterns [
	"Let the user choose a file matching the given patterns. Returns a file name."
	^self chooseFileMatching: patterns label: nil
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:39'
}
UIManager >> chooseFileMatching: patterns label: labelString [
	"Let the user choose a file matching the given patterns. Returns a file name."
	^self subclassResponsibility
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:40'
}
UIManager >> chooseFileMatchingSuffixes: suffixList [
	"Let the user choose a file matching the given suffixes. Returns a file name."
	^self chooseFileMatchingSuffixes: suffixList label: nil
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:40'
}
UIManager >> chooseFileMatchingSuffixes: suffixList label: labelString [
	"Let the user choose a file matching the given suffixes. Returns a file name."
	^self subclassResponsibility
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'eem 8/11/2017 10:34'
}
UIManager >> chooseFont: titleString for: aModel setSelector: setSelector getSelector: getSelector [
	"Open a font-chooser for the given model"
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 12/27/2004 10:44'
}
UIManager >> chooseFrom: aList [
	"Choose an item from the given list. Answer the index of the selected item."
	^self chooseFrom: aList lines: #()
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 12/27/2004 10:45'
}
UIManager >> chooseFrom: aList lines: linesArray [
	"Choose an item from the given list. Answer the index of the selected item."
	^self chooseFrom: aList lines: linesArray title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 12/27/2004 09:37'
}
UIManager >> chooseFrom: aList lines: linesArray title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 12/27/2004 10:44'
}
UIManager >> chooseFrom: aList title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	^self chooseFrom: aList lines: #() title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 7/15/2005 23:42'
}
UIManager >> chooseFrom: labelList values: valueList [
	"Choose an item from the given list. Answer the selected item."
	^self chooseFrom: labelList values: valueList lines: #()
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 7/15/2005 23:43'
}
UIManager >> chooseFrom: labelList values: valueList lines: linesArray [
	"Choose an item from the given list. Answer the selected item."
	^self chooseFrom: labelList values: valueList lines: linesArray title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 7/15/2005 23:43'
}
UIManager >> chooseFrom: labelList values: valueList lines: linesArray title: aString [
	"Choose an item from the given list. Answer the selected item."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 7/15/2005 23:43'
}
UIManager >> chooseFrom: labelList values: valueList title: aString [
	"Choose an item from the given list. Answer the selected item."
	^self chooseFrom: labelList values: valueList lines: #() title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ct 10/3/2019 01:56'
}
UIManager >> chooseFromLabeledValues: aDictionary [
	"Choose a key from the given dictionary. Answer the corresponding value."
	^self chooseFromLabeledValues: aDictionary title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ct 10/3/2019 01:56'
}
UIManager >> chooseFromLabeledValues: aDictionary title: aString [
	"Choose a key from the given dictionary. Answer the corresponding value."
	^self chooseFrom: aDictionary keys values: aDictionary values title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ct 1/24/2020 18:36'
}
UIManager >> chooseFromOrAddTo: aList lines: linesArray title: aString [

	| index |
	index := self
		chooseFrom: {'new...'}, aList
		lines: linesArray + 1
		title: aString.
	index = 0 ifTrue: [^ nil].
	index = 1 ifTrue:
		[^ self request: 'Please type new value' initialAnswer: ''].
	^ aList at: index - 1
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 14:56'
}
UIManager >> chooseMultipleFrom: aList [
	"Choose one or more items from the given list. Answer the indices of the selected items."
	
	^ self chooseMultipleFrom: aList lines: #()
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 14:55'
}
UIManager >> chooseMultipleFrom: aList lines: linesArray [
	"Choose one or more items from the given list. Answer the indices of the selected items."
	
	^ self chooseMultipleFrom: aList lines: linesArray title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 15:01'
}
UIManager >> chooseMultipleFrom: aList lines: linesArray title: aString [
	"Choose one or more items from the given list. Answer the indices of the selected items."
	
	^ (self chooseFrom: aList lines: linesArray title: aString) in: [:result |
		result = 0 ifTrue: [#()] ifFalse: [{result}]]
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 14:56'
}
UIManager >> chooseMultipleFrom: aList title: aString [
	"Choose one or more items from the given list. Answer the indices of the selected items."
	
	^self chooseMultipleFrom: aList lines: #() title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 14:57'
}
UIManager >> chooseMultipleFrom: labelList values: valueList [
	"Choose one or more items from the given list. Answer the selected items."
	
	^ self chooseMultipleFrom: labelList values: valueList lines: #()
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 14:57'
}
UIManager >> chooseMultipleFrom: labelList values: valueList lines: linesArray [
	"Choose one or more items from the given list. Answer the selected items."
	
	^ self chooseMultipleFrom: labelList values: valueList lines: linesArray title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 15:02'
}
UIManager >> chooseMultipleFrom: labelList values: valueList lines: linesArray title: aString [
	"Choose one or more items from the given list. Answer the selected items."

	^ (self chooseFrom: labelList values: valueList lines: linesArray title: aString)
		ifNil: [#()]
		ifNotNil: [:resultValue | {resultValue}]
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/14/2015 14:57'
}
UIManager >> chooseMultipleFrom: labelList values: valueList title: aString [
	"Choose one or more items from the given list. Answer the selected items."
	
	^ self chooseMultipleFrom: labelList values: valueList lines: #() title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:17'
}
UIManager >> chooseOptionFrom: aList [
	"Choose an option from the given list. Answer the index of the selected item."
	^self chooseOptionFrom: aList lines: #()
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'tpr 4/17/2022 17:44'
}
UIManager >> chooseOptionFrom: aList lines: anArray [
	"Choose an option from the given list. Answer the index of the selected item."

	^self chooseOptionFrom: aList lines: anArray title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:06'
}
UIManager >> chooseOptionFrom: aList lines: linesArray title: aString [
	"Choose an option from the given list. Answer the index of the selected item."

	^ self chooseFrom: aList lines: linesArray title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'tpr 4/17/2022 17:44'
}
UIManager >> chooseOptionFrom: aList title: aString [
	"Choose an option from the given list. Answer the index of the selected item."

	^self chooseOptionFrom: aList lines: #() title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:17'
}
UIManager >> chooseOptionFrom: labelList values: valueList [
	"Choose an option from the given list. Answer the selected option from the valueList."
	^self chooseOptionFrom: labelList values: valueList lines: #()
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:18'
}
UIManager >> chooseOptionFrom: labelList values: valueList lines: linesArray [
	"Choose an option from the given list. Answer the selected option from the valueList."
	^self chooseOptionFrom: labelList values: valueList lines: linesArray title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:18'
}
UIManager >> chooseOptionFrom: labelList values: valueList lines: linesArray title: aString [
	"Choose an option from the given list. Answer the selected option from the valueList."
	^ self chooseFrom: labelList values: valueList lines: linesArray title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:18'
}
UIManager >> chooseOptionFrom: labelList values: valueList title: aString [
	"Choose an option from the given list. Answer the selected option from the valueList."
	^self chooseOptionFrom: labelList values: valueList lines: #() title: aString
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:13'
}
UIManager >> chooseOptionFromLabeledValues: aDictionary [
	"Choose a key from the given dictionary. Answer the corresponding value."
	^self chooseOptionFromLabeledValues: aDictionary title: ''
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'mt 4/20/2022 11:13'
}
UIManager >> chooseOptionFromLabeledValues: aDictionary title: aString [
	"Choose a key from the given dictionary. Answer the corresponding value."
	^self chooseOptionFrom: aDictionary keys values: aDictionary values title: aString
]

{
	#category : #'system introspecting',
	#'squeak_changestamp' : 'jr 2/28/2017 01:28'
}
UIManager >> classFromPattern: pattern withCaption: aCaption [
	^self classFromPattern: pattern withCaption: aCaption in: Smalltalk environment
"
	self classFromPattern: 'CharRecog' withCaption: ''
	self classFromPattern: 'rRecog' withCaption: ''
	self classFromPattern: 'znak' withCaption: ''
	self classFromPattern: 'orph' withCaption: ''
	self classFromPattern: 'TCompil' withCaption: ''
"

]

{
	#category : #'system introspecting',
	#'squeak_changestamp' : 'jr 2/28/2017 01:29'
}
UIManager >> classFromPattern: pattern withCaption: aCaption in: anEnvironment [
	"If there is a class or trait whose name exactly given by pattern, return it.
	If there is only one class or trait in the system whose name matches pattern, return it.
	Otherwise, put up a menu offering the names of all classes that match pattern, and return the class chosen, else nil if nothing chosen.
	This method ignores separator characters in the pattern"

	^self classOrTraitFrom: anEnvironment pattern: pattern label: aCaption
"
	for examples, see #classFromPattern:withCaption:
"

]

{
	#category : #'system introspecting',
	#'squeak_changestamp' : 'mt 2/9/2022 13:20'
}
UIManager >> classOrTraitFrom: environment pattern: pattern label: label [
	
	^ ((SystemNavigation for: environment) allClassesAndTraitsMatching: pattern)
		ifEmpty: [nil]
		ifNotEmpty: [:results |
			results size = 1
				ifTrue: [results first]
				ifFalse: [self
							chooseFrom: (results collect: [:each | 
								each isDeprecated
									ifTrue: [each name asText addAttributesForDeprecation]
									ifFalse: [each name]])
							values: results
							title: label]]
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 12/27/2004 08:39'
}
UIManager >> confirm: queryString [
	"Put up a yes/no menu with caption queryString. Answer true if the 
	response is yes, false if no. This is a modal question--the user must 
	respond yes or no."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 12/27/2004 09:49'
}
UIManager >> confirm: aString orCancel: cancelBlock [
	"Put up a yes/no/cancel menu with caption aString. Answer true if  
	the response is yes, false if no. If cancel is chosen, evaluate  
	cancelBlock. This is a modal question--the user must respond yes or no."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'dtl 3/29/2015 14:01'
}
UIManager >> confirm: aString orCancel: cancelBlock title: titleString [
	"Put up a yes/no/cancel menu with caption aString, and titleString to label the dialog.
	Answer true if  the response is yes, false if no. If cancel is chosen, evaluate cancelBlock.
	This is a modal question--the user must respond yes or no."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'dtl 3/29/2015 13:57'
}
UIManager >> confirm: queryString title: titleString [
	"Put up a yes/no menu with caption queryString, and titleString to label the dialog.
	Answer true if the response is yes, false if no. This is a modal question--the user
	must respond yes or no."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'dtl 3/29/2015 15:04'
}
UIManager >> confirm: queryString title: titleString trueChoice: trueChoice falseChoice: falseChoice [
	"Put up a yes/no menu with caption queryString, and titleString to label the dialog.
	The actual wording for the two choices will be as provided in the trueChoice and
	falseChoice parameters. Answer true if the response is the true-choice, false if it
	is the false-choice. This is a modal question -- the user must respond one way or
	the other."
	^self subclassResponsibility
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'dc 1/10/2008 08:09'
}
UIManager >> confirm: queryString trueChoice: trueChoice falseChoice: falseChoice [ 
	"Put up a yes/no menu with caption queryString. The actual wording for the two choices will be as provided in the trueChoice and falseChoice parameters. Answer true if the response is the true-choice, false if it's the false-choice.
	This is a modal question -- the user must respond one way or the other."
	^self subclassResponsibility
]

{
	#category : #'ui requests - progress',
	#'squeak_changestamp' : 'ar 2/28/2005 17:10'
}
UIManager >> displayProgress: titleString at: aPoint from: minVal to: maxVal during: workBlock [
	"Display titleString as a caption over a progress bar while workBlock is evaluated."
	^self subclassResponsibility
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ar 7/16/2005 18:56'
}
UIManager >> edit: aText [
	"Open an editor on the given string/text"
	^self edit: aText label: nil
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ar 7/16/2005 18:56'
}
UIManager >> edit: aText label: labelString [
	"Open an editor on the given string/text"
	^self edit: aText label: labelString accept: nil
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ar 7/16/2005 18:56'
}
UIManager >> edit: aText label: labelString accept: anAction [
	"Open an editor on the given string/text"
	^self subclassResponsibility
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ct 8/14/2019 23:10'
}
UIManager >> edit: aText label: labelString shouldStyle: aBoolean [
	"Open an editor on the given string/text"
	^self edit: aText label: labelString shouldStyle: aBoolean accept: nil
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ct 8/14/2019 23:09'
}
UIManager >> edit: aText label: labelString shouldStyle: aBoolean accept: anAction [
	"Open an editor on the given string/text"
	^self edit: aText label: labelString accept: anAction
]

{
	#category : #'ui requests',
	#'squeak_changestamp' : 'ar 12/27/2004 08:46'
}
UIManager >> inform: aString [
	"Display a message for the user to read and then dismiss"
	^self subclassResponsibility
]

{
	#category : #'ui requests - progress',
	#'squeak_changestamp' : 'ar 2/28/2005 20:40'
}
UIManager >> informUser: aString during: aBlock [
	"Display a message above (or below if insufficient room) the cursor 
	during execution of the given block.
		UIManager default informUser: 'Just a sec!' during: [(Delay forSeconds: 1) wait].
	"
	^self informUserDuring:[:bar| bar value: aString. aBlock value].
]

{
	#category : #'ui requests - progress',
	#'squeak_changestamp' : 'ar 2/28/2005 17:06'
}
UIManager >> informUserDuring: aBlock [
	"Display a message above (or below if insufficient room) the cursor 
	during execution of the given block.
		UIManager default informUserDuring:[:bar|
			#(one two three) do:[:info|
				bar value: info.
				(Delay forSeconds: 1) wait]]"
	^self subclassResponsibility
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ar 2/28/2005 17:05'
}
UIManager >> multiLineRequest: queryString centerAt: aPoint initialAnswer: defaultAnswer answerHeight: answerHeight [
	"Create a multi-line instance of me whose question is queryString with
	the given initial answer. Invoke it centered at the given point, and
	answer the string the user accepts.  Answer nil if the user cancels.  An
	empty string returned means that the ussr cleared the editing area and
	then hit 'accept'.  Because multiple lines are invited, we ask that the user
	use the ENTER key, or (in morphic anyway) hit the 'accept' button, to 
	submit; that way, the return key can be typed to move to the next line."
	^self subclassResponsibility
]

{
	#category : #'ui project indirecting',
	#'squeak_changestamp' : 'tpr 1/28/2018 17:50'
}
UIManager >> openPluggableFileList: aPluggableFileList label: aString in: aWorld [
	"PluggableFileList is being deprecated and this can go away soon"
	^self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/16/2016 17:47'
}
UIManager >> openToolsAttachedToMouseCursor [
	self flag: #todo. "mt: Let each instances of ui manager have its own setting."
	^ self class openToolsAttachedToMouseCursor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/16/2016 17:47'
}
UIManager >> openToolsAttachedToMouseCursor: aBoolean [
	self flag: #todo. "mt: Let each instances of ui manager have its own setting."
	self class openToolsAttachedToMouseCursor: aBoolean.
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ar 12/27/2004 08:41'
}
UIManager >> request: queryString [ 
	"Create an instance of me whose question is queryString. Invoke it 
	centered at the cursor, and answer the string the user accepts. Answer 
	the empty string if the user cancels."
	^self request: queryString initialAnswer: ''
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'mt 4/15/2020 15:35'
}
UIManager >> request: queryString initialAnswer: defaultAnswer [ 
	"Create an instance of me whose question is queryString with the given initial answer. Answer the  string the user accepts. Answer the empty string if the user cancels."
	
	^ self subclassResponsibility
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'mt 4/15/2020 15:35'
}
UIManager >> request: queryString initialAnswer: defaultAnswer centerAt: aPoint [ 
	"Create an instance of me whose question is queryString with the given initial answer. Invoke it centered at the given point, and answer the	string the user accepts. Answer the empty string if the user cancels."

	^ self request: queryString initialAnswer: defaultAnswer
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'mt 4/15/2020 15:36'
}
UIManager >> request: queryString initialAnswer: defaultAnswer onCancelReturn: cancelResponse [
	"Create an instance of me whose question is queryString with the given initial answer. Answer the string the user accepts. Answer cancelResponse if the user cancels."

	^ self request: queryString initialAnswer: defaultAnswer
]

{
	#category : #'ui requests - text',
	#'squeak_changestamp' : 'ar 12/27/2004 08:47'
}
UIManager >> requestPassword: queryString [
	"Create an instance of me whose question is queryString. Invoke it centered
	at the cursor, and answer the string the user accepts. Answer the empty 
	string if the user cancels."
	^self subclassResponsibility
]

{
	#category : #'ui requests - files',
	#'squeak_changestamp' : 'pre 7/10/2018 08:40'
}
UIManager >> saveFilenameRequest: queryString initialAnswer: defaultAnswer [ 
	"Open a FileSaverDialog to ask for a place and filename to use for saving a file. The initial suggestion for the filename is defaultAnswer but the user may choose any existing file or type in a new name entirely. Returns a file name."

	^self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cmm 6/15/2011 14:50'
}
UIManager >> screenBounds [
	^ Display boundingBox
]

{
	#category : #'ui project indirecting',
	#'squeak_changestamp' : 'tpr 1/26/2018 18:17'
}
UIManager >> startUpMenu: aMenu withCaption: captionOrNil icon: aForm at: location allowKeyboard: aBoolean [
	"A menu needs to startup and depends on the current type of ui manager for what sort of startup to do. Very ugly, and really needs replacing with a much better menu system"
	
	^self subclassResponsibility
	
]

{
	#category : #builder,
	#'squeak_changestamp' : 'dtl 3/21/2015 11:51'
}
UIManager >> toolBuilder [
	^ self builderClass new
]
