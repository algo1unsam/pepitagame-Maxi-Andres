import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()  
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		config.configurarGravedad()
	}

}

object config {

	method configurarTeclas() {

		keyboard.left().onPressDo({ if (pepita.limiteizq()) { pepita.irA(pepita.position().left(1)) } }) 
		keyboard.right().onPressDo({ if (pepita.limiteder()) { pepita.irA(pepita.position().right(1)) } }) 
		keyboard.up().onPressDo({ if (pepita.limiteup()) { pepita.irA(pepita.position().up(1)) } })
		keyboard.down().onPressDo({ if (pepita.limitedown()) { pepita.irA(pepita.position().down(1)) } })

		keyboard.c().onPressDo({ pepita.come(game.uniqueCollider(pepita)) })
	}

	method configurarColisiones() {
	game.onCollideDo(pepita, { algo => algo.teEncontro(pepita) })
	}

	method configurarGravedad() {
		game.onTick(800, "gravedad", {if (pepita.limitedown()) { pepita.cae() }}) // hice otro metodo para que no pierda energia
	}
}