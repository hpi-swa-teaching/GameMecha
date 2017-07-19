baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			Smalltalk at: #RxParser ifAbsent:[spec "add regex only if not there yet"
				package: 'VB-Regex' with: [spec repository: 'http://www.squeaksource.com/Regex']].
			spec
				package: 'JSON' with: [spec repository: 'http://www.squeaksource.com/JSON'];
				package: 'GameMecha-Core' with: [spec requires: #('JSON' 'VB-Regex')];
				package: 'GameMecha-Keys';
				package: 'GameMecha-Assets';
				package: 'GameMecha-Test' with: [spec requires: #('default' 'keys' 'assets')];
				yourself.
			spec
				group: 'default' with: #('GameMecha-Core');
				group: 'keys' with: #('GameMecha-Keys');
				group: 'assets' with: #('GameMecha-Assets');
				group: 'tests' with: #('GameMecha-Test')];
				yourself.