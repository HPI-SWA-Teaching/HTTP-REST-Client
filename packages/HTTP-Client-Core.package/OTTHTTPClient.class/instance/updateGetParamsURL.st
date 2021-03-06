ui-feedback
updateGetParamsURL

	| model url index pairs |
	model := self uiInput requestGetParams model.
	url := self requestSpecification url.
	"add slash if url is just the domain name"
	(url last ~= $/ and: [(url occurrencesOf: $/) <= 2])
		ifTrue: [url := url , '/'].
	index := url indexOf: $?.
	"get url without encoded params"
	url := index = 0
		ifTrue: [url, '?']
		ifFalse: [url copyFrom: 1 to: index].
		
	pairs := model pairsSelect: [:key :value | true].
	url := url, (WebUtils encodeUrlEncodedForm: pairs).
	
	"remove ? if last character"
	(url last = $?) ifTrue: [url := url copyFrom: 1 to: url size - 1].
	"feedback loop here is prevented by textedit itself...
	no change signal is sent if the text is not changed actually"
	self requestURL: url.