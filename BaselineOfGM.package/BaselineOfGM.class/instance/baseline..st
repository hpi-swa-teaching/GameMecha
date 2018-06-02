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
					package: 'Pheno-Styles';
					package: 'Pheno-ToolBuilder' with: [spec requires: #('Pheno-Styles')];
					package: 'Pheno-Core' with: [spec requires: #('Pheno-Styles' 'JSON' 'SVG-Morphic')];
					package: 'Pheno-Widgets' with: [spec requires: #('Pheno-Core' 'Pheno-ToolBuilder')];
					package: 'Pheno-Examples' with: [spec requires: #('Pheno-Widgets')];
					package: 'Pheno-Tests-Core' with: [spec requires: #('Pheno-Widgets')];
					package: 'Pheno-Tests-Styles' with: [spec requires: #('Pheno-Tests-Core')];
					package: 'Pheno-Tools' with: [spec requires: #('Pheno-Widgets')];
					yourself.
				spec
					group: 'keys' with: #('GM-Keys');
					group: 'resources' with: #('GM-Resources');
					group: 'acceptanceTests' with: #('GM-AcceptanceTest');
					group: 'collision' with: #('GM-Collision');
					group: 'test' with: #('GM-Test')];
					yourself.