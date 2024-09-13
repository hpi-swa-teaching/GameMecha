"
This test includes tests for the GMKeyHandler like requesting whether a specific key is pressed or registration of blocks and methods to a specific key.
"
Class {
	#name : #GMKeyHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'keyMorph',
		'currentTestValue'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/25/2018 17:25'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 7/16/2018 12:44'
}
GMKeyHandlerTest class >> assignedValue [
	^ 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/24/2018 21:13'
}
GMKeyHandlerTest >> assertKeyboardEventOfType: aType evaluates: anAssertionBlock [
	self assertKeyboardEventOfType: aType evaluates: anAssertionBlock then: [].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:58'
}
GMKeyHandlerTest >> assertKeyboardEventOfType: aType evaluates: anAssertionBlock then: aCleanUpBlock [
	(self createKeyboardEventOfType: aType withValue: self keyValue) sentTo: self keyMorph. 
	self keyMorph gmEvaluateRegisteredEvents.
	self assert: anAssertionBlock value equals: true.
	aCleanUpBlock value.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'ek 9/13/2024 14:31'
}
GMKeyHandlerTest >> createKeyboardEventOfType: aType withValue: aKeyValue [
	^ KeyboardEvent new
		setType: aType
		buttons: 0
		position: nil
		keyValue: aKeyValue
		hand: GMMockHand new
		stamp: Time millisecondClockValue;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:52'
}
GMKeyHandlerTest >> currentTestValue [
	^ currentTestValue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:52'
}
GMKeyHandlerTest >> currentTestValue: anObject [
	currentTestValue := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:58'
}
GMKeyHandlerTest >> keyCharacter [
	^ $s
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:09'
}
GMKeyHandlerTest >> keyMorph [
	^ keyMorph ifNil: [keyMorph := Morph new
		gmRegisterToKeyHandler;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:09'
}
GMKeyHandlerTest >> keyMorph: anObject [
	keyMorph := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:58'
}
GMKeyHandlerTest >> keyValue [
	^ (Dictionary newFrom: {'Mac OS' -> 16r01. 'Win32' -> 16r53. 'unix' -> 115})
		at: Smalltalk os platformName ifAbsent: [self error: 'platform not supported by keyhandler']
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:53'
}
GMKeyHandlerTest >> registrationTestSetCurrentValue [
	self currentTestValue: self class assignedValue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:54'
}
GMKeyHandlerTest >> resetCurrentTestValue [
	self currentTestValue: nil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:54'
}
GMKeyHandlerTest >> setCurrentTestValue [
	self currentTestValue: self class assignedValue.
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 7/24/2018 19:55'
}
GMKeyHandlerTest >> setUp [
	self resetCurrentTestValue.
	GMKeyHandler cleanUp.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 13:54'
}
GMKeyHandlerTest >> testAllOSsSupportSameKeys [
	| windowsKeys macKeys unixKeys |
	windowsKeys := GMKeyHandler initializeKeyLookupWindows asSet.
	macKeys := GMKeyHandler initializeKeyLookupMac asSet.
	unixKeys := GMKeyHandler initializeKeyLookupLinux asSet.
	self assert: windowsKeys equals: macKeys.
	self assert: windowsKeys equals: unixKeys.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'TP 7/25/2018 15:52'
}
GMKeyHandlerTest >> testBlockDeregistration [
	self keyMorph gmRegisterBlock: [self currentTestValue: self class assignedValue] forKey: self keyCharacter.
	self keyMorph gmDeregisterBlockForKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue isNil].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'TP 7/25/2018 15:29'
}
GMKeyHandlerTest >> testBlockRegistration [
	self deny: [self currentTestValue = self class assignedValue].
	self keyMorph gmRegisterBlock: [self currentTestValue: self class assignedValue] forKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue = self class assignedValue] 
		then: [self resetCurrentTestValue].
	self assertKeyboardEventOfType: #keyUp 
		evaluates: [self currentTestValue isNil].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/24/2018 19:59'
}
GMKeyHandlerTest >> testIsKeyPressed [
	self deny: [self keyMorph gmIsKeyPressed: self keyCharacter].
	(self createKeyboardEventOfType: #keyDown withValue: self keyValue) sentTo: self keyMorph.
	self assert: [self keyMorph gmIsKeyPressed: self keyCharacter].
	(self createKeyboardEventOfType: #keyUp withValue: self keyValue) sentTo: self keyMorph.
	self deny: [self keyMorph gmIsKeyPressed: self keyCharacter].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'TP 7/25/2018 15:52'
}
GMKeyHandlerTest >> testMethodDeregistration [
	self keyMorph gmRegisterMethodInvocation: #registrationTestSetCurrentValue on: self forKey: self keyCharacter.
	self keyMorph gmDeregisterMethodInvocationForKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue isNil].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/24/2018 21:13'
}
GMKeyHandlerTest >> testMethodRegistration [
	self deny: [self currentTestValue = self class assignedValue].
	self keyMorph gmRegisterMethodInvocation: #registrationTestSetCurrentValue on: self forKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue = self class assignedValue] 
		then: [self resetCurrentTestValue].
	self assertKeyboardEventOfType: #keyUp 
		evaluates: [self currentTestValue isNil].
]
