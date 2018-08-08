actions
refresh
	self cache: nil; batchPage: self defaultBatchPage.
	self columns do: [ :each | each refresh ]