$ ->
	_adjustTextRemaining = (e) ->
		textRemainingNode.textContent = maxLength - @value.length
		if parseInt(textRemainingNode.textContent) <= 0
			@value = @value.slice(0, maxLength-1)
			e.preventDefault()

	_preventMultipleNewLines = (e) ->
		split = @value.split("\n")
		if e.which is 13 and split[split.length - 1].length <= 0
			e.preventDefault()

	maxLength = 1000
	textRemainingNode = document.getElementById('text-remaining')
	commentBox = document.getElementById('commentBox')
	commentBox.addEventListener 'keydown', _adjustTextRemaining
	commentBox.addEventListener 'keydown', _preventMultipleNewLines
	commentBox.addEventListener 'change', _adjustTextRemaining
	commentBox.addEventListener 'keyup', _adjustTextRemaining




