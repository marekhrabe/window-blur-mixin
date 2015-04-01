listeners = []

window?.addEventListener 'blur', (e) ->
  callback?(e) for callback in listeners

module.exports =
  componentDidMount: ->
    callback = @onWindowBlur
    if typeof callback is 'function'
      listeners.push callback
    else
      console.error 'You need to implement onWindowBlur when you use WindowBlurMixin.'

  componentWillUnmount: ->
    index = listeners.indexOf @onWindowBlur
    if index > -1
      listeners.splice index, 1
