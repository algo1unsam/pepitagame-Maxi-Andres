import extras.*
import wollok.game.*

object pepita {

	var property energia = 100 //depues ponelo en 100
	var property position = game.origin()

	method image() {
		// return if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
		} else if (self.position() == silvestre.position() || self.estaCansada()) {
			"pepita-gris.png"
		} else {"pepita.png"}
	}

	method esAtrapada() = self.position() == silvestre.position()

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method cae() {
		if (energia > 0) {
		position = self.position().down(1)
		}
	}
	method irA(nuevaPosicion) {
		if (energia > 0) {
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
			}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
		
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method limiteizq() = self.position().x().between(1, 9)
	method limiteder() = self.position().x().between(0, 8)
	method limiteup() = self.position().y().between(0, 8)
	method limitedown() = self.position().y().between(1, 9)

}