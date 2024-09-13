"
This is a simple Morph which changes color when a specific key is pressed. Its used in the GMKeyHandlerAcceptance.
For details about the key handling look at the the initialize method of GMKeyHandlerAcceptanceTest and then see the step method of this class.
Alternatively have a look at GMRegisterKeyEventsAcceptance to see another possibility how to handle keyboard inputs with a GMKeyHandler.

"
Class {
	#name : #GMKeyHandlerAcceptanceKeyMorph,
	#superclass : #Morph,
	#instVars : [
		'stringMorph',
		'listenToKey',
		'parent'
	],
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/24/2018 16:13'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/26/2018 19:17'
}
GMKeyHandlerAcceptanceKeyMorph class >> defaultExtent [
	^ 100 @ 60
]

{
	#category : #'key handling',
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMKeyHandlerAcceptanceKeyMorph >> gmIsKeyPressed: aCharacter [
	"First use-case of the keyHandling, ask for pressed keys:
	After we have registered the GMKeyHandler with gmRegisterToKeyHandler (see initialize), we are now able to ask whether a specific key
	(specified as a character) is pressed"
	^ self parent gmIsKeyPressed: aCharacter
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'AZ 6/26/2018 19:22'
}
GMKeyHandlerAcceptanceKeyMorph >> initialize [
	super initialize.
	self 
		extent: self class defaultExtent;
		stringMorph: StringMorph new;
		addMorph: self stringMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/26/2018 19:25'
}
GMKeyHandlerAcceptanceKeyMorph >> label: aString [
	self stringMorph 
		contents: aString;
		center: self center.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/26/2018 16:06'
}
GMKeyHandlerAcceptanceKeyMorph >> listenToKey [
	^ listenToKey
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/26/2018 16:06'
}
GMKeyHandlerAcceptanceKeyMorph >> listenToKey: anObject [
	listenToKey := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/26/2018 16:07'
}
GMKeyHandlerAcceptanceKeyMorph >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/26/2018 16:07'
}
GMKeyHandlerAcceptanceKeyMorph >> parent: anObject [
	parent := anObject
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'TP 7/10/2018 20:04'
}
GMKeyHandlerAcceptanceKeyMorph >> step [
	"Because we previously registered a GMKeyHandler for this Morph we can now ask whether a specific key
	(given by its ASCII key character) is pressed. To see a list of all supported characters use 
	'GMKeyHandlerAcceptanceTest new openInWorld' or if you only accept code as single source of truth
	look at the initilizeKeyLookupXXX methods on class side of GMKeyHandler."
	(self gmIsKeyPressed: self listenToKey) 
		ifTrue: [self color: Color gray]
		ifFalse: [self color: Color white].
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'AZ 6/26/2018 16:07'
}
GMKeyHandlerAcceptanceKeyMorph >> stepTime [ 
	^ 33
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/26/2018 16:19'
}
GMKeyHandlerAcceptanceKeyMorph >> stringMorph [
	^ stringMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/26/2018 16:06'
}
GMKeyHandlerAcceptanceKeyMorph >> stringMorph: anObject [
	stringMorph := anObject
]
