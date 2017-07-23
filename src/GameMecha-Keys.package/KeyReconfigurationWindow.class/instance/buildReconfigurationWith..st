accessing
buildReconfigurationWith: builder
	 |textSpec buttonSpec top |
	""
	top := builder pluggablePanelSpec new.
	top children: OrderedCollection new.
			
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #bindingLabel.
	top children add: textSpec.
	
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #bindingKeys.
	top children add: textSpec.

	buttonSpec := self buildButtonsWith: builder.
	top children add: buttonSpec.
	
	top layout: #horizontal. "buttons"
	^ top.