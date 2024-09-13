"
I am an inspector for morphs. In addition to field values I display properties of the morph, and add additional selections to the field item menu.
"
Class {
	#name : #MorphInspector,
	#superclass : #Inspector,
	#category : #'ToolBuilder-Morphic-Tools',
	#'squeak_changestamp' : 'mt 4/22/2020 08:13'
}

{
	#category : #'menu - construction',
	#'squeak_changestamp' : 'mt 4/6/2020 09:17'
}
MorphInspector >> addFieldItemsTo: aMenu [

	super addFieldItemsTo: aMenu.

	self isMorphSelected ifFalse: [^ self].
	
	aMenu addLine.
	
	aMenu addTranslatedList: #(
			('open screenshot in hand'			openScreenshotInHand)
			('open screenshot in world'			openScreenshotInWorld)).
]

{
	#category : #fields,
	#'squeak_changestamp' : 'mt 4/2/2020 16:41'
}
MorphInspector >> fieldExtent [

	^ (self newFieldForType: #misc key: #extent)
		name: 'extent' translated; emphasizeName;
		valueGetter: [:morph | morph extent];
		valueSetter: [:morph :newExtent | morph extent: newExtent];
		yourself
]

{
	#category : #fields,
	#'squeak_changestamp' : 'ct 1/27/2022 02:26'
}
MorphInspector >> fieldScreenshot [

	^ (self newFieldForType: #misc key: #screenshot)
		name: 'screenshot' translated; emphasizeName;
		printValueAsIs;
		valueGetter: [:morph |
			| screenshot |
			screenshot := morph imageForm.
			FormInspector new embedForm: screenshot inText: screenshot printString];
		valueGetterExpression: 'self imageForm';
		yourself
]

{
	#category : #morphs,
	#'squeak_changestamp' : 'mt 4/6/2020 10:05'
}
MorphInspector >> isMorphSelected [

	^ [self selectionOrObject isMorph] ifError: [false]
]

{
	#category : #'menu - commands',
	#'squeak_changestamp' : 'mt 4/6/2020 09:18'
}
MorphInspector >> openScreenshotInHand [

	^ self selectedMorph imageForm asMorph openInHand
]

{
	#category : #'menu - commands',
	#'squeak_changestamp' : 'mt 4/6/2020 09:19'
}
MorphInspector >> openScreenshotInWorld [

	^ self selectedMorph imageForm asMorph openInWorld
]

{
	#category : #morphs,
	#'squeak_changestamp' : 'mt 4/6/2020 09:18'
}
MorphInspector >> selectedMorph [

	^ self selectionOrObject
]

{
	#category : #'fields - streaming',
	#'squeak_changestamp' : 'mt 6/9/2020 15:55'
}
MorphInspector >> streamBaseFieldsOn: aStream [

	super streamBaseFieldsOn: aStream.
	aStream
		nextPut: self fieldExtent;
		nextPut: self fieldScreenshot.
]

{
	#category : #'fields - streaming',
	#'squeak_changestamp' : 'mt 4/6/2020 08:51'
}
MorphInspector >> streamInstanceVariablesOn: aStream [

	super streamInstanceVariablesOn: aStream.
	self streamPropertiesOn: aStream.
]

{
	#category : #'fields - streaming',
	#'squeak_changestamp' : 'mt 4/6/2020 18:55'
}
MorphInspector >> streamPropertiesOn: aStream [
	"Prepend all properties with # (hash) so that users can distinguish them from regular instance variables. Trigger both #layoutChanged and #changed to be sure that any value changes yield the expected visual updates. Note that this is required because we invade the morph's privacy by exposing its extension object this way; normal updates are handled only through the morph's public interface. For example, compare Morph >> #visible: with MorphExtension >> #visible:."
	
	| extension field |
	(extension := self object extension) ifNil: [^ self].
	
	extension sortedPropertyNames do: [:property |
		(extension respondsTo: property)
			ifTrue: [field := (self newFieldForType: #property key: property)
				name: property printString;
				valueGetter: [:morph | morph extension perform: property];
				valueSetter: [:morph :value |
					morph extension perform: property asSimpleSetter with: value.
					morph layoutChanged; changed];
				yourself]
			ifFalse: [field := (self newFieldForType: #property key: property)
				name: property printString;
				valueGetter: [:morph | morph extension valueOfProperty: property];
				valueSetter: [:morph :value |
					morph extension setProperty: property toValue: value.
					morph layoutChanged; changed];
				yourself].
			
		aStream nextPut: field].
]
