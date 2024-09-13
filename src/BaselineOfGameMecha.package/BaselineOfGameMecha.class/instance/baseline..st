baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [
				
				self squotMapper: spec.
				
				spec
					package: 'GameMecha-ResourceLoading';
					package: 'GameMecha-Collision';
					package: 'GameMecha-KeyHandling';
					package: 'GameMecha-TileEditor' with: [spec requires: #('Squot')];
					package: 'GameMecha-Examples' with: [spec requires: #('core')];
					package: 'GameMecha-DemoGame' with: [spec requires: #('core')];
					package: 'GameMecha-Test' with: [spec requires: #('core' 'GameMecha-Examples')].
				spec
					group: 'core' with: #('GameMecha-ResourceLoading' 'GameMecha-Collision' 'GameMecha-KeyHandling' 'GameMecha-TileEditor');
					group: 'examples' with: #('GameMecha-Examples' 'GameMecha-DemoGame');
					group: 'test' with: #('GameMecha-Test')]