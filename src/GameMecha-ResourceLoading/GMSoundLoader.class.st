"
A GMSoundLoader can handle sounds. It supports wav and aiff files.
SampledSounds can be accessed directly or played immediately.
Only one music can be played at a time (but repeating) and paused. 
Multiple sounds can be played at the same time. They are played once.

Storing sounds in methods only supports .wav files
"
Class {
	#name : #GMSoundLoader,
	#superclass : #GMResourceLoader,
	#instVars : [
		'loudness',
		'currentMusic'
	],
	#category : #'GameMecha-ResourceLoading',
	#'squeak_changestamp' : 'ek 9/9/2021 10:56'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/3/2018 22:12'
}
GMSoundLoader >> at: aString [
	^ (super at: aString)
		loudness: self loudness;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/18/2018 19:22'
}
GMSoundLoader >> currentMusic [
	^ currentMusic ifNil: [currentMusic := RepeatingSound new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/18/2018 18:39'
}
GMSoundLoader >> currentMusic: anObject [
	currentMusic := anObject
]

{
	#category : #loading,
	#'squeak_changestamp' : 'brh 5/13/2018 17:57'
}
GMSoundLoader >> isSupportedType: aFileExtension [
	^ self supportedTypes keys includes: aFileExtension
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/13/2018 15:27'
}
GMSoundLoader >> loudness [
	^ loudness ifNil: [loudness := 1.0]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/18/2018 19:21'
}
GMSoundLoader >> loudness: anObject [
	self currentMusic loudness: anObject.
	loudness := anObject
]

{
	#category : #'playing sounds',
	#'squeak_changestamp' : 'brh 5/18/2018 19:20'
}
GMSoundLoader >> pauseMusic [
	self currentMusic pause.
]

{
	#category : #'playing sounds',
	#'squeak_changestamp' : 'brh 7/3/2018 22:12'
}
GMSoundLoader >> playMusic: aString [
	self currentMusic: (RepeatingSound repeatForever: (self at: aString)).
	self currentMusic play.
]

{
	#category : #'playing sounds',
	#'squeak_changestamp' : 'brh 7/3/2018 22:12'
}
GMSoundLoader >> playSound: aString [
	(self at: aString) play.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'brh 7/14/2018 23:53'
}
GMSoundLoader >> resourceFromDrive: aFilename [
	^ (self supportedTypes at: (FileDirectory extensionFor: aFilename)
		ifAbsent: [:x | self error: #FileNotFound])
		value: (FileDirectory uri: aFilename) fullName
]

{
	#category : #'playing sounds',
	#'squeak_changestamp' : 'AZ 7/10/2018 16:02'
}
GMSoundLoader >> resumePlayingMusic [
	self currentMusic resumePlaying.
]

{
	#category : #storing,
	#'squeak_changestamp' : 'tok 12/16/2019 14:21'
}
GMSoundLoader >> sampledSoundStringFromSound: aSound withSamplesIn: aSelector andSamplingRate: aNumber [
	aSound setSamples: #[] samplingRate: aNumber.
	^ (WriteStream on: '')
		store: aSound;
		nextPutAll: ' setSamples: (SoundBuffer fromByteArray: self ';
		nextPutAll: aSelector asString;
		nextPutAll: ') samplingRate: ', aNumber;
		contents
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/24/2018 20:34'
}
GMSoundLoader >> samplesMethodName: aSelector [
	^ (aSelector asString , 'Samples') asSymbol
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/24/2018 20:30'
}
GMSoundLoader >> samplesStringFromSound: aSound [
	^ (WriteStream on: '')
		store: (aSound samples asByteArray base64Encoded);
		nextPutAll: ' base64Decoded asByteArray';
		contents
]

{
	#category : #storing,
	#'squeak_changestamp' : 'tok 12/16/2019 14:21'
}
GMSoundLoader >> storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename [
	"meta-programming warning
	 only supports WAV, overwritten because we need multiple methods"
	self storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename withSamplingRate: 44100.

]

{
	#category : #storing,
	#'squeak_changestamp' : 'tok 12/16/2019 14:20'
}
GMSoundLoader >> storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename withSamplingRate: aNumber [
	"meta-programming warning
	 only supports WAV, overwritten because we need multiple methods"
	| sound |
	sound := self resourceFromDrive: aFilename.
	self compileMethod: (self samplesMethodName: aSelector)
		inInstance: anInstance 
		fromString: (self samplesStringFromSound: sound).
	self compileMethod: aSelector 
		inInstance: anInstance 
		fromString: (self sampledSoundStringFromSound: sound 
			withSamplesIn: (self samplesMethodName: aSelector)
			andSamplingRate: aNumber).

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:20'
}
GMSoundLoader >> supportedTypes [
	^ Dictionary newFrom: 
		{'wav' -> [:filename | SampledSound fromWaveFileNamed: filename].
		'aiff' -> [:filename | SampledSound fromAIFFfileNamed: filename]}
]
