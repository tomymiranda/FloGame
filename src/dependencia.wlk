import rodados.*

class Dependencia {

	var flota = []
	var pedidos = []
	var property cantidadEmpleados

	method agregarAFlota(rodado) {
		flota.add(rodado)
	}

	method quitarDeFlota(rodado) {
		flota.remove(rodado)
	}

	method pesoTotalFlota() {
		return flota.sum({ c => c.peso() })
	}

	method estaBienEquipada() {
		return flota.size() >= 3 and flota.all({ c => c.velocidadMaxima() >= 100 })
	}

	method capacidadTotalEnColor(color) {
		return flota.filter({ c => c.color() == color }).sum({ c => c.capacidadPasajero() })
	}

	method colorDelRodadoMasRapido() {
		return flota.max({ c => c.velocidadMaxima() }).color()
	}

	method capacidadFaltante() {
		return (self.cantidadEmpleados() - flota.sum({ c => c.capacidadPasajero() })).max(0)
	}

	method esGrande() {
		return self.cantidadEmpleados() >= 40 and flota.size() >= 5
	}

	//etapa 3
	method agregarPedido(pedido) {
		pedidos.add(pedido)
	}

	method removerPedido(pedido) {
		pedidos.remove(pedido)
	}

	method totalPasajerosPedidos() {
		return pedidos.sum({ c => c.cantidadDePasajerosALlevar() })
	}

	method pedidosInsatisfechos() {
		return pedidos.filter({d => self.pedidoInsatisfecho(d) })
	}

	method pedidoInsatisfecho(pedido){
		return flota.any({c=> not pedido.elAutoPuedeSatisfacerPedido(c)})
	}	

	method colorIncompatible(color){
		return pedidos.all({c => c.colorNoEsCompatible(color)})
	}

	method relajarTodosLosPedidos(){
		pedidos.forEach({c => c.relajar()})
	}

	method acelerarTodosLosPedidos(){
		pedidos.forEach({c => c.acelerar()})
	}
}

