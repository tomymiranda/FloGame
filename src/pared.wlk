import wollok.game.*

class Pared {

	var property resistencia = 10
	var property position

	method image() {
		if (self.resistencia() > 0) {
			return "C:/Users/Usuario/Desktop/Unahur/PO1/git/FloGame/assets/pared.png"
		} else {
			return ""
		}
	}

}

