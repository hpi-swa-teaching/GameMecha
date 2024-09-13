"
This is an acceptance test for the GMKeyHandler class. It is supposed to be opened like any other morph.
It demonstrates how to register/deregister a morph to the KeyHandler and how to check whether a key is pressed using the ability of the GMKeyHandler to register blocks and methods for a specific keyboard key.

See initialize and step to find out how it works.
"
Class {
	#name : #GMRegisterKeyEventsAcceptance,
	#superclass : #Morph,
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/25/2018 17:11'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/25/2018 17:12'
}
GMRegisterKeyEventsAcceptance class >> descriptionText [
"The bad formatting is because otherwise the string would also be formatted."
	^ 'Press "e" to expand the morph, "q" to shrink it
and use the arrow keys to move it around.
Press "r" to deregister all these functions
and "s" to register them again.
See the implementation for more Details'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 6/26/2018 19:39'
}
GMRegisterKeyEventsAcceptance class >> expandSpeed [
	^ 1.1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 6/26/2018 19:41'
}
GMRegisterKeyEventsAcceptance class >> extent [
	^ 300@300
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/25/2018 17:07'
}
GMRegisterKeyEventsAcceptance class >> registeredMovementKeys [
	^ {Character arrowUp . Character arrowDown . Character arrowLeft . Character arrowRight}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/25/2018 17:07'
}
GMRegisterKeyEventsAcceptance class >> registeredResizeKeys [
	^ {$e . $q}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 6/26/2018 19:39'
}
GMRegisterKeyEventsAcceptance class >> shrinkSpeed [
	^ 0.9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 6/26/2018 19:39'
}
GMRegisterKeyEventsAcceptance class >> speed [
	^ 10
]

{
	#category : #creation,
	#'squeak_changestamp' : 'AZ 7/23/2018 00:31'
}
GMRegisterKeyEventsAcceptance >> createStringMorph [
	^ TextMorph new contents: self class descriptionText;
		readOnly: true;
		openInWorld;
		yourself
	
	
]

{
	#category : #resizing,
	#'squeak_changestamp' : 'TP 6/26/2018 19:15'
}
GMRegisterKeyEventsAcceptance >> expand [
	self extent: self extent * self class expandSpeed.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TP 7/25/2018 18:37'
}
GMRegisterKeyEventsAcceptance >> initialize [
	super initialize.
	self extent: self class extent.
	self color: Color gray.
	self addMorph: self createStringMorph.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self gmRegisterToKeyHandler.
	
	"Now we can register events to keys. Browse the code of the following two methods to learn
	how to register events for keys using our GMKeyHandler."
	self registerMovementBlocks.
	self registerResizeMethods.
	
	"Blocks and methods can also be deregistered(see resetFunctionKeys)"
	self registerResetAndSetKeys.

	"Attention: Every time you register a new block for a key the previously registered block gets unregistered.
	Likewise, every time you register a new method for a key the previously registered method gets unregistered."
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TP 7/25/2018 18:32'
}
GMRegisterKeyEventsAcceptance >> registerMovementBlocks [
	"We can register blocks which should be executed every time
	gmEvaluateRegisteredEvents is sent and the key for which the block is registered is pressed.
	See step for more details."
	self gmRegisterBlock: [self position: self position + (self class speed negated @ 0)] 
		forKey: Character arrowLeft.
	self gmRegisterBlock: [self position: self position + (self class speed @ 0)] 
		forKey: Character arrowRight.
	self gmRegisterBlock: [self position: self position + (0 @ self class speed negated)] 
		forKey: Character arrowUp .
	self gmRegisterBlock: [self position: self position + (0 @ self class speed)] 
		forKey: Character arrowDown.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'NK 7/25/2018 16:47'
}
GMRegisterKeyEventsAcceptance >> registerResetAndSetKeys [
	self gmRegisterBlock: [self registerMovementBlocks. self registerResizeMethods] 
		forKey: $s.
	self gmRegisterMethodInvocation: #resetFunctionKeys on: self 
		forKey: $r.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TP 7/25/2018 18:33'
}
GMRegisterKeyEventsAcceptance >> registerResizeMethods [
	"Similar to the registration of blocks we can also register a method and an object on which the method should be called
	for a key. Like for blocks gmEvaluateRegisteredEvents hast to be called to check for pressed keys (see step)."
	self gmRegisterMethodInvocation: #expand on: self 
		forKey: $e.
	self gmRegisterMethodInvocation: #shrink on: self 
		forKey: $q.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'NK 7/25/2018 17:01'
}
GMRegisterKeyEventsAcceptance >> resetFunctionKeys [
	self class registeredMovementKeys do: [:key |
		self gmDeregisterBlockForKey: key].
	self class registeredResizeKeys do: [:key |
		self gmDeregisterMethodInvocationForKey: key].
]

{
	#category : #resizing,
	#'squeak_changestamp' : 'TP 6/26/2018 19:15'
}
GMRegisterKeyEventsAcceptance >> shrink [
	self extent: self extent * self class shrinkSpeed.
	
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMRegisterKeyEventsAcceptance >> step [
	"Second possible use of the keyHandling features, evaluate registered blocks for pressed keys:
	Everytimes evaluateRegisteredEvents is send to a Morph which has a GMKeyHandler registered 
	(see call gmRegisterToKeyHandler in initialize) all registered blocks of all the keys which are pressed at the moment are executed.
	Becaus we registered block which expands our Morph to the $s key (see initialize), everytime when the step function is called our
	Morph gets bigger." 
	self gmEvaluateRegisteredEvents.
	
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'AZ 6/25/2018 17:55'
}
GMRegisterKeyEventsAcceptance >> stepTime [
	^ 33
]
