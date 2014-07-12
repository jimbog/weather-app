Template.result.weather = ->
  city = Session.get('city')
  unless city == undefined
    console.log 'the city is ' +  city
    Meteor.call 'getWeather', city, (err, result) ->
      Session.set('weather', JSON.parse(result.content))

    results = Session.get('weather')
    condition = results.weather[0].main

    weather =
      city: city
      temperature: Math.floor( results.main.temp)
      tempUnit: 'C'
      pic: 'icons/' + condition + '.svg'
      name: results.name
    return weather
