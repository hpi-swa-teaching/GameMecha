"
This test includes tests for the GMSoundLoaderTest.
"
Class {
	#name : #GMSoundLoaderTest,
	#superclass : #GMSpecificLoadingTest,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:17'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:50'
}
GMSoundLoaderTest class >> exampleFilepath [
	^ GMTestResourceFixtures testSoundPathWAV
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:48'
}
GMSoundLoaderTest class >> exampleResource [ 
	^ GMTestResourceFixtures squeakSampledSound
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 13:56'
}
GMSoundLoaderTest class >> secondExampleFilepath [
	^ GMTestResourceFixtures testSoundPathAIFF
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/19/2018 14:07'
}
GMSoundLoaderTest class >> supportedTypes [
	^ OrderedCollection newFrom: {'aiff' . 'wav'}
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/23/2018 16:39'
}
GMSoundLoaderTest >> assertRessourceType: aBlock [
	self assert: [aBlock value class = SampledSound].
]

{
	#category : #running,
	#'squeak_changestamp' : 'AZ 7/23/2018 00:32'
}
GMSoundLoaderTest >> setUp [
	super setUp.
	self resourceManager: (GMSoundLoader new
		loudness: 0.0;
		pauseMusic;
		yourself).
	GMTestResourceFixtures createSoundOnDisk.
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 7/4/2018 11:09'
}
GMSoundLoaderTest >> tearDown [
	super tearDown.
	self class class removeSelector: #resourceIntoMethodTargetSamples.

]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/19/2018 13:54'
}
GMSoundLoaderTest >> testPlayNamedSound [
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSampledSound withName: self class exampleFilepath;
		playSound: self class exampleFilepath.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 16:41'
}
GMSoundLoaderTest >> testPlayPauseMusic [
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSampledSound withName: self class exampleFilepath;
		playMusic: self class exampleFilepath;
		pauseMusic.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/15/2018 00:03'
}
GMSoundLoaderTest >> testPlaySoundAIFF [
	self resourceManager
		loadResourceFromDrive: GMTestResourceFixtures testSoundPathAIFF;
		playSound: GMTestResourceFixtures testSoundPathAIFF.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/15/2018 00:03'
}
GMSoundLoaderTest >> testPlaySoundWAV [
	self resourceManager
		loadResourceFromDrive: GMTestResourceFixtures testSoundPathWAV;
		playSound: GMTestResourceFixtures testSoundPathWAV.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/19/2018 13:55'
}
GMSoundLoaderTest >> testResumePlayingMusic [
	self resourceManager
		loadResourceFromDrive: self class exampleFilepath;
		playMusic: self class exampleFilepath;
		pauseMusic;
		resumePlayingMusic;
		pauseMusic.
]
