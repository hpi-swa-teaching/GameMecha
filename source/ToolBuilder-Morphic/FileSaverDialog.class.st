"
A FileSaverDialog is a modal dialog for choosing a file name to use for saving a file.

Users can enter a filename in the text input view that will 
a) if it exists in the current directry listing, be selected
b) over ride any filenames in the current directory, providing a way to specify a completely new file.
This will not affect the selected directory path.

Normal usage would be 
	myFilename := FileSaverDialog openOnInitialFilename: myApp saveFileName
which would derive a directory, an initial filename and filename suffix from the given file name. Thus a typical application save might be 
	...  openOnInitialFilename: '/home/pi/myApp/examplePicture.jpg'
and would set the initial directory to /home/pi/myapp, the initial filename to examplePicture.jpg and set a suffix pattern of 'jpg'. Only filenames with the specified suffix will appear in the file list view. It is possible to specify several suffices, (see #suffixList:) and use wildcards within the suffix.

	myFilename := FileSaverDialog openOn: myApplicationDefaultDirectory initialFilename: 'foo.myapp'
would set directory initial choice set to myApplicationDefaultDirectory and ignore any directory found in the filename. It would be quite possible to choose a file from any other directory and with any other name  that matches the suffix if the user wishes, so the file name must be carefully checked. 

The full set of options would involve
	myFilename := FileSaverDialog  openOn: myApplicationDefaultDirectory initialFilename: 'foo.myapp' suffix: 'mya' message: 'Save your myApp file to ... '

It is also possible to set a more general pattern to match filenames against but since this seems less useful for normal application usage there are no convenience messages as yet.

See the class side methods for details. See my parent class for most implementation details
"
Class {
	#name : #FileSaverDialog,
	#superclass : #FileAbstractSelectionDialog,
	#category : #'ToolBuilder-Morphic-Tools',
	#'squeak_changestamp' : 'dtl 12/21/2017 22:47'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'dtl 12/21/2017 22:36'
}
FileSaverDialog class >> openOn: aDirectory [
	"open a modal dialog to save a file. Start the dialog with aDirectory selected
	and no suggested file name"

	"FileSaverDialog openOn: FileDirectory default"

	^self openOn: aDirectory initialFilename: nil label: nil
	
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'dtl 12/21/2017 22:41'
}
FileSaverDialog class >> openOn: aDirectory initialFilename: aString [
	"Open a modal dialog to save a file. Start the dialog with aDirectory selected
	and aString as the suggested file name. Note that we set the directory after
	the initialFilename becuase we want a specific directory and not neccesarily 
	the directory of the file."

	"FileSaverDialog openOn: FileDirectory default initialFilename: 'aSuggestedFileName' "

	^self openOn: aDirectory initialFilename: aString label: nil

]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 11/24/2021 15:39'
}
FileSaverDialog class >> openOn: aDirectory initialFilename: aString label: labelString [
	"Open a modal dialog to save a file. Start the dialog with aDirectory selected
	and aString as the suggested file name. Set the user message to labelString.
	Note that we set the directory after the initialFilename becuase we want a
	specific directory and not neccesarily the directory of the file"

	"FileSaverDialog openOn: FileDirectory default initialFilename: 'aSuggestedFileName' label: 'Select a flie and do something with it' "

	^self new
		directory: aDirectory;
		initialFilename: aString; "Might include a path and thus override aDirectory."
		message: labelString;
		getUserResponse

	
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'dtl 12/21/2017 22:40'
}
FileSaverDialog class >> openOnInitialFilename: filenameString [
	"Open a modal dialog to save a file. Start the dialog with the default directory
	selected and the suggested file name."

	"FileSaverDialog openOnInitialFilename: 'aSuggestedFileName' "

	^self openOn: nil initialFilename: filenameString label: nil

]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'dtl 12/21/2017 22:39'
}
FileSaverDialog class >> openOnInitialFilename: filenameString label: labelString [
	"Open a modal dialog to save a file. Start the dialog with the default directory
	selected and the suggested file name, set the user message to labelString"

	"FileSaverDialog openOnInitialFilename: 'aSuggestedFileName' label: 'Select a flie and do something with it' "

	^self openOn: nil initialFilename: filenameString label: labelString

]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'tpr 11/9/2017 16:08'
}
FileSaverDialog >> acceptFileName [
	"make sure to accept any edit in the filename before closing"

	self changed: #acceptChanges.
	^super acceptFileName
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'tpr 1/1/2019 18:49'
}
FileSaverDialog >> buildButtonsWith: builder [
	"add a 'new directory' button to the beginning of the row of buttons"
	^{ builder pluggableButtonSpec new
				model: self;
				label: 'New Directory' translated;
				color: (self userInterfaceTheme get: #buttonColor for: #DialogWindow);
				action: #newDirectoryName}, (super buildButtonsWith: builder)
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 2/7/2022 20:00'
}
FileSaverDialog >> buildWith: builder [
	"assemble the spec for the saver dialog UI and build the window"

	| window windowSpec |
	windowSpec := self buildWindowWith: builder specs: {
		(self topConstantHeightFrame: self textViewHeight
			fromLeft: 0
			width: 1) -> [self buildTextInputWith: builder].
		(self frameOffsetFromTop: self textViewHeight
			fromLeft: 0.35
			width: 0.65
			offsetFromBottom: 0) -> [self buildFileListWith: builder].
		(self frameOffsetFromTop: self textViewHeight
			fromLeft: 0
			width: 0.35
			offsetFromBottom: 0) -> [self buildDirectoryTreeWith: builder].
	}.
	windowSpec buttons addAll: ( self buildButtonsWith: builder ).
	window := builder build: windowSpec.
	window addKeyboardCaptureFilter: self.
	self changed: #selectedPath.
	self inputText: fileName.
	window positionOverWidgetNamed: #inputText.
	^window

]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'cmm 3/30/2018 14:20'
}
FileSaverDialog >> contentsSelection [
	^ 1 to: 9999
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'tpr 11/22/2017 16:39'
}
FileSaverDialog >> initialFilename: aFilenameOrNil [
	"Set the initial choice of filename to highlight.
	We split the potential filename to see if it includes a path and if so, use that as the chosen directory - the client can manually change that with a subsequent send of #directory: if wanted.
	We split the root filename to find an extension and use that as the suffix - again, the client can manually change that later"

	| e f p |
	aFilenameOrNil ifNil:[^self].
	
	p := FileDirectory dirPathFor: aFilenameOrNil.
	p isEmpty ifFalse:[self directory: (FileDirectory on: p)].	
	f := FileDirectory localNameFor: aFilenameOrNil.
	fileName := f.
	e := FileDirectory extensionFor: f.
	e isEmpty ifFalse:[self suffix: e]
]

{
	#category : #filename,
	#'squeak_changestamp' : 'tpr 11/21/2017 15:10'
}
FileSaverDialog >> inputText [
	"return the filename to appear in the text field"

	^fileName ifNil:['Enter a filename here or choose from list' translated]
]

{
	#category : #filename,
	#'squeak_changestamp' : 'jr 2/2/2019 23:53'
}
FileSaverDialog >> inputText: aText [ 
	"Initialize the filename entry field to aString.  If a file with that name already exists, set up to highlight it."
	aText ifNil: [^ self].
	fileName := aText asString.
	self selectExistingFilename
]

{
	#category : #private,
	#'squeak_changestamp' : 'cmm 3/30/2018 16:14'
}
FileSaverDialog >> selectExistingFilename [
	"Answer whether an existing file in the list matches my proposed filename, selecting it if it does."
	^ (patternList anySatisfy:
		[ : each | (each
			compare: fileName
			caseSensitive: FileDirectory default isCaseSensitive) = 2 ])
		and:
			[ listIndex := nameList findFirst: [ : each | each = fileName ].
			true ]
]

{
	#category : #filename,
	#'squeak_changestamp' : 'ct 1/3/2022 23:50'
}
FileSaverDialog >> selectFilename: aText [ 
	"The user has entered a potential filename in the text field.  Check it against the current pattern; if it is ok we can accept it and then if it is a file in the current list, highlight it.  If it would not match the pattern, alert the user."
	fileName := aText asString.
	^ self selectExistingFilename
		ifTrue:
			[ self changed: #fileListIndex.
			true ]
		ifFalse:
			[ suffixList size = 1
				ifTrue:
					[ | suffix |
					((suffix := '.' , suffixList anyOne)
						compare: (fileName last: (suffix size min: fileName size))
						caseSensitive: FileDirectory default isCaseSensitive) = 2 ifFalse: [ fileName := fileName , suffix ].
					true ]
				ifFalse:
					[ suffixList
						at:
							(UIManager default
								chooseFrom: suffixList
								title: 'Please choose the type of file to save.' translated)
						ifPresent:
							[ : choice | fileName := fileName , '.' , choice.
							true ]
						ifAbsent:
							[ suffixList isEmpty or:
								[ self inform: ('WARNING:  File not saved!  A filename matching one of {1} patterns is required.' translated format: {patternList asArray}).
								false ] ] ] ]
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'ct 1/3/2022 23:50'
}
FileSaverDialog >> userMessage [
	"return the string to present to the user  in order to explain the purpose of this dialog appearing"
	
	^message ifNil: ['Choose a file name; you can also edit the name below to create a new file name' translated]
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'ct 1/3/2022 23:50'
}
FileSaverDialog >> windowTitle [
	"return the window label; would be some application dependent string but I suspect we will want to make the outer morph a dialogue box with no label anyway"
	
	^ 'Save As File' translated
]
