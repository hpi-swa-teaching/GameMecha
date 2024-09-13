"
This tests the functionality of the Tile Editor
"
Class {
	#name : #GMTileEditorTest,
	#superclass : #TestCase,
	#instVars : [
		'editor',
		'fileUUID'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'Alex M 6/4/2024 14:07'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : '6/24/2024 09:45:49'
}
GMTileEditorTest >> clickButton: aButton [
	"helper method that simulates the button press of aButton"
	
	|evt|
	evt := GMClickEvent atPosition: aButton position.
	
	aButton
		mouseDown: evt;
		mouseUp: evt
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:20'
}
GMTileEditorTest >> editor [
	"the editor instance that is used for the tests"
	
	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:55'
}
GMTileEditorTest >> editor: anObject [

	editor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:21'
}
GMTileEditorTest >> fileUUID [
	"the file name of the test map file used for import tests"
	
	^ fileUUID
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:55'
}
GMTileEditorTest >> fileUUID: anObject [

	fileUUID := anObject
]

{
	#category : #helper,
	#'squeak_changestamp' : 'JS 6/23/2024 18:18'
}
GMTileEditorTest >> loadTestMapFileToFileDirectory [
	"copies the test map file from the asset browser to the default FileDirectory for import tests"
	
	|tempFile|
	tempFile := FileDirectory default asFSReference / self fileUUID.
	tempFile writeStreamDo: [:stream | stream nextPutAll: ((GitAssetLoader for: 'GameMecha') loadAsset: '/testMapFile.morph')]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'jj 6/23/2024 18:55'
}
GMTileEditorTest >> setUp [

	self editor ifNil: [self editor: GMTEEditor new].
	self fileUUID: UUID new asString
]

{
	#category : #helper,
	#'squeak_changestamp' : 'jj 6/22/2024 20:24'
}
GMTileEditorTest >> tearDown [
	"deletes temporary test file and closes editor after tests are done"
	
	(self fileUUID) ifNotNil: [
		FileDirectory default deleteFileNamed: self fileUUID.
		self fileUUID: nil].
	
	self assert: fileUUID isNil.
	
	self editor ifNotNil: [
		self editor changed: #close.
		self editor: nil].

	self assert: (self editor isNil)
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'JS 6/24/2024 00:19'
}
GMTileEditorTest >> testAddLayerButton [
	"tests the addLayer button function"
	
	self assert: editor layerCount = 1.
	self assert: (editor selectedLayers includes: 1).
	self editor addLayer.
	self assert: editor layerCount = 2
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:25'
}
GMTileEditorTest >> testDeleteLayer [
	"tests the deletion of a single selected layer"
	
	self assert: editor getLayerList size = 1.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1.
	self editor addLayer.
	self assert: editor getLayerList size = 2.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1
]

{
	#category : #editorTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:30'
}
GMTileEditorTest >> testDirectImport [
	"tests the creation of a tileMap from a local file path"
	
	self loadTestMapFileToFileDirectory.
	self assert: ((GMTEEditor getTileMapFromFilePath: self fileUUID) isKindOf: GMTETileMap)
]

{
	#category : #editorTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:30'
}
GMTileEditorTest >> testDirectImportFromAssetbrowser [
	"tests the creation of a tileMap from the git asset browser"
	
	self assert: ((GMTEEditor getTileMapFromProjectName: 'GameMecha' withPath: '/testMapFile.morph') isKindOf: GMTETileMap)
]

{
	#category : #editorTests,
	#'squeak_changestamp' : 'jj 6/23/2024 19:02'
}
GMTileEditorTest >> testExport [
	"tests the export function" 
	
	[self editor exportAsMorph] valueSupplyingAnswer: self fileUUID.
	self assert: (FileDirectory default / self fileUUID) exists.
	self tearDown
]

{
	#category : #editorTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:28'
}
GMTileEditorTest >> testExportButton [
	"tests the export function"
	
	self fileUUID: UUID new asString.
	[self editor exportAsMorph] valueSupplyingAnswer: self fileUUID.
	self assert: (FileDirectory default / self fileUUID) exists
]

{
	#category : #editorTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:28'
}
GMTileEditorTest >> testImportButton [
	"tests the import function"
	
    	self loadTestMapFileToFileDirectory.
    	[self editor importFromMorph] valueSupplyingAnswer: self fileUUID.
    	self assert: (editor tileMap tileMatrixStack layerCount == 5)
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'JS 6/25/2024 18:02'
}
GMTileEditorTest >> testMoveLayerDown [
	"tests the moveLayerDown function"
	
	| tileMatrixStack layer1 layerId1 layerId2 |
	tileMatrixStack:= self editor tileMap tileMatrixStack.
	self editor addLayer.
	layer1 := tileMatrixStack matrixLayers at: 1.
	layerId1 := (tileMatrixStack matrixLayers at: 1) layerIndex.
	layerId2 := (tileMatrixStack matrixLayers at: 2) layerIndex.	
	self editor moveLayerDown.
	self assert: (tileMatrixStack matrixLayers at: 1) layerIndex = layerId1.
	self assert: (tileMatrixStack matrixLayers at: 2) layerIndex = layerId2.
	self assert: (tileMatrixStack matrixLayers at: 2) == layer1.
	self assert: ((tileMatrixStack matrixLayers at: 1) == layer1) not
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'JS 6/25/2024 18:02'
}
GMTileEditorTest >> testMoveLayerUp [
	"tests the moveLayerUp function"
	
	| tileMatrixStack layer1 layerId1 layerId2 |
	tileMatrixStack:= self editor tileMap tileMatrixStack.
	self editor addLayer.
	layer1 := tileMatrixStack matrixLayers at: 1.
	layerId1 := (tileMatrixStack matrixLayers at: 1) layerIndex.
	layerId2 := (tileMatrixStack matrixLayers at: 2) layerIndex.	
	self editor selectOnlyLayer: 1.
	self editor moveLayerUp.
	self assert: (tileMatrixStack matrixLayers at: 1) layerIndex = layerId1.
	self assert: (tileMatrixStack matrixLayers at: 2) layerIndex = layerId2.
	self assert: (tileMatrixStack matrixLayers at: 2) == layer1.
	self assert: ((tileMatrixStack matrixLayers at: 1) == layer1) not
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:31'
}
GMTileEditorTest >> testMultiDeleteLayer [
	"tests the deletion of multiple selected layers"
	
	self assert: editor getLayerList size = 1.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1.
	self editor addLayer.
	self editor addLayer.
	self assert: editor getLayerList size = 3.
	self editor selectLayer: 2.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1
	
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:34'
}
GMTileEditorTest >> testMultiToggleLayerVisibility [
	"tests the visibility toggle for multiple selected layers"
	
	self editor addLayer.
	self editor selectLayer: 1.
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = false.
	self assert: (self editor tileMap tileMatrixStack layer: 2) visible = false.
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = true.
	self assert: (self editor tileMap tileMatrixStack layer: 2) visible = true
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'JS 6/24/2024 00:15'
}
GMTileEditorTest >> testRenameLayer [
	"tests the renaming of layers"
	
	self editor tileMap tileMatrixStack setLayerNameOf: self editor getSelectedLayer to: 'testName'.
	self assert: ((self editor tileMap tileMatrixStack layerNameOf: 1) literalEqual: 'testName')
]

{
	#category : #editorTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:32'
}
GMTileEditorTest >> testRescaleMap [
	"tests the rescaling of the maps dimensions"
	
	self editor tileMap rescaleMapWidth: 12 height: 13.
	self assert: self editor tileMap mapTileWidth = 12.
	self assert: self editor tileMap mapTileHeight = 13
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'JS 6/25/2024 18:03'
}
GMTileEditorTest >> testSwapLayer [
	"tests the swapping of two layers"
	
	| TileMatrixStack layer1 layerId1 layerId2 |
	TileMatrixStack:= self editor tileMap tileMatrixStack.
	self editor addLayer.
	layer1 := TileMatrixStack matrixLayers at: 1.
	layerId1 := (TileMatrixStack matrixLayers at: 1) layerIndex.
	layerId2 := (TileMatrixStack matrixLayers at: 2) layerIndex.	
	TileMatrixStack swapLayer: 1 with: 2.
	self assert: (TileMatrixStack matrixLayers at: 1) layerIndex = layerId1.
	self assert: (TileMatrixStack matrixLayers at: 2) layerIndex = layerId2.
	self assert: (TileMatrixStack matrixLayers at: 2) == layer1.
	self assert: ((TileMatrixStack matrixLayers at: 1) == layer1) not
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:34'
}
GMTileEditorTest >> testToggleHighlightingLayer [
	"tests the visibility toggle for the visual layer"
	
	self editor toggleGrid.
	self assert: (self editor tileMap tileMatrixStackHighlighting layer: 1) visible = false.
	self editor toggleGrid.
	self assert: (self editor tileMap tileMatrixStackHighlighting layer: 1) visible = true
]

{
	#category : #layerTests,
	#'squeak_changestamp' : 'jj 6/22/2024 20:34'
}
GMTileEditorTest >> testToggleLayerVisibility [
	"tests the visibility toggle for one selected layer"
	
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = false.
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = true
]
