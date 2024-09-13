baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [
				
				self squotMapper: spec.
				
				spec
					package: 'GameMecha-ResourceLoading';
					package: 'GameMecha-Collisions';
					package: 'GameMecha-KeyHandling';
					package: 'GameMecha-TileEditor' with: [spec requires: #('Squot')];
					package: 'GameMecha-Examples' with: [spec requires: #('core')];
					package: 'GameMecha-DemoGame' with: [spec requires: #('core')];
					package: 'GameMecha-Test' with: [spec requires: #('core')].
				spec
					group: 'core' with: #('GameMecha-ResourceLoading' 'GameMecha-Collisions' 'GameMecha-KeyHandling' 'GameMecha-TileEditor');
					group: 'examples' with: #('GameMecha-Examples' 'GameMecha-DemoGame');
					group: 'test' with: #('GameMecha-Test')]