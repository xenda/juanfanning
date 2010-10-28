require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL = "http://elcomercio.pe/cine/cartelera"

doc = Nokogiri::HTML(open(URL))

cinemas = doc.css("#cine option").map {|cinema| {:id => cinema.attributes["value"], :title => cinema.content } }
cinemas.shift

# We transverse the array creating first a movie chain and then a theatre. The movie chain 


movies = doc.css("#pelicula option").map {|movie| {:id => movie.attributes["value"], :title => movie.content } }
movies.shift




#=> Elija la película
#=> Ámame o muérete
#=> La leyenda de los guardianes
#=> Agente Salt
#=> Presencias extrañas
#=> Personalidad múltiple
#=> El regreso de la nana mágica
#=> Resident Evil 4: La resurrección
#=> Tinker Bell: Hadas al rescate


