//PARTE 1

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

  method precio() = 50

  method puedeSerEntregadoPor(unMensajero) {
    return estaPagado and destino.dejaPasar(unMensajero)
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
  
  method cambiarEstadoDeCredito(estado) {
    tieneCredito = estado
  }
  
  method peso() = 0
  method puedeLlamar() = tieneCredito
}


//PARTE 2

object mensajeria {
  const mensajeros = []

  method contratarAUnMensajero(unMensajero) {
    return mensajeros.add(unMensajero)
  }

  method despedirAUnMensajero(unMensajero) {
    return mensajeros.remove(unMensajero)
  }

  method despedirATodosLosMensajeros() {
    return mensajeros.clear()
  }

  method analizarSiLaMensajeriaEsGrande() {
    return mensajeros.size() > 2
  }

  method elPaquetePuedeSerEntregadoPorElPrimerEmpleado(unPaquete) {
    return unPaquete.puedeSerEntregadoPor(mensajeros.first())
  }

  method elPesoDelUltimoMensajeroDeLaEmpresa() {
    return mensajeros.last().peso()
  }
}


//parte 3

object paquetito {
  method precio() = 0
  method estaPagado() = true
  method puedeSerEntregadoPor(unMesajero) {
    return true
  }
}

object paquetonViajero {
  const destinos = []
  var estaPagado = true

  method cambiarEstadoDePago(unEstado) {
    estaPagado = unEstado
  }
  method agregarDestino(unDestino) {
    destinos.add(unDestino)
  }

  method precio() = destinos.size() * 100

  method puedeSerEntregadoPor(unMensajero) {
    return estaPagado and destinos.all({unDestino => unDestino.dejaPasar(unMensajero)})
  }
}


object laEmpresaMensajera {
  const mensajeros = []
  const paquetesEnviados = []
  const paquetesPendientes = [] 
  method paquetesEnviados() = paquetesEnviados
  method paquetesPendientes() = paquetesPendientes
  
  method contratarMensajero(unMensajero) {
    mensajeros.add(unMensajero)
  }
  
  //1
  method puedeSerEntregado(unPaquete) {
    return mensajeros.any({unMensajero => unPaquete.puedeSerEntregadoPor(unMensajero)})
  }
  
  //2
  method mensajerosQuePuedenLlevar(unPaquete) {
    return mensajeros.filter({unMensajero => unPaquete.puedeSerEntregadoPor(unMensajero)})
  }
  
  //3
  method pesoPromedio() {
    return mensajeros.sum({unMensajero => unMensajero.peso()}) / mensajeros.size()
  }
  
  method tieneSobrepeso() {
    return self.pesoPromedio() > 500
  }
  //4
  method enviar(unPaquete) {
    if(self.puedeSerEntregado(unPaquete)){
      paquetesEnviados.add(unPaquete)
    } else{
      paquetesPendientes.add(unPaquete)
    }
  }
  
  //5
  method gananciaTotal() {
    return paquetesEnviados.sum({unPaquete => unPaquete.precio()})
  }
  
  //6
  method enviarTodos(collecionDePaquetes) {
    collecionDePaquetes.forEach({unPaquete => self.enviar(unPaquete)})
  }

  // 7
  method enviarPendienteMasCaro() {
    const masCaro = paquetesPendientes.max({ unPaquete => unPaquete.precio() })
    if (self.puedeSerEntregado(masCaro)) {
      paquetesPendientes.remove(masCaro)
      paquetesEnviados.add(masCaro)
    }
  }
}

//9
object mensajeroDestacado {
  method peso() = 70
}

object paqueteEspecial {
  method precio() = 150
  method estaPagado() = true
  method puedeSerEntregadoPor(unMensajero) {
    return true
  }
}
