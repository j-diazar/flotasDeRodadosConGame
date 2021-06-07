object trafic{
	var property interior
	var property motor
	
	method capacidad(){ return interior.capacidad() }
	method velMaxima(){ return motor.velMaxima() }
	method peso(){ return 4000 + interior.peso() + motor.peso() }
	method color(){ return "blanco" }
}

object interiorComodo{
	method capacidad(){ return 5 }
	method peso(){ return 700 }
}

object interiorPopular{
	method capacidad(){ return 12 }
	method peso(){ return 1000 }
}

object motorPulenta{
	method peso(){ return 800 }
	method velMaxima(){ return 130 }
}

object motorBataton{
	method peso(){ return 500 }
	method velMaxima(){ return 80 }
}