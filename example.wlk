//paquete

object paquete {
  var destino = puenteDeBrooklyn
  var estaPagado = false

  method estadoDelPago(estado) {
    estaPagado = estado
  }
  method cambiarDestino(unDestino) {
    destino = unDestino
  }

  method puedeSerEntregadoPor(unMesajero) {
    return estaPagado and destino.dejaPasar(unMesajero)
  }
}


//destinos posibles

object puenteDeBrooklyn {
  method dejaPasar(mensajero) {
    return mensajero.peso() <= 1000
  }
}

object matrix {
  method dejaPasar(mensajero) {
    return mensajero.puedeLlamar()
  }
}

//vehiculos de roberto

object bicicleta {
  method peso() = 5
}

object camion {
  var acoplados = 1

  method cantidadAcoplados(unaCantidad) {
    acoplados = unaCantidad
  }

  method peso() = acoplados * 500
}
//mesajeros

object roberto {
  const pesoPropio = 90
  var vehiculoElegido = bicicleta

  method cambiarVehiculo(unVehiculo) {
    vehiculoElegido = unVehiculo
  }

  method peso() {
    return pesoPropio + vehiculoElegido.peso()
  }
  method puedeLlamar() = false
}

object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
}

object neo {
  var tieneCredito = true
  
  method estadoCredito(estado) {
    tieneCredito = estado
  }
  
  method peso() = 0
  method puedeLlamar() = tieneCredito
}
