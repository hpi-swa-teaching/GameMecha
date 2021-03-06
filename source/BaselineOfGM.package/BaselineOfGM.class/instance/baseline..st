baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [
				spec
					baseline: 'Pheno' with: [spec repository: 'github://tom95/Pheno:master/src'];
					package: 'GM-Utilities' with: [spec requires: #('Pheno' 'core')];
					package: 'GM-UtilitiesTest' with: [spec requires: #('GM-Utilities')];
					package: 'GM-AcceptanceTest' with: [spec requires: #('core')];
					package: 'GM-Core';
					package: 'GM-DemoGame' with: [spec requires: #('core')];
					package: 'GM-Test' with: [spec requires: #('core' 'GM-AcceptanceTest')];
					yourself.
				spec
					group: 'core' with: #('GM-Core');
					group: 'test' with: #('GM-Test' 'GM-AcceptanceTest');
					group: 'development' with: #('GM-AcceptanceTest' 'GM-Utilities')];
					yourself