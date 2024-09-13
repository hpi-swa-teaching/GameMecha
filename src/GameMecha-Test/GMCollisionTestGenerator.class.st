"
This is a small tool for integrated testing of the GM collision. Similar to, for example, FIT (framework for integrated testing), it allows the user to test and create various collision scenarios and save them as executable acceptance tests, which later are automatically tested. It is also helpful for developers to integrate, test and debug new or existing kinds of collisions.

Open this tool with ""GMCollisionAcceptanceGenerator open.""
Usage:
First of all, select a type of collision (e.g. collision between rotated rectangles) using the collision selector at the top right of the tool.
Now you can move the morphs using their halo (hold shift and click on the morph using the middle mouse button or hold shift and alt and click with the left mouse button).
The color of the morphs tells you whether a collision is detected (red) or not (green)
If you want to store this scenario as a test (maybe because you found a bug and the collision is not detected) you can use the buttons ""store 'collision'"" or ""store 'no collision'"". This stores the scenario temporarily and you can create more scenarios repeating the steps described before.
If you want to permanently store the scenarios you created click ""save tests"" and the scenarios will be stored in form of a test, asserting that there should be a collision (when you had chosen ""store 'collision'"") or not. These tests can afterwards be executed as every other test in the image (you can find it in the class GMCollisionAutomatedAcceptanceTest). The click on ""save test"" also deletes all previously created tests of the tool.

The button ""reset scenarios"" deletes all temporarily stored scenarios.

"
Class {
	#name : #GMCollisionTestGenerator,
	#superclass : #Morph,
	#instVars : [
		'collisionMorph',
		'collisionChecks'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'ek 9/8/2021 17:22'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'AZ 7/16/2018 12:54'
}
GMCollisionTestGenerator class >> open [
	^ self new openInWindowLabeled: 'Example ', self className
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 17:01'
}
GMCollisionTestGenerator >> buttonName: aString action: aSymbol [

	^ self buttonName: aString action: aSymbol target: self
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 17:01'
}
GMCollisionTestGenerator >> buttonName: aString action: aSymbol target: anObject [

	^ SimpleButtonMorph new
		target: anObject;
		label: aString;
		actionSelector: aSymbol;
		color: (Color gray: 0.8);
		borderWidth: 1;
		borderRaised.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 17:04'
}
GMCollisionTestGenerator >> buttonName: aString action: aSymbol target: anObject arguments: objects [

	^ (self buttonName: aString action: aSymbol target: anObject) arguments: objects
]

{
	#category : #storing,
	#'squeak_changestamp' : 'NK 7/25/2018 12:20'
}
GMCollisionTestGenerator >> cleanupClass: aClass [
	"meta-programming warning"
	aClass collisionSelectors do: [:selector | aClass removeSelector: selector].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/1/2018 19:54'
}
GMCollisionTestGenerator >> collisionChecks [
	^ collisionChecks ifNil: [collisionChecks := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/1/2018 19:53'
}
GMCollisionTestGenerator >> collisionChecks: anObject [
	collisionChecks := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 21:53'
}
GMCollisionTestGenerator >> collisionDescriptions [
	^ self findWidgetOfKind: PHDescriptionList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/10/2018 17:29'
}
GMCollisionTestGenerator >> collisionMorph [
	^ collisionMorph ifNil: [collisionMorph := GMCollisionTestGeneratorMorphContainer new
		position: 0 @ 300;
		extent: 400 @ 500;
		chooseCollisionScenario: #circleCollisionMorph with: #rectangleCollisionMorph;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/11/2018 14:03'
}
GMCollisionTestGenerator >> collisionMorph: anObject [
	collisionMorph := anObject
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/25/2018 19:11'
}
GMCollisionTestGenerator >> generatedTestCategory [
	^ 'test cases'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 12:49'
}
GMCollisionTestGenerator >> initialColor [

	^  Color gray
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/13/2024 14:54'
}
GMCollisionTestGenerator >> initialExtent [
	^ 700 @ 900
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 16:49'
}
GMCollisionTestGenerator >> initialize [
	super initialize.
	self initializeLayout.
	self addMorphBack: self collisionMorph.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 17:15'
}
GMCollisionTestGenerator >> initializeButtons [

	| row |
	row := AlignmentMorph newRow
		vResizing: #shrinkWrap;
		color: Color transparent.
	row
		addMorphBack: (self
			buttonName: 'store "collision"'
			action: #storeCollision);
		addMorphBack: (self
			buttonName: 'store "no collision"'
			action: #storeNoCollision);
		addMorphBack: (self
			buttonName: 'reset current scenarios'
			action: #resetChecks);
		addMorphBack: (self
			buttonName: 'generate tests'
			action: #save).
	self addMorphFront: row.
	
	row := AlignmentMorph newRow
		vResizing: #shrinkWrap;
		color: Color transparent.
	row
		addMorphFront: (StaticTextMorph
			string: 'Presets:'
			size: 12);
		addMorphBack: (self
			buttonName: 'Circle-Rectangle'
			action: #chooseCollisionScenario:with: 
			target: self collisionMorph
			arguments: {#circleCollisionMorph. #rectangleCollisionMorph});
		addMorphBack: (self
			buttonName: 'Circle-RotatedRectangle'
			action: #chooseCollisionScenario:with: 
			target: self collisionMorph
			arguments: {#circleCollisionMorph. #rotatedRectangleCollisionMorph});
	 	addMorphBack: (self
			buttonName: 'Rectangle-RotatedRectangle'
			action: #chooseCollisionScenario:with:
			target: self collisionMorph
			arguments: {#rectangleCollisionMorph. #rotatedRectangleCollisionMorph}).
	self addMorphBack: row.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 17:15'
}
GMCollisionTestGenerator >> initializeLabels [
	self addMorphBack: (StaticTextMorph
		string: 'you can open the halos and move the morphs around'
		size: 16).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 9/8/2021 16:50'
}
GMCollisionTestGenerator >> initializeLayout [
	self
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: self initialColor;
		extent: self initialExtent.
	self 
		initializeButtons;
		initializeLabels.
		
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/25/2018 19:19'
}
GMCollisionTestGenerator >> methodSelectorStringForCheck: aCheck [
	^ '#', (self methodStringForCheck: aCheck)
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/25/2018 19:15'
}
GMCollisionTestGenerator >> methodStringForCheck: aCheck [
	^ 'testAcceptance', aCheck hash asString
]

{
	#category : #'collision checks',
	#'squeak_changestamp' : 'ek 9/8/2021 17:18'
}
GMCollisionTestGenerator >> resetChecks [
	self collisionChecks: OrderedCollection new.
	 
]

{
	#category : #'collision checks',
	#'squeak_changestamp' : 'ek 9/8/2021 17:19'
}
GMCollisionTestGenerator >> save [
	self storeChecksInInstanceOf: GMCollisionAutomatedAcceptanceTest.
	self resetChecks.
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/25/2018 19:21'
}
GMCollisionTestGenerator >> storeChecksInInstanceOf: aClass [
	"meta-programming warning"
	self cleanupClass: aClass.
	aClass organization addCategory: self generatedTestCategory.
	aClass class compile: (String streamContents: [:str |
		str nextPutAll: 'collisionSelectors' , String cr, String tab , '^ {'.
		self collisionChecks
			do: [:check |
				str nextPutAll: (self methodSelectorStringForCheck: check). str nextPutAll: '.', String cr, String tab.
				aClass compile: (self methodStringForCheck: check), ' ', check.
				aClass organization classify: (self methodStringForCheck: check) under: self generatedTestCategory].
		str nextPut: $}]).
]

{
	#category : #'collision checks',
	#'squeak_changestamp' : 'ek 9/8/2021 17:18'
}
GMCollisionTestGenerator >> storeCollision [
	self collisionMorph shouldCollide: true.
	self collisionChecks add: self collisionMorph currentCollisionCheck.
	
]

{
	#category : #'collision checks',
	#'squeak_changestamp' : 'ek 9/8/2021 17:18'
}
GMCollisionTestGenerator >> storeNoCollision [
	self collisionMorph shouldCollide: false.
	self collisionChecks add: self collisionMorph currentCollisionCheck.
]
