"
A DirectoryChooserDialog is a modal dialog to allow choosing a directory. The actual directory chosen is returned, or nil if no selection was made.

Normal usage would be 
	myDirectory := DirectoryChooserDialog openOn: myApplicationDefaultDirectory label: 'Choose the directory to use'

"
Class {
	#name : #DirectoryChooserDialog,
	#superclass : #FileAbstractSelectionDialog,
	#category : #'ToolBuilder-Morphic-Tools',
	#'squeak_changestamp' : 'tpr 4/2/2018 09:52'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'tpr 4/1/2018 16:47'
}
DirectoryChooserDialog class >> findAFolderForProject: aProject label: labelString [
	"Select a directory for either saving or loading a project file"
	"Temporary simple version without the 'interesting' blue ui stuff
	See FileList2 class>>#modalFolderSelectorForProject: for the full horror"
	^self openOn: FileDirectory default label: labelString
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'tpr 12/22/2017 15:31'
}
DirectoryChooserDialog class >> openOn: aDirectory label: labelString [
	"open a directory chooser starting with aDirectory"

	"DirectoryChooserDialog openOn: FileDirectory default label: 'Choose the directory to use' "

	^super new
		directory: aDirectory;
		message: labelString;
		getUserResponse
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'tpr 12/23/2017 12:44'
}
DirectoryChooserDialog >> acceptFileName [
	"User clicked to accept the current state so save the directory and close the dialog"

	finalChoice := directory.
	self changed: #close
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'tpr 1/5/2019 21:55'
}
DirectoryChooserDialog >> buildButtonsWith: builder [
	"add a 'new directory' button to the beginning of the row of buttons"
	^{ builder pluggableButtonSpec new
				model: self;
				label: 'New Directory' translated;
				color: (self userInterfaceTheme get: #buttonColor for: #DialogWindow);
				action: #newDirectoryName}, (super buildButtonsWith: builder)
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 9/18/2019 09:15'
}
DirectoryChooserDialog >> buildDirectoryTreeWith: builder [

	^ (super buildDirectoryTreeWith: builder)
		hScrollBarPolicy: #never; "Use the dialog grips to see more"
		yourself
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 1/18/2018 07:58'
}
DirectoryChooserDialog >> buildWith: builder [
	"assemble the spec for the chooser dialog UI"

	| windowSpec window |
	windowSpec := self buildWindowWith: builder specs: {
		(self frameOffsetFromTop: 0
			fromLeft: 0
			width: 1
			offsetFromBottom: 0) -> [self buildDirectoryTreeWith: builder].
	}.
	windowSpec buttons addAll: ( self buildButtonsWith: builder ).
	window := builder build: windowSpec.
	window addKeyboardCaptureFilter: self.
	self changed: #selectedPath.
	^window

]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'tpr 12/23/2017 18:13'
}
DirectoryChooserDialog >> finalChoice [
	"return the chosen directory that was saved by an accept click or nil; client must check for validity"

	^ finalChoice
		ifNotNil: [self directory]
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 3/14/2022 11:13'
}
DirectoryChooserDialog >> initialExtent [
	"Since this is a single list it can be a bit narrower than a FileChooserDialog"

	^ super initialExtent * (0.6 @ 1)
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'ct 1/3/2022 23:49'
}
DirectoryChooserDialog >> userMessage [
	"return the string to present to the user  in order to explain the purpose of this dialog appearing"
	
	^message ifNil: ['Choose a directory name' translated]
]

{
	#category : #'ui details',
	#'squeak_changestamp' : 'ct 1/3/2022 23:49'
}
DirectoryChooserDialog >> windowTitle [
	
	^ 'Choose Directory' translated
]
