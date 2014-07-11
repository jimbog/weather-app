Meteor.methods
  'getWeather': (city) ->
    Meteor.http.call('GET', 'http://api.openweathermap.org/data/2.5/weather?q=' + city)