baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
			do: [			
				spec
					package: 'GameMecha-ResourceLoading';
					package: 'GameMecha-Collision';
					package: 'GameMecha-GMCollisionEditor' with: [spec requires: #('GameMecha-Collision')];
					package: 'GameMecha-KeyHandling';
					package: 'GameMecha-TileEditor';
					package: 'GameMecha-Examples' with: [spec requires: #('core')];
					package: 'GameMecha-DemoGame' with: [spec requires: #('core')];
					package: 'GameMecha-DemoGame' with: [spec requires: #('core')];
					package: 'GameMecha-Test' with: [spec requires: #('core' 'GameMecha-Examples')].
				spec
					group: 'core' with: #('GameMecha-ResourceLoading' 'GameMecha-Collision' 'GameMecha-KeyHandling' 'GameMecha-TileEditor' 'GameMecha-GMCollisionEditor');
					group: 'examples' with: #('GameMecha-Examples' 'GameMecha-DemoGame' 'GameMecha-DemoGame2');
					group: 'test' with: #('GameMecha-Test')]