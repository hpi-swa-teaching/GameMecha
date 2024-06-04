layerTests
testAddLayerButton
	self editor ifNil:
		[self setup].
	self assert: editor getLayerList size = 1.
	self assert: editor selectedLayer = 1.
	self clickButton: (editor layerViewer submorphNamed: 'addLayer').
	"self editor addLayer."
	self assert: editor getLayerList size = 2.