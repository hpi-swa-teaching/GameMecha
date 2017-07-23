accessing
buildKeyListenerWith: builder
	| windowSpec |
	""
	windowSpec := builder pluggableWindowSpec new
		label: 'Enter a Key';
		children: OrderedCollection new.


	^builder build: windowSpec.