unless String::capatalize
  String::capatalize = ->
    @charAt(0).toUpperCase() + @slice(1)

unless String::startsWith
  String::startsWith = (s) ->
    @substring(0, s.length) is s

unless String::isNumeric
  String::isNumeric = ->
    not isNaN(this) and /\S/.test(this)

unless Number::isInteger
  Number::isInteger = ->
    this % 1 is 0

unless Number::mantissa
  Number::mantissa = ->
    @toString().split(".")[1] or ""

unless Array::remove
  Array::remove = (i) ->
    @splice(i, 1);
    this

unless String::replaceAll
  String::replaceAll = (s, repl) ->
    @split(s).join(repl)

unless String::contains
  String::contains = (s) ->
    @split(s).length > 1

unless Array::filter
  Array::filter = (callback) -> element for element in this when callback(element)

unless Array::contains
  Array::contains = (s) -> $.inArray(s, this) != -1

#Taken from: http://stackoverflow.com/a/979997/2424975
window.gup = (name) ->
  name = name.replace(/[\[]/, "\\\[")
  .replace(/[\]]/, "\\\]")
  regexS = "[\\?&]#{name}=([^&#]*)"
  regex = new RegExp(regexS)
  results = regex.exec window.location.href
  if results then results[1] else null
