"
FileAbstractSelectionDialog is the abstract superclass for the file chooser & saver modal dialogs.

The UI provides a message  to the user, a text input field, a directory tree widget and a list of files within any chosen directory, and buttons to accept the selected file name/path or cancel the operation. See subclass comments and class side methods for specific usage examples.

Instance Variables
	directory:		<FileDirectory> used for the currently selected directory
	directoryCache:		<WeakIdentityKeyDictionary> used to cache a boolean to help us more quickly populate the directory tree widget when revisiting a directory
	fileName:		<String|nil> the name of the currently selected file, if any
	finalChoice:		<String|nil> pathname of the finally chosen file, returned as the result of accepting; nil is returned otherwise
	list:		<Array> the list of String of filenames (and date/size) that match the current pattern 
	listIndex:		<Integer> list index of the currently selected file
	patternList:		<OrderedCollection of String> the patterns are held as a collection of string that may include * or # wildcards. See FileAbstractSelectionDialog>>#parsePatternString for details
	message:		<String> a message to the user to explain what is expected 
	nameList,DateList, sizeList:	<Array> the list of file names matching the pattern and the appropriate date and size values, formatted for a PluggableMultiColumnListMorph
"
Class {
	#name : #FileAbstractSelectionDialog,
	#superclass : #Model,
	#instVars : [
		'patternList',
		'directory',
		'directoryCache',
		'message',
		'listIndex',
		'fileName',
		'finalChoice',
		'nameList',
		'sizeList',
		'dateList',
		'suffixList'
	],
	#category : #'ToolBuilder-Morphic-Tools',
	#'squeak_changestamp' : 'tpr 11/21/2017 18:18'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'tpr 11/9/2017 16:19'
}
FileAbstractSelectionDialog >> acceptFileName [
	"User clicked to accept the current state so save the filename and close the dialog"

	finalChoice := fileName.
	self changed: #close
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'ct 1/3/2022 23:49'
}
FileAbstractSelectionDialog >> buildButtonsWith: builder [

	^ {
		builder pluggableButtonSpec new
				model: self;
				label: 'Accept' translated;
				color: (self userInterfaceTheme get: #okColor for: #DialogWindow);
				action: #acceptFileName.
		builder pluggableButtonSpec new
				model: self;
				label: 'Cancel' translated;
				color: (self userInterfaceTheme get: #cancelColor for: #DialogWindow);
				action: #cancelFileChooser}
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 2/10/2022 10:13'
}
FileAbstractSelectionDialog >> buildDirectoryTreeWith: builder [ 
	| treeSpec |
	treeSpec := builder pluggableTreeSpec new.
	treeSpec
		 model: self ;
		 roots: #rootDirectoryList ;
		 hasChildren: #hasMoreDirectories: ;
		 getChildren: #subDirectoriesOf: ;
		 getSelectedPath: #selectedPath ;
		 setSelected: #setDirectoryTo: ;
		 getSelected: #directory;
		 label: #directoryNameOf: ;
		 menu: nil ;
		 autoDeselect: false .
	^ treeSpec
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 2/10/2022 10:14'
}
FileAbstractSelectionDialog >> buildFileListWith: builder [ 
	| listSpec |
	listSpec := builder pluggableListSpec new.
	listSpec
		 model: self ;
		 list: #fileList ;
		 getIndex: #fileListIndex ;
		 setIndex: #fileListIndex: ;
		 menu: nil ;
		 keyPress: nil ;
		 frame:
		(self
			frameOffsetFromTop:0
			fromLeft: 0
			width: 1
			bottomFraction: 1) .
	^listSpec
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'cmm 3/30/2018 15:35'
}
FileAbstractSelectionDialog >> buildTextInputWith: builder [
	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec 
		model: self;
		name: #inputText ;
		font: self textViewFont;
		getText: #inputText;
		setText: #selectFilename:;
		selection: #contentsSelection.
	^textSpec

]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 2/7/2022 20:01'
}
FileAbstractSelectionDialog >> buildWindowWith: builder [
	"Since a file chooser is a modal dialog we over-ride the normal window build to use a dialog as the top component"

	| windowSpec |
	windowSpec := builder pluggableDialogSpec new.
	windowSpec model: self;
				label: #windowTitle;
				message: #userMessage;
				extent: self initialExtent;
				children: OrderedCollection new;
				buttons: OrderedCollection new.
	^windowSpec
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'tpr 11/20/2017 17:57'
}
FileAbstractSelectionDialog >> buildWith: builder [
	"assemble the spec for the common chooser/saver dialog UI"

	^self subclassResponsibility
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'mt 2/7/2022 19:58'
}
FileAbstractSelectionDialog >> buttonHeight [
	
	^ ToolBuilder default buttonRowHeight
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'tpr 12/23/2017 12:35'
}
FileAbstractSelectionDialog >> cancelFileChooser [
	"User clicked to cancel the current state so nil the filename and close the dialog"

	directory := finalChoice := fileName := nil.
	self changed: #close.
]

{
	#category : #'path and pattern',
	#'squeak_changestamp' : 'tpr 11/20/2017 11:19'
}
FileAbstractSelectionDialog >> defaultPatternList [

	^#('*')
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 11/21/2017 09:22'
}
FileAbstractSelectionDialog >> directory [
	"If nobody has set a specific directory we need a plausible default"

	^ directory ifNil: [ directory := FileDirectory default]
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 11/20/2017 18:15'
}
FileAbstractSelectionDialog >> directory: aFileDirectory [ 
	"Set the path of the directory to be displayed in the directory tree pane"

	directory := aFileDirectory
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 10/25/2017 18:11'
}
FileAbstractSelectionDialog >> directoryNameOf: aDirectory [
	"Return a name for the selected directory in the tree view"

	^aDirectory localName
]

{
	#category : #'file list',
	#'squeak_changestamp' : 'tpr 11/21/2017 09:23'
}
FileAbstractSelectionDialog >> entriesMatching: patternList [
	"Answer a list of directory entries which match any of the patterns.
	See #parsePatternString for the pattern rules"

	| entries  |
	"This odd clause helps supports MVC projects; the file list & directory views are built from a list that includes directories. In Morphic we filter out the directories because they are entirely handled by the direcctory tree morph"
	entries := Smalltalk isMorphic 
		ifTrue:[self directory fileEntries ]
		ifFalse:[self directory entries].

	(patternList anySatisfy: [:each | each = '*'])
		ifTrue: [^ entries].

	^ entries select: [:entry | patternList anySatisfy: [:each | each match: entry name]]
]

{
	#category : #'file list',
	#'squeak_changestamp' : 'cmm 9/4/2018 15:15'
}
FileAbstractSelectionDialog >> fileList [
	"return the list of files in the currently selected directory; if we haven't yet read an actual directory return empty lists for now"

	nameList ifNil: [nameList := dateList := sizeList := #()].
	^nameList
]

{
	#category : #'file list',
	#'squeak_changestamp' : 'tpr 11/9/2017 11:22'
}
FileAbstractSelectionDialog >> fileListIndex [
	"return the index in the list of files for the currently selected file; we initialise this to 0 so that the initial listmorph doesn't get upset before we actually populate it with file details - which we don't do until a directory is selected"
	
	^listIndex
]

{
	#category : #'file list',
	#'squeak_changestamp' : 'tpr 11/19/2017 20:04'
}
FileAbstractSelectionDialog >> fileListIndex: anInteger [
	"We've selected the file at the given index, so find the file name."

	self okToChange ifFalse: [^ self].
	listIndex := anInteger.
	listIndex = 0 
		ifTrue: [fileName := nil]
		ifFalse: [fileName := nameList at: anInteger].  "open the file selected"

	self 
		changed: #fileListIndex;
		changed: #inputText
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 1/17/2018 09:34'
}
FileAbstractSelectionDialog >> filterEvent: aKeyboardEvent for: aMorph [

	| char |
	aKeyboardEvent isKeystroke ifFalse: [^ aKeyboardEvent].
	aKeyboardEvent anyModifierKeyPressed ifTrue: [^ aKeyboardEvent].
	
	char := aKeyboardEvent keyCharacter.
	
	(char = Character cr or: [char = Character enter])
		ifTrue: [self acceptFileName. aKeyboardEvent ignore].
	char = Character escape 
		ifTrue: [self cancelFileChooser. aKeyboardEvent ignore].
	
	^ aKeyboardEvent
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'tpr 12/23/2017 12:33'
}
FileAbstractSelectionDialog >> finalChoice [
	"return the chosen directory/filename that was saved by an accept click or nil; client must check for validity"
	^ finalChoice
		ifNotNil: [self directory fullNameFor: finalChoice]
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'tpr 10/26/2017 10:19'
}
FileAbstractSelectionDialog >> frameOffsetFromTop: height fromLeft: leftFraction width: widthFraction bottomFraction: bottomFraction [
	"return a layout frame that starts at the fixed upper offset and goes down to the bottomFraction, and runs widthFraction from the leftFraction"

	^LayoutFrame new
		topFraction: 0 offset: height;
		leftFraction: leftFraction offset: 0;
		rightFraction: (leftFraction + widthFraction) offset: 0;
		bottomFraction: bottomFraction offset: 0;
		yourself.
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'tpr 10/26/2017 11:39'
}
FileAbstractSelectionDialog >> frameOffsetFromTop: height fromLeft: leftFraction width: widthFraction offsetFromBottom: bottomOffset [
	"return a layout frame that starts at the fixed upper offset and goes down to the bottom - the offsetn, and runs widthFraction from the leftFraction"

	^LayoutFrame new
		topFraction: 0 offset: height;
		leftFraction: leftFraction offset: 0;
		rightFraction: (leftFraction + widthFraction) offset: 0;
		bottomFraction: 1 offset: bottomOffset negated;
		yourself.
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'tpr 11/20/2017 18:24'
}
FileAbstractSelectionDialog >> getUserResponse [	
	"open the dialog modally and get a user response"

	ToolBuilder open: self.
	^self finalChoice
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 12/26/2017 13:34'
}
FileAbstractSelectionDialog >> hasMoreDirectories: aDirectory [
	"The directory tree morph needs to know if a specific directory has subdirectories; we cache the answer to speed up later visits to the same directory"

	^directoryCache at: aDirectory ifAbsentPut:[
		[aDirectory hasSubDirectories] on: Error do:[:ex| true].
	].
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 12/6/2021 10:51'
}
FileAbstractSelectionDialog >> initialExtent [

	^ (super initialExtent * (0.8 @ 0.7) * RealEstateAgent scaleFactor) truncated
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'cmm 3/29/2018 21:14'
}
FileAbstractSelectionDialog >> initialize [
	super initialize.
	directoryCache := WeakIdentityKeyDictionary new.
	listIndex := 0.
	patternList := self defaultPatternList.
	suffixList := OrderedCollection new
]

{
	#category : #'path and pattern',
	#'squeak_changestamp' : 'tpr 11/20/2017 18:04'
}
FileAbstractSelectionDialog >> listForPatterns: arrayOfPatterns [
	"build lists of name, date and size for those file names which match any of the patterns in the array.
	We use a Set to avoid duplicates and sort them by name"

	| newList |
	newList := Set new.
	newList addAll: (self entriesMatching: arrayOfPatterns).

	newList := newList sorted: [:a :b|
							a name <= b name].
	nameList := newList collect:[:e| e name].
	dateList := newList collect:[:e| ((Date fromSeconds: e modificationTime )
					printFormat: #(3 2 1 $. 1 1 2)) , ' ' ,
				(String streamContents: [:s |
					(Time fromSeconds: e modificationTime \\ 86400)
						print24: true on: s])].
	sizeList := newList collect:[:e| e  fileSize asStringWithCommas] 

]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'tpr 11/20/2017 18:29'
}
FileAbstractSelectionDialog >> message: aStringOrText [
	"set the user message to be dispalyed at the top of the dialog - it should guide the user as to what they must do"

	message := aStringOrText
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 1/5/2019 21:51'
}
FileAbstractSelectionDialog >> newDirectoryName [
	"Create a new directory; will be a subdirectory of the current chosen directory. 
	If the user input is empty, or if the directory creation fails, fail this method.
	Update the directory tree display afterwards and set the current directory to the newly created directory"
	|userInput|
	userInput := UIManager default request: 'New directory name' translated initialAnswer: 'newDir'.
	userInput isEmptyOrNil ifTrue: [^nil].
	
	[self directory createDirectory: userInput] ifError:[^nil]. "I hate using ifError: - it's so indiscriminate. Really ought to be a more precise error to catch properly"

	self changed: #rootDirectoryList.
	self directory: (self directory / userInput).
	self changed: #selectedPath
]

{
	#category : #'file list',
	#'squeak_changestamp' : 'tpr 11/20/2017 11:20'
}
FileAbstractSelectionDialog >> parsePatternString: aStringOrNil [
	"The pattern is a string that may have three simple tokens included along with normal characters; 
	a) a ; or LF or CR splits the string into separate patterns and filenames matching any of them will be included in list
	b) a * matches any number of characters
	c) a # matches one character"

	| patterns |
	aStringOrNil ifNil:[^self defaultPatternList].
	patterns := OrderedCollection new.
	(aStringOrNil findTokens: (String with: Character cr with: Character lf with: $;))
		do: [ :each |
			(each includes: $*) | (each includes: $#)
					ifTrue: [ patterns add: each]
					ifFalse: [each isEmptyOrNil
										ifTrue: [ patterns add: '*']
										ifFalse: [ patterns add: '*' , each , '*']]].

	^patterns
]

{
	#category : #'path and pattern',
	#'squeak_changestamp' : 'tpr 11/20/2017 11:17'
}
FileAbstractSelectionDialog >> pattern: textOrStringOrNil [
	"Make sure the pattern source string is neither nil nor empty.
	We can strictly speaking handle arbitrary patterns to match against the filenames but in general we need to use suffices, so see #suffix: and #suffixList: "

	patternList := self parsePatternString: textOrStringOrNil
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 12/26/2017 16:14'
}
FileAbstractSelectionDialog >> rootDirectoryList [
	"Return a list of know root directories; forms the root nodes ot the directory tree morph"

	| dirList dir |
	dir := FileDirectory root.
	dirList := self subDirectoriesOf: dir.
	dirList isEmpty ifTrue:[dirList := Array with: FileDirectory default].
	^dirList ,(ServerDirectory servers values) "looks odd because #servers returns the Dictionary of known servers with local names instead of the actaul server directories"
]

{
	#category : #'path and pattern',
	#'squeak_changestamp' : 'tpr 11/21/2017 09:22'
}
FileAbstractSelectionDialog >> selectedPath [
	"Return an array of directories representing the path from directory up to the root; used to build the directory tree morph"

	| top here |
	top := FileDirectory root.
	here := self directory.
	^(Array streamContents:[:s| | next |
		s nextPut: here.
		[next := here containingDirectory.
		top pathName = next pathName] whileFalse:[
			s nextPut: next.
			here := next.
		]]) reversed.
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 11/20/2017 18:15'
}
FileAbstractSelectionDialog >> setDirectoryTo: dir [
	"Set the current directory shown in the FileList. 
	Does not allow setting the directory to nil since this blows up in various places."

	dir ifNil:[^self].
"okToChange is probably redundant.
modelSleep/Wake is related to use of ServerDirectories, which are not yet hooked up"
	self okToChange ifFalse: [ ^ self ].
	self modelSleep.
	self directory: dir.
	self modelWakeUp.
	self changed: #directory.
	self updateFileList.
	self changed: #inputText
]

{
	#category : #'directory tree',
	#'squeak_changestamp' : 'tpr 6/20/2020 10:03'
}
FileAbstractSelectionDialog >> subDirectoriesOf: aDirectory [
	"provide a list of subdirectory names sorted alphnum-no-case"

	^(aDirectory directoryNames sorted: [:a :b| (a compare: b) <= 2]) collect:[:each| aDirectory directoryNamed: each].
]

{
	#category : #'path and pattern',
	#'squeak_changestamp' : 'tpr 11/20/2017 17:59'
}
FileAbstractSelectionDialog >> suffix: textOrStringOrNil [
	"Make a pattern from a single filename suffix string, i.e. 'jpg'"

	self suffixList: (Array with: textOrStringOrNil )
]

{
	#category : #'path and pattern',
	#'squeak_changestamp' : 'cmm 3/29/2018 21:15'
}
FileAbstractSelectionDialog >> suffixList: listOfStrings [ 
	"Make a pattern list from a one or more filename suffix strings in a list , i.e. #('jpg' 'mpeg') "
	listOfStrings isEmptyOrNil
		ifTrue: [ patternList := self defaultPatternList ]
		ifFalse:
			[ patternList := OrderedCollection new.
			listOfStrings do:
				[ : each | each isEmptyOrNil ifFalse:
					[ patternList add: '*.' , each.
					suffixList add: each ] ] ]
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'mt 2/7/2022 19:59'
}
FileAbstractSelectionDialog >> textViewFont [

	^ TextStyle defaultFont
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'mt 2/7/2022 19:59'
}
FileAbstractSelectionDialog >> textViewHeight [

	^ ToolBuilder default inputFieldHeight
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'tpr 10/26/2017 10:16'
}
FileAbstractSelectionDialog >> topConstantHeightFrame: height fromLeft: leftFraction width: widthFraction [
	"return a layout to make a fixed height frame that starts at the top of its parent and runs widthFraction from the leftFraction."

	^LayoutFrame new
		topFraction: 0 offset: 0;
		leftFraction: leftFraction offset: 0;
		rightFraction: (leftFraction + widthFraction) offset: 0;
		bottomFraction: 0 offset: height;
		yourself.
]

{
	#category : #'file list',
	#'squeak_changestamp' : 'tpr 11/20/2017 11:09'
}
FileAbstractSelectionDialog >> updateFileList [
	"Update my files list with file names in the current directory that match the patternList."

		Cursor wait
			showWhile: [self listForPatterns: patternList.
				listIndex := 0.
				self changed: #fileList]
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'mt 9/18/2019 09:00'
}
FileAbstractSelectionDialog >> userMessage [

	^ message ifNil: ['']
]
