import wollok.game.*
import rodados.*

class Pared {

	var property resistencia = 10
	var property position

	method image() {
		if (self.resistencia() > 6) {
			return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/pared.png"
		} else {
			return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/paredrota.png"
		}
	}

	method noSePuedeAtravesar() {
		return self.resistencia() > 0
	}

	method reducirResistencia() {
		self.resistencia((self.resistencia() - 1).max(0))
	}	

	
}

