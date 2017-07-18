as yet unclassified
apiUrlForTeam: team andProject: project andPath: path andBranche: branche
	| myPath |
	myPath := path.
	(myPath beginsWith: '/') ifFalse: [myPath := '/' , myPath].
	^ 'https://api.github.com/repos/' , team, '/' , project , '/contents' , myPath , '?ref=' , branche.