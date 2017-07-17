reconfiguration
reconfigureBindings
	"Open a window for reconfiguration of all bindings"
	|requiredExtent window yPos border scrollPane contents repaint|
	window := SystemWindow labelled: 'Reconfigure Key Bindings'.
	border := 10.
	repaint := [
		scrollPane ifNotNilDo: [:pane | window removeMorph: pane].
		scrollPane := ScrollPane new.
		contents := RectangleMorph new.
		yPos := border.
		requiredExtent := (border * 2) @ border.
		self bindings do: [:binding | 
			|bindingMorph| 
			scrollPane := ScrollPane new.
			bindingMorph := binding reconfigurationMorph.
			bindingMorph position: border@yPos.
			yPos := yPos + bindingMorph height + border.
			requiredExtent setX: (requiredExtent x max: (bindingMorph width + (border * 2)))
			 				setY: (requiredExtent y + bindingMorph height + border).
			contents addMorph: bindingMorph].
		contents color: (Color r: 0 g: 0 b: 0 alpha: 0).
		contents extent: requiredExtent.
		scrollPane scroller addMorph: contents.
		window addMorph: scrollPane frame: (0@0 corner: 1@1).].
	repaint value.
	
	[[window owner isNil] whileFalse: [self bindings do: [:b | b visualizationDirty ifTrue: [repaint value]]. Processor yield]]fork.
	
	window openInWorld.