import wollok.game.*
import pared.*

class ChevroletCorsa {

	var property color
	var property position = game.origin()
	var posicionesPorDondePasoElCorsa = []


	method image() {
		return color.image()
	}

	method capacidadPasajero() {
		return 4
	}

	method velocidadMaxima() {
		return 150
	}

	method peso() {
		return 1300
	}

	method position() {
		return position
	}

	/*me parecio una mejor solucion antes que crear un objeto del tipo posicion y pasarlo como parametro
	 * 
	 */
	method position(a, b) {
		position = game.at(a, b)
		posicionesPorDondePasoElCorsa.add(new Position(x = a, y = b))
	}

	method coordenadaX() {
		return position.x()
	}

	method coordenadaY() {
		return position.y()
	}

	method posicionesPorDondePasoElCorsa() {
		return posicionesPorDondePasoElCorsa
	}

	method pasoPor(posicionDondeDebioPasar) {
		return posicionesPorDondePasoElCorsa.contains(posicionDondeDebioPasar)
	}

	method pasoPorFila(numero) {
		return posicionesPorDondePasoElCorsa.map({ c => c.x() }).contains(numero)
	}

	// no me salio usando el self.pasoPorFila o si se podia no supe hacerlo
	method recorrioFilas(lista_de_numeros) {
		return posicionesPorDondePasoElCorsa.map({ c => c.x() }).asSet().intersection(lista_de_numeros.asSet()) == lista_de_numeros.asSet()
	// return self.pasoPorFila({=>lista_de_numeros})
	}

	method moverALaDerecha() {
		
		posicionesPorDondePasoElCorsa.add(self.position())
		self.position(self.position().right(1))
	}

	method moverALaIzquierda() {
		
		posicionesPorDondePasoElCorsa.add(self.position())
		self.position(self.position().left(1))
	}

	method moverArriba() {
		
		posicionesPorDondePasoElCorsa.add(self.position())
		self.position(self.position().up(1))
	}

	method moverAbajo() {
		
		posicionesPorDondePasoElCorsa.add(self.position())
		self.position(self.position().down(1))
	}
	
	method volverALaPosicionAnterior(){
		self.position(posicionesPorDondePasoElCorsa.last())
	}

	
	/* 
	no anda:
	* tira que corsa no entiende el metodo noSePuedeAtravesar() cuando el que trabaja con eso es pared
	* self.volverAlaPosicionAnterior() tira un error de -1
	
	method chocar(pared) {
		if (pared. noSePuedeAtravesar()) {
			pared.reducirResistencia()
			self.volverALaPosicionAnterior()
		} else {
			game.removeVisual(pared)
			
		}
	}
	*/
	
}

class RenaultKwid {

	var property tanqueAdicional

	method capacidadPasajero() {
		return if (self.tanqueAdicional()) {
			3
		} else {
			4
		}
	}

	method velocidadMaxima() {
		return if (self.tanqueAdicional()) {
			120
		} else {
			110
		}
	}

	method peso() {
		return if (self.tanqueAdicional()) {
			1350
		} else {
			1200
		}
	}

	method color() {
		return azul
	}

}

object trafic {

	var property interiorDeTrafic
	var property motor

	method capacidadPasajero() {
		return self.interiorDeTrafic().capacidad()
	}

	method velocidadMaxima() {
		return self.motor().velocidad()
	}

	method peso() {
		return 4000 + self.interiorDeTrafic().peso() + self.motor().peso()
	}

	method color() {
		return blanco
	}

}

class AutoEspecial {

	var property capacidadPasajero
	var property velocidadMaxima
	var property peso
	var property color

}

object interiorComodo {

	method capacidad() {
		return 5
	}

	method peso() {
		return 700
	}

}

object interiorPopular {

	method capacidad() {
		return 12
	}

	method peso() {
		return 1000
	}

}

object motorPulenta {

	method velocidad() {
		return 130
	}

	method peso() {
		return 800
	}

}

object motorBataton {

	method velocidad() {
		return 80
	}

	method peso() {
		return 500
	}

}

object rojo {

	method image() {
		return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/autitorojo.png"
	}

}

object azul {

	method image() {
		return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/autitoazul.jpg"
	}

}

object blanco {

}

object negro {

}

object verde {

	method image() {
		return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/autitoverde.jpg"
	}

}

object beige {

}

