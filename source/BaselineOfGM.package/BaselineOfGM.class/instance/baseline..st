baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [
				spec
					package: 'GM-Utilities' with: [spec requires: #('test')];
					package: 'GM-UtilitiesTest' with: [spec requires: #('GM-Utilities')];
					package: 'GM-AcceptanceTest' with: [spec requires: #('core')];
					package: 'GM-Core';
					package: 'GM-DemoGame' with: [spec requires: #('core')];
					package: 'GM-Test' with: [spec requires: #('core' 'GM-AcceptanceTest')];
					yourself.
				spec
					group: 'core' with: #('GM-Core');
					group: 'swa' with: #('GM-AcceptanceTest');
					group: 'test' with: #('GM-Test' 'GM-AcceptanceTest');
					group: 'development' with: #('GM-AcceptanceTest' 'GM-Utilities')];
					yourself