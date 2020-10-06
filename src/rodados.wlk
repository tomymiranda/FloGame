import wollok.game.*
import pared.*

class ChevroletCorsa {

	var property color
	var position = game.origin()
	var posicionesPorDondePasoElCorsa = []

	// getObjectsIn(position) para devolver un objeto en una posicion
	/* 
	 * posible solucion para la pared : poner un mentodo que verifique si hay pared y despues modificar los metodos mover
	 */
	
	method moverALaDerecha(){self.nuevaPosicion(position.x()+1,position.y())}
	method moverALaIzquierda(){self.nuevaPosicion(position.x()-1,position.y())}
	method moverArriba(){self.nuevaPosicion(position.x(),position.y()+1)}
	method moverAbajo(){self.nuevaPosicion(position.x(),position.y()-1)}
	
	method image(){
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

	// no sabia como pasar una posicion sin plantear como x e y
	method nuevaPosicion(a, b) {
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
		//return self.pasoPorFila({=>lista_de_numeros})
		//return posicionesPorDondePasoElCorsa.map({ c => c.x() }).asSet() == (lista_de_numeros.asSet()) 
	}

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
	method image(){return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/autitorojo.png"}
}

object azul {
	method image(){return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/autitoazul.jpg"}
}

object blanco {

}

object negro {

}

object verde {
	method image(){return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/autitoverde.jpg"}
}

object beige {

}

