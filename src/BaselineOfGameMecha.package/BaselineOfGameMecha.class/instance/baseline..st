baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			spec
				package: 'GameMecha-Core';
				package: 'GameMecha-Keys';
				package: 'GameMecha-Test' with: [spec requires: #('default', 'keys')];
				yourself.
			spec
				group: 'default' with: #('GameMecha-Core');
				group: 'keys' with: #('GameMecha-Keys');
				group: 'tests' with: #('GameMecha-Test')];
				yourself.
