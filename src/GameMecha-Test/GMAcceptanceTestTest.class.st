"
This test runs all acceptance tests automatically without opening morphs or playing sounds.
"
Class {
	#name : #GMAcceptanceTestTest,
	#superclass : #TestCase,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 14:59'
}

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/10/2018 17:30'
}
GMAcceptanceTestTest >> testAnimatedImageLoaderAcceptance [
	GMAnimatedImageLoaderAcceptance new abandon.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/10/2018 17:30'
}
GMAcceptanceTestTest >> testCollisionDetectionAcceptance [
	GMCollisionDetectionAcceptance new abandon.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 13:04'
}
GMAcceptanceTestTest >> testImageLoaderAcceptance [
	GMImageLoaderAcceptance new abandon.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/10/2018 17:30'
}
GMAcceptanceTestTest >> testKeyHandlerAcceptance [
	GMKeyHandlerAcceptance new abandon.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'TP 7/6/2018 20:29'
}
GMAcceptanceTestTest >> testMouseHandlingTutorial [
	GMMouseHandlingTutorial new abandon.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/10/2018 17:32'
}
GMAcceptanceTestTest >> testRegisterKeyEventsAcceptance [
	GMRegisterKeyEventsAcceptance new abandon.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 13:05'
}
GMAcceptanceTestTest >> testSoundLoaderAcceptance [
	GMSoundLoaderAcceptance new.
]
