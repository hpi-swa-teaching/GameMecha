"
A GmKeyHandler can be registered in a morph by calling gmRegisterToKeyHandler in a Morph subclass. A morph can then request whether a key is pressed using:
	""Morph >> isKeyPressed: aKey"" - aKey is a character.
As a second option, it is possible to register a block or a method to a specific key. Once the ""gmEvaluateRegisteredEvents"" method of the morph is called (e.g. from a step method of said morph) and the specified key is pressed, the block/method registered for that key is executed.
Supported characters: [a-z][0-9][cr, tab, space, backspace, escape, arrowLeft, arrowRight, arrowUp, arrowDown] (see the initializeKeyLookupXXX methods on class side).
"
Class {
	#name : #GMKeyHandler,
	#superclass : #Object,
	#instVars : [
		'pressedKeys',
		'keyToMethodMappings',
		'keyToBlockMappings'
	],
	#classInstVars : [
		'KeyLookup'
	],
	#category : #'GameMecha-KeyHandling',
	#'squeak_changestamp' : 'NK 7/24/2018 15:37'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'brh 6/7/2018 17:09'
}
GMKeyHandler class >> cleanUp [
	KeyLookup := nil.
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'brh 6/8/2018 23:39'
}
GMKeyHandler class >> initialize [
	Smalltalk addToStartUpList: self.
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'AZ 7/22/2018 22:14'
}
GMKeyHandler class >> initializeKeyLookupLinux [
	^ (Dictionary newFrom:
		{8 -> Character backspace.
		9 -> Character tab.
		13 -> Character cr.
		27 -> Character escape.
		28 -> Character arrowLeft.
		29 -> Character arrowRight.
		30 -> Character arrowUp.
		31 -> Character arrowDown.
		32 -> Character space.
		49 -> $1.
		50 -> $2.
		51 -> $3.
		52 -> $4.
		53 -> $5.
		54 -> $6.
		55 -> $7.
		56 -> $8.
		57 -> $9.
		48 -> $0.
		97 -> $a.
		98 -> $b.
		99 -> $c.
		100 -> $d.
		101 -> $e.
		102 -> $f.
		103 -> $g.
		104 -> $h.
		105 -> $i.
		106 -> $j.
		107 -> $k.
		108 -> $l.
		109 -> $m.
		110 -> $n.
		111 -> $o.
		112 -> $p.
		113 -> $q.
		114 -> $r.
		115 -> $s.
		116 -> $t.
		117 -> $u.
		118 -> $v.
		119 -> $w.
		120 -> $x.
		121 -> $y.
		122 -> $z.
		})
]

{
	#category : #'key lookup',
	#'squeak_changestamp' : 'brh 6/25/2018 18:21'
}
GMKeyHandler class >> initializeKeyLookupMac [
	^ (Dictionary newFrom:
		{16r00 -> $a.
		16r01 -> $s.
		16r02 -> $d.
		16r03 -> $f.
		16r04 -> $h.
		16r05 -> $g.
		16r06 -> $y.
		16r07 -> $x.
		16r08 -> $c.
		16r09 -> $v.
		16r0B -> $b.
		16r0C -> $q.
		16r0D -> $w.
		16r0E -> $e.
		16r0F -> $r.
		16r10 -> $z.
		16r11 -> $t.
		16r12 -> $1.
		16r13 -> $2.
		16r14 -> $3.
		16r15 -> $4.
		16r16 -> $6.
		16r17 -> $5.
		16r19 -> $9.
		16r1A -> $7.
		16r1C -> $8.
		16r1D -> $0.
		16r1F -> $o.
		16r20 -> $u.
		16r22 -> $i.
		16r23 -> $p.
		16r24 -> Character cr.
		16r25 -> $l.
		16r26 -> $j.
		16r28 -> $k.
		16r2D -> $n.
		16r2E -> $m.
		16r30 -> Character tab.
		16r31 -> Character space.
		16r33 -> Character backspace.
		16r35 -> Character escape.
		16r7B -> Character arrowLeft.
		16r7C -> Character arrowRight.
		16r7D -> Character arrowDown.
		16r7E -> Character arrowUp})
]

{
	#category : #'key lookup',
	#'squeak_changestamp' : 'brh 6/10/2018 22:20'
}
GMKeyHandler class >> initializeKeyLookupOSIndependent [
	^ (self supportedPlatformDict at: (Smalltalk os platformName) ifAbsent: [self error: 'Platform not supported']) value
]

{
	#category : #'key lookup',
	#'squeak_changestamp' : 'AZ 6/26/2018 19:35'
}
GMKeyHandler class >> initializeKeyLookupWindows [
	^ (Dictionary newFrom:
		{16r08 -> Character backspace.
		16r09 -> Character tab.
		16r0D -> Character cr.
		16r1B -> Character escape.
		16r20 -> Character space.
		16r1C -> Character arrowLeft.
		16r1E -> Character arrowUp.
		16r1D -> Character arrowRight.
		16r1F -> Character arrowDown.
		16r30 -> $0.
		16r31 -> $1.
		16r32 -> $2.
		16r33 -> $3.
		16r34 -> $4.
		16r35 -> $5.
		16r36 -> $6.
		16r37 -> $7.
		16r38 -> $8.
		16r39 -> $9.
		16r41 -> $a.
		16r42 -> $b.
		16r43 -> $c.
		16r44 -> $d.
		16r45 -> $e.
		16r46 -> $f.
		16r47 -> $g.
		16r48 -> $h.
		16r49 -> $i.
		16r4A ->$j.
		16r4B -> $k.
		16r4C -> $l.
		16r4D -> $m.
		16r4E -> $n.
		16r4F -> $o.
		16r50 -> $p.
		16r51 -> $q.
		16r52 -> $r.
		16r53 -> $s.
		16r54 -> $t.
		16r55 -> $u.
		16r56 -> $v.
		16r57 -> $w.
		16r58 -> $x.
		16r59 -> $y.
		16r5A ->$z.		
		})
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/7/2018 17:15'
}
GMKeyHandler class >> keyLookup [
	^ KeyLookup ifNil: [KeyLookup := self initializeKeyLookupOSIndependent]
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'brh 6/7/2018 17:18'
}
GMKeyHandler class >> startUp: anObject [
	self cleanUp.
]

{
	#category : #'key lookup',
	#'squeak_changestamp' : 'SD 5/8/2018 20:23'
}
GMKeyHandler class >> supportedPlatformDict [
	^ (Dictionary newFrom: { 
		'Mac OS' -> [self initializeKeyLookupMac].
		'Win32' -> [self initializeKeyLookupWindows].
		'unix' -> [self initializeKeyLookupLinux ]})
]

{
	#category : #'key events',
	#'squeak_changestamp' : 'TP 7/25/2018 15:30'
}
GMKeyHandler >> gmDeregisterBlockForKey: aCharacter [
	(self class keyLookup includes: aCharacter) 
		ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToBlockMappings removeKey: aCharacter ifAbsent: [].
]

{
	#category : #'key events',
	#'squeak_changestamp' : 'NK 7/25/2018 17:08'
}
GMKeyHandler >> gmDeregisterMethodInvocationForKey: aCharacter [
	(self class keyLookup includes: aCharacter) 
		ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToMethodMappings removeKey: aCharacter ifAbsent: [].
	
	
]

{
	#category : #'key events',
	#'squeak_changestamp' : 'TP 7/25/2018 15:30'
}
GMKeyHandler >> gmEvaluateRegisteredEvents [
	self pressedKeys do: [:pressedKeyCharacter | 
		self keyToBlockMappings at: pressedKeyCharacter 
			ifPresent: [:event | event value].
		self keyToMethodMappings at: pressedKeyCharacter
			ifPresent: [:invocation | invocation key perform: invocation value]].
]

{
	#category : #'key events',
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMKeyHandler >> gmIsKeyPressed: aCharacter [
	^ self pressedKeys includes: aCharacter
]

{
	#category : #'key events',
	#'squeak_changestamp' : 'TP 7/25/2018 15:30'
}
GMKeyHandler >> gmRegisterBlock: aBlock forKey: aCharacter [
	(self class keyLookup includes: aCharacter) 
		ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToBlockMappings at: aCharacter put: aBlock.
]

{
	#category : #'key events',
	#'squeak_changestamp' : 'brh 7/24/2018 20:53'
}
GMKeyHandler >> gmRegisterMethodInvocation: aSelector on: aReceivingObject forKey: aCharacter [
	(self class keyLookup includes: aCharacter) 
		ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToMethodMappings at: aCharacter put: aReceivingObject -> aSelector.
	
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:27'
}
GMKeyHandler >> handlesClickOrDrag: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:27'
}
GMKeyHandler >> handlesGestureStart: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:27'
}
GMKeyHandler >> handlesKeyboard: anEvent [
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:27'
}
GMKeyHandler >> handlesMouseDown: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:27'
}
GMKeyHandler >> handlesMouseMove: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:26'
}
GMKeyHandler >> handlesMouseOver: anEvent [
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:26'
}
GMKeyHandler >> handlesMouseOverDragging: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:27'
}
GMKeyHandler >> handlesMouseStillDown: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 5/8/2018 19:27'
}
GMKeyHandler >> handlesMouseWheel: anEvent [
	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/15/2018 17:24'
}
GMKeyHandler >> keyDown: anEvent fromMorph: aMorph [
	self class keyLookup at: anEvent keyValue ifPresent: [:key | self pressedKeys add: key].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/15/2018 17:25'
}
GMKeyHandler >> keyStroke: anEvent fromMorph: aMorph [
	^ self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 7/25/2018 15:30'
}
GMKeyHandler >> keyToBlockMappings [
	^ keyToBlockMappings ifNil: [keyToBlockMappings := Dictionary new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 7/25/2018 15:30'
}
GMKeyHandler >> keyToBlockMappings: anObject [
	keyToBlockMappings := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 6/25/2018 18:27'
}
GMKeyHandler >> keyToMethodMappings [
	^ keyToMethodMappings ifNil: [keyToMethodMappings := Dictionary new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 6/25/2018 18:26'
}
GMKeyHandler >> keyToMethodMappings: anObject [
	keyToMethodMappings := anObject
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/15/2018 18:30'
}
GMKeyHandler >> keyUp: anEvent fromMorph: aMorph [
	(self class keyLookup) at: anEvent keyValue ifPresent: [:key | 
		self pressedKeys remove: key ifAbsent: []].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TP 6/25/2018 18:11'
}
GMKeyHandler >> keyboardFocusChange: aBoolean fromMorph: aMorph [
	aBoolean ifFalse: [self pressedKeys: Set new].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'brh 7/24/2018 20:21'
}
GMKeyHandler >> mouseDown: anEvent fromMorph: aMorph [
	^ self
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/15/2018 17:25'
}
GMKeyHandler >> mouseEnter: anEvent fromMorph: aMorph [
	ActiveHand newKeyboardFocus: aMorph.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'brh 7/24/2018 20:21'
}
GMKeyHandler >> mouseLeave: anEvent fromMorph: aMorph [
	^ self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/23/2018 19:21'
}
GMKeyHandler >> pressedKeys [
	^ pressedKeys ifNil: [pressedKeys := Set new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/23/2018 19:21'
}
GMKeyHandler >> pressedKeys: anObject [
	pressedKeys := anObject
]
