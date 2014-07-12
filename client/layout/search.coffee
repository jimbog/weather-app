Template.search.events
  'change #city': (evt, tmpl) ->
    Session.set('city', tmpl.find('#city').value)
    console.log Session.get('city')
