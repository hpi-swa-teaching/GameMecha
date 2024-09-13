Class {
	#name : #BaselineOfGameMecha,
	#superclass : #BaselineOf,
	#category : #BaselineOfGameMecha
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'ek 9/13/2024 15:11'
}
BaselineOfGameMecha >> baseline: spec [
	<baseline>
	spec
		for: #'common'
			do: [
				spec
					package: 'GameMecha-ResourceLoading';
					package: 'GameMecha-Collisions';
					package: 'GameMecha-KeyHandling';
					package: 'GameMecha-TileEditor';
					package: 'GameMecha-Examples' with: [spec requires: #('core')];
					package: 'GameMecha-DemoGame' with: [spec requires: #('core')];
					package: 'GameMecha-Test' with: [spec requires: #('core')];
					yourself.
				spec
					group: 'core' with: #('GameMecha-ResourceLoading' 'GameMecha-Collisions' 'GameMecha-KeyHandling' 'GameMechaTileEditor');
					group: 'test' with: #('GM-Test');
					yourself]
]
