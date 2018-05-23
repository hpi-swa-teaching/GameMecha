as yet unclassified
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [
				spec
					package: 'GM-Keys';
					package: 'GM-Resources';
					package: 'GM-AcceptanceTest';
					package: 'GM-Test';
					package: 'GM-Test' with: [spec requires: #('keys' 'resources')];
					yourself.
				spec
					group: 'keys' with: #('GM-Keys');
					group: 'resources' with: #('GM-Resources');
					group: 'test' with: #('GM-Test')];
					yourself.