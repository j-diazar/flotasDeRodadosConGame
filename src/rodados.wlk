import wollok.game.*

class Corsa{
	var property color
	var property position 
	var property image 
	const property listaPos = []
	
	method capacidad(){ return 4 }
	method velMaxima(){ return 150 }
	method peso(){ return 1300 }
	
	//game - movimiento
	method moverADerecha(){
		self.position(self.position().right(1))
		listaPos.add(self.position())
	}
	method moverAIzquierda(){
		self.position(self.position().left(1))
		listaPos.add(self.position())
	}
	method moverAArriba(){
		self.position(self.position().up(1))
		listaPos.add(self.position())
	}
	method moverAAbajo(){
		self.position(self.position().down(1))
		listaPos.add(self.position())
	}
	
	
	//game - consultas
	method pasoPor(posicion){
		return listaPos.any({ p => p == posicion})
	}
	
	method pasoPorFila(numero){
		const filasRec = listaPos.map({ p => p.x()}).asSet()
		return filasRec.any({ x => x == numero})
	}
	
	method recorrioFilas(lista_de_numeros){
		const filasRecorridas = listaPos.map({ p => p.x()}).asSet()
		return lista_de_numeros.all({fila => filasRecorridas.contains(fila)})
	}
	
	method image(){
		if(color=="rojo"){return "autitorojo.png"}
		else if(color=="azul"){return "autitoazul.png"}
		else if(color=="verde"){return "autitoverde.png"}
		else{return null}
	}
}

class Kwid{
	var property tieneTanqueAdicional
	
	method capacidad(){ return if (tieneTanqueAdicional) 3 else 4 }
	method velMaxima(){ return if (tieneTanqueAdicional) 120 else 110 }
	method peso(){ return if (tieneTanqueAdicional) 1350 else 1200 }
	method color(){ return "azul" }
}

class AutoEspecial{
	var property capacidad 
	var property velMaxima
	var property peso
	var property color
}