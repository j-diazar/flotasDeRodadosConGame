import rodados.*
import trafic.*

class Pedidos{
	var property distancia
	var property tiempoMaximo
	var property cantidadDePasajeros
	const property coloresIncompatibles = []
	
	method agregar(color){
		coloresIncompatibles.add(color)
	}
	
	method sacar(color){
		coloresIncompatibles.remove(color)
	}
	
	method velocidadRequerida(){
		return distancia/tiempoMaximo
	}
	
	method puedeSatisfacerPedido(auto){
		return auto.velMaxima() >= (self.velocidadRequerida()+10) and
		auto.capacidad() >= self.cantidadDePasajeros() and
		coloresIncompatibles.any({c => self != auto.color()})
	}
	
	method acelerar(){
		tiempoMaximo = tiempoMaximo - 1
	}
	
	method relajar(){
		tiempoMaximo = tiempoMaximo + 1
	}
	
}