as yet unclassified
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [
				spec
					baseline: 'Pheno' with: [spec repository: 'github://tom95/Pheno:master/src'; loads: #(tests)];
					package: 'GM-Keys';
					package: 'GM-Resources';
					package: 'GM-AcceptanceTest' with: [spec requires: #('Pheno')];
					package: 'GM-Collision';
					package: 'GM-Test' with: [spec requires: #('keys' 'resources' 'collision' 'acceptanceTests')];
					yourself.
				spec
					group: 'keys' with: #('GM-Keys');
					group: 'resources' with: #('GM-Resources');
					group: 'acceptanceTests' with: #('GM-AcceptanceTest');
					group: 'collision' with: #('GM-Collision');
					group: 'tests' with: #('GM-Test')];
					yourself.