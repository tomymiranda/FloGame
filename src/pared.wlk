import wollok.game.*

class Pared {

	var property resistencia = 10
	var property position

	method image() {
		if (self.noSePuedeAtravesar()) {
			return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/pared.png"
		} else {
			return ""
		}
	}
	
	method noSePuedeAtravesar(){
		return self.resistencia() > 0
	}

	method reducirResistencia(){
		self.resistencia((self.resistencia()-1).max(0))
	}
}

