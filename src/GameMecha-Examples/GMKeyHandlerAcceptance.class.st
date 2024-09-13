"
This is an acceptance test for the GMKeyHandler class. It is supposed to be opened like any other morph.
It demonstrates how to register a morph to the KeyHandler and how to check whether a key is pressed.

For more details see the initialize method or the step method of GMKeyHandlerAcceptanceTestKeyMorph.


"
Class {
	#name : #GMKeyHandlerAcceptance,
	#superclass : #Morph,
	#instVars : [
		'keyMorphs'
	],
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/24/2018 16:10'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/26/2018 17:55'
}
GMKeyHandlerAcceptance class >> keysPerRow [
	^ 9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/26/2018 19:03'
}
GMKeyHandlerAcceptance class >> testedKeys [
	^ {{'backspace' . Character backspace}. {'tab' . Character tab}.
		{'enter' . Character cr}. {'escape' . Character escape}.
		{'space' . Character space}. {'arrowLeft' . Character arrowLeft}.
		{'arrowUp' . Character arrowUp}. {'arrowRight' . Character arrowRight}.
		{'arrowDown' . Character arrowDown}. {'0' . $0}.
		{'1' . $1}. {'2' . $2}. {'3' . $3}. {'4' . $4}. {'5' . $5}.
		{'6' . $6}. {'7' . $7}. {'8' . $8}. {'9' . $9}. {'a' . $a}.
		{'b' . $b}. {'c' . $c}. {'d' . $d}. {'e' . $e}. {'f' . $f}.
		{'g' . $g}. {'h' . $h}. {'i' . $i}. {'j' . $j}. {'k' . $k}.
		{'l' . $l}. {'m' . $m}. {'n' . $n}. {'o' . $o}. {'p' . $p}.
		{'q' . $q}. {'r' . $r}. {'s' . $s}. {'t' . $t}. {'u' . $u}.
		{'v' . $v}. {'w' . $w}. {'x' . $x}. {'y' . $y}. {'z' . $z}}
]

{
	#category : #layout,
	#'squeak_changestamp' : 'AZ 6/26/2018 17:25'
}
GMKeyHandlerAcceptance >> adaptExtent [
	self extent: self adaptedWidth @ self adaptedHeight.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'brh 7/10/2018 17:31'
}
GMKeyHandlerAcceptance >> adaptedHeight [
	^ self numberOfRows * GMKeyHandlerAcceptanceKeyMorph defaultExtent y
]

{
	#category : #layout,
	#'squeak_changestamp' : 'brh 7/10/2018 17:31'
}
GMKeyHandlerAcceptance >> adaptedWidth [
	^ self class keysPerRow * GMKeyHandlerAcceptanceKeyMorph defaultExtent x
]

{
	#category : #layout,
	#'squeak_changestamp' : 'AZ 6/26/2018 19:13'
}
GMKeyHandlerAcceptance >> enforceLayout [
	self
		adaptExtent;
		layoutKeyMorphs;
		color: Color white.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TP 7/10/2018 16:24'
}
GMKeyHandlerAcceptance >> initialize [
	super initialize.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent.
	Look inside the step method of GMKeyHandlerAcceptanceTestKeyMorph for further information."
	self
		gmRegisterToKeyHandler;
		initializeKeyMorphs;
		enforceLayout.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:33'
}
GMKeyHandlerAcceptance >> initializeKeyMorphs [
	self keyMorphs: (self class testedKeys collect: [:testedKey |
		GMKeyHandlerAcceptanceKeyMorph new
			label: testedKey first;
			listenToKey: testedKey second;
			parent: self;
			yourself]).
	self keyMorphs do: [:keyMorph | self addMorph: keyMorph].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/25/2018 17:36'
}
GMKeyHandlerAcceptance >> keyMorphs [
	^ keyMorphs ifNil: [keyMorphs := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/25/2018 17:35'
}
GMKeyHandlerAcceptance >> keyMorphs: anObject [
	keyMorphs := anObject
]

{
	#category : #layout,
	#'squeak_changestamp' : 'brh 7/10/2018 17:31'
}
GMKeyHandlerAcceptance >> keyMorphsHeight [
	^ GMKeyHandlerAcceptanceKeyMorph defaultExtent y
]

{
	#category : #layout,
	#'squeak_changestamp' : 'brh 7/10/2018 17:31'
}
GMKeyHandlerAcceptance >> keyMorphsWidth [
	^ GMKeyHandlerAcceptanceKeyMorph defaultExtent x
]

{
	#category : #layout,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:56'
}
GMKeyHandlerAcceptance >> layoutKeyMorphs [
	0 to: self keyMorphs size - 1 do: [:number |
		(self keyMorphs at: number + 1) position: 
			(number \\ self class keysPerRow * self keyMorphsWidth) @ 
			(number // self class keysPerRow * self keyMorphsHeight)].
]

{
	#category : #layout,
	#'squeak_changestamp' : 'AZ 6/26/2018 19:16'
}
GMKeyHandlerAcceptance >> numberOfRows [
	^ self class testedKeys size / self class keysPerRow ceiling
]
