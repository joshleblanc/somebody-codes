(function(){$(function(){var commentBox,maxLength,textRemainingNode,_adjustTextRemaining,_preventMultipleNewLines;_adjustTextRemaining=function(e){textRemainingNode.textContent=maxLength-this.value.length;if(parseInt(textRemainingNode.textContent)<=0){this.value=this.value.slice(0,maxLength-1);return e.preventDefault()}};_preventMultipleNewLines=function(e){var split;split=this.value.split("\n");if(e.which===13&&split[split.length-1].length<=0){return e.preventDefault()}};maxLength=1e3;textRemainingNode=document.getElementById("text-remaining");commentBox=document.getElementById("commentBox");commentBox.addEventListener("keydown",_adjustTextRemaining);commentBox.addEventListener("keydown",_preventMultipleNewLines);commentBox.addEventListener("change",_adjustTextRemaining);return commentBox.addEventListener("keyup",_adjustTextRemaining)})}).call(this);