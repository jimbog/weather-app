Session.set('city', 'chicago')

Template.layout.weather = ->
  city = Session.get('city') || 'chicago'
  console.log city
  Meteor.call 'getWeather', city, (err, results)->
    console.log results.content
    Session.set('weather', JSON.parse(results.content))

  k2c = (k) ->
    k - 273

  condition = Session.get('weather').weather[0].main

  result =
    city: city
    temperature: Math.floor(k2c(Session.get('weather').main.temp))
    tempUnit: 'C'
    pic: 'icons/' + condition + '.svg'

Template.layout.events
  'click .button': (evt, tmpl) ->
    Session.set('city', tmpl.find('#city').value)
