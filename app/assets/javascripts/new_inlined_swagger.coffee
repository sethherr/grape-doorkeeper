log = ->
    if 'console' of window
      console.log.apply console, arguments

$ ->
  hljs.configure highlightSizeThreshold: 5000
  url = window.swagger_url
  log url
  window.swaggerUi = new SwaggerUi(
    url: url
    dom_id: 'swagger-ui-container'
    supportedSubmitMethods: [
      'get'
      'post'
      'put'
      'delete'
      'patch'
    ]
    onComplete: (swaggerApi, swaggerUi) ->
      # Try to load the token from local storage
      token = localStorage.getItem('access_token')
      if token? && token.length > 0
        # If token exists, change 
        $('#input_apiKey').val(token).change()
      $('pre code').each (i, e) ->
        hljs.highlightBlock e
        return

      return
    onFailure: (data) ->
      log 'Unable to Load SwaggerUI'
      return
    docExpansion: 'none'
    jsonEditor: false
    defaultModelRendering: 'schema'
    showRequestHeaders: false)
  window.swaggerUi.load()
  return
