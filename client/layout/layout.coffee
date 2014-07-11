Template.layout.weather = ->
  city = Session.get('city')
  Meteor.call('getWeather', city, (err, results)->
    console.log results.content
    Session.set('weather', JSON.parse(results.content).main)
  )
  k2c = (k) ->
    k - 273

  {city: city, temperature: Math.floor(k2c(Session.get('weather').temp)), tempUnit: 'C'}

Template.layout.events
  'click .button': (evt, tmpl) ->
    Session.set('city', tmpl.find('#city').value)
