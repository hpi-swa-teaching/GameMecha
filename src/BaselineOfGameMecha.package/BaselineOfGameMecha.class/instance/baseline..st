baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			spec package: 'JSON' with: [spec repository: 'http://www.squeaksource.com/JSON'].
			
			(Smalltalk classNames includes: #RxParser) "add regex only if not there yet"
				ifTrue: [spec
					package: 'GameMecha-Core' with: [spec requires: #('JSON')]]
				ifFalse:[spec 
					package: 'VB-Regex' with: [spec repository: 'http://www.squeaksource.com/Regex'];
					package: 'GameMecha-Core' with: [spec requires: #('JSON' 'VB-Regex')]].
			spec
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