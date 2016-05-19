ui
requestHeaders

	| headers key value |
	headers := Dictionary new.
	self ui headerContainer submorphs
		do: [:keyValuePair |
				key := keyValuePair submorphs first theText asString.
				value := keyValuePair submorphs second theText asString.
				(key ~= '' and: [value ~= ''])
					ifTrue: [headers at: key put: value]].
	^ headers