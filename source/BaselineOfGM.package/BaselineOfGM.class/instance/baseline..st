as yet unclassified
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [
				spec
					baseline: 'Pheno' with: [spec repository: 'github://tom95/Pheno:master/src'];
					package: 'GM-AcceptanceTest' with: [spec requires: #('Pheno' 'core')];
					package: 'GM-Core';
					package: 'GM-DemoGame' with: [spec requires: #('core')];
					package: 'GM-Test' with: [spec requires: #('core' 'acceptanceTest')];
					yourself.
				spec
					group: 'core' with: #('GM-Core');
					group: 'test' with: #('GM-Test' 'GM-AcceptanceTest');					
					group: 'acceptanceTest' with: #('GM-AcceptanceTest')];
					yourself.