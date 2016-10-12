# Better log functionality
log = ->
  if 'console' of window
    console.log.apply console, arguments

initializeAccessTokenForm = ->
  # On api key change, store the API key in localstorage
  $("#input_apiKey").change ->
    addApiKeyAuthorization()
    localStorage.setItem('access_token', $('#input_apiKey').val())
  # Set up headroom - floating header
  $('#header').headroom()
  # Set the token from the parameters (used when redirecting from OAuth)
  param_token = window.location.href.match(/access_token=[^#|\/]*/i)
  if param_token? && param_token.length > 0
    $("#input_apiKey").val(param_token[0].replace('access_token=', '')).change()


$ ->
  hljs.configure highlightSizeThreshold: 5000
  url = window.swagger_url
  url = 'https://bikeindex.org/api/v2/swagger_doc'

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

  initializeAccessTokenForm()
