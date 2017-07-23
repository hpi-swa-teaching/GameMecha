as yet unclassified
buildWith: builder
	| windowSpec listSpec |
	""
	windowSpec := builder pluggableWindowSpec new
		model: self;
		label: 'Reconfigure Bindings';
		children: OrderedCollection new.

	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #bindingList; 
		setIndex: #index:; 
		frame: (0@0 corner: 1@0.6).
	windowSpec children add: listSpec.

	listSpec := self buildReconfigurationWith: builder.
	listSpec frame: (0@0.6corner: 1@1).
	windowSpec children add: listSpec.

	^builder build: windowSpec.