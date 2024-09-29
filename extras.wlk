import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"
	//method position() = game.origin()
	
	//method position() = game.at(pepita.position().x(),0) //asi lo sigue por todo el eje x
	method position() = game.at(pepita.position().x().max(3),0) //hasta el 3 del x

	method teEncontro(ave) {
	game.say(ave, "¡PERDÍ!")
	game.schedule(2000, { game.stop() })
	}

}
