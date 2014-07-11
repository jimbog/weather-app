Template.layout.weather = ->
  city = Session.get('city')
  Meteor.call('getWeather', city, (err, results)->
    console.log results.content
    Session.set('weather', JSON.parse(results.content).main)
  )
  {city: city, temperature: Session.get('weather').temp }

Template.layout.events
  'click .button': (evt, tmpl) ->
    Session.set('city', tmpl.find('#city').value)
