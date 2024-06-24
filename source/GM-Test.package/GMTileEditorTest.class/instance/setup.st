helper
setUp

	self editor ifNil: [self editor: GMTEEditor new].
	self fileUUID: UUID new asString