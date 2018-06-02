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
					package: 'GM-Collision';
					package: 'GM-Test' with: [spec requires: #('keys' 'resources' 'collision' 'acceptanceTests')];
					yourself.
				spec
					group: 'keys' with: #('GM-Keys');
					group: 'resources' with: #('GM-Resources');
					group: 'acceptanceTests' with: #('GM-AcceptanceTest');
					group: 'collision' with: #('GM-Collision');
					group: 'test' with: #('GM-Test')];
					yourself.