# This coffeescript is the js that is inlined on the swagger index page

# Function for adding authorization to the header from the 'explore' form at the top
addApiKeyAuthorization = ->
  key = $("#input_apiKey")[0].value
  if key and key.trim() isnt ""
    log "added key " + key
    window.authorizations.add("oauth2", new ApiKeyAuthorization("Authorization", "Bearer #{key}", "header"))
  return

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

initializeApplicationList = ->
  # Manage scopes and the parameters
  $('.newtoken-scope-check').change (e) ->
    app = $(e.target).parents('.application_list_box')
    link = app.find('.authorize_new_token_link')
    checked = app.find('.newtoken-scope-check input:checked')
    scopes = []
    scopes.push($(s).attr('id')) for s in checked   
    url = link.attr('data-base')
    url = "#{url}&scope=#{scopes.join('+')}" if scopes.length > 0
    link.attr('href', url).text(url)

  # In application list, on "use token", show the header, set the token
  $('.set-token').click (e) ->
    e.preventDefault()
    $('#header').addClass('headroom--pinned').removeClass('headroom--unpinned')
    input_key = $("#input_apiKey")
    input_key.fadeOut('fast', ->
      input_key.val($(e.target).attr('data-token')).change()
      input_key.fadeIn('fast')
    )

  # Slide toggle applications in list
  $('.listed-app-name').click (e) ->
    e.preventDefault()
    target = $(e.target)
    target.parents('li').find('.application-info').slideToggle('fast')
    target.toggleClass('uncollapsed')

  # Add token from application
  $('.add-token-form-btn').click (e) ->
    e.preventDefault()
    app = $(e.target).parents('.application_list_box')
    app_id = app.attr('data-id')
    app.find('.add-token-form, .add-token-form-btn').slideToggle()

$ ->
  url = "#{window.base_url}/api/#{window.api_version}/swagger_doc"
  window.swaggerUi = new SwaggerUi(
    url: url
    dom_id: "swagger-ui-container"
    supportedSubmitMethods: [
      "get"
      "post"
      "put"
      "delete"
    ]
    onComplete: (swaggerApi, swaggerUi) ->
      # Try to load the token from local storage
      token = localStorage.getItem('access_token')
      if token? && token.length > 0
        # If token exists, change 
        $("#input_apiKey").val(token).change()

      $("pre code").each (i, e) ->
        hljs.highlightBlock e
        return

      return

    onFailure: (data) ->
      log "Unable to Load SwaggerUI"
      return

    docExpansion: "none"
    sorter: "alpha"
  )

  window.swaggerUi.load()

  initializeAccessTokenForm()
  initializeApplicationList()
  
