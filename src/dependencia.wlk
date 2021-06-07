import rodados.*
import pedidos.*
import trafic.*

class Dependencia {
	const property flota = []
	var property empleados
	const property registroPedidos = []
	
	//RODADOS
	method agregarAFlota(rodado){
		flota.add(rodado)
	}
	
	method quitarDeFlota(rodado){
		flota.remove(rodado)
	}
	
	method pesoTotalFlota(){
		return flota.sum({f => f.peso()})
	}
	
	method estaBienEquipada(){
		return flota.size()>= 3 and flota.all({f => f.velMaxima() >= 100})
	}
	
	method capacidadTotalEnColor(color){
		const flotaColor = flota.filter({ f => f.color() == color })
		
		return flotaColor.sum({ f => f.capacidad()})
	}
	
	method colorDelRodadoMasRapido(){
		return flota.max({ f => f.velMaxima()}).color()
	}
	
	method capacidadFaltante(){
		return empleados - flota.sum({ f => f.capacidad()})
	}
	
	method esGrande(){
		return self.empleados() > 40 and flota.size() >= 5
	}
	
	//PEDIDOS
	method agregar(pedido){
		registroPedidos.add(pedido)
	}
	
	method sacar(pedido){
		registroPedidos.remove(pedido)
	}
	
	method totalPasajerosRegistrados(){
		return registroPedidos.sum({ p => p.cantidadDePasajeros()})
	}
    
    method pedidosNoSatisfechos(){
        return registroPedidos.filter({pedido => self.pedidoNoSatisfecho(pedido)})
    }
	
	method pedidoNoSatisfecho(unPedido){
        return flota.all({auto => not(unPedido.puedeSatisfacerPedido(auto))})
    }
	
	method incompatibleConTodos(color){
		return registroPedidos.all({p => p.coloresIncompatibles().contains(color)})
	}
	
	method relajarATodos(){
		registroPedidos.forEach({p => p.relajar()})
	}
	
}
