test cases
testNewFromAssetRaisesError

	self should: [GMNullCollider newFromAsset: '{}'] raise: Error