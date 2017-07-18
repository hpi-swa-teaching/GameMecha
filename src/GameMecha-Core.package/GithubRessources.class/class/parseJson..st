as yet unclassified
parseJson: jsonString
"retruns a list of files"
| ret json |
ret := Dictionary new.
json := (Json newWithConstructors: {Object.}) readFrom: jsonString readStream.
json do: [:o | (o at: 'download_url') ifNotNil: [ret at: (o at: 'path') ifAbsentPut: (o at: 'download_url')]].
^ ret.