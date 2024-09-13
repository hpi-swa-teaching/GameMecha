accessing
enabled: aBoolean

	aBoolean
		ifTrue: [
			self basicEnabled: true.
			self setImageMode: 'unpressed']
		ifFalse: [
			self basicEnabled: false.
			self setImageMode: 'disabled']
			