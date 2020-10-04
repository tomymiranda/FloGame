import rodados.*
class Pedido {
	
	var property distanciaARecorrer
	var property tiempoMaximo
	var property cantidadDePasajerosALlevar
	var property conjuntoColoresIncompatibles
	
	method velocidadRequerida(){
		return self.distanciaARecorrer() / self.tiempoMaximo()
	}
	
	method elAutoPuedeSatisfacerPedido(autito){
		return autito.velocidadMaxima() >= 10 and autito.capacidadPasajero() >= self.cantidadDePasajerosALlevar() and not self.conjuntoColoresIncompatibles().contains(autito.color())
	}
	
	method colorNoEsCompatible(colorsito){
		return conjuntoColoresIncompatibles.contains(colorsito)
	}

	method acelerar(){
		self.tiempoMaximo(self.tiempoMaximo()-1)
	}

	method relajar(){
		self.tiempoMaximo(self.tiempoMaximo()+1)
	}
}
