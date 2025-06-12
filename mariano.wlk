import golosinas.*

object mariano {
	const golosinas = []
	
	method comprar(_golosina) {
		golosinas.add(_golosina)
	}
	
	method desechar(_golosina) {
		golosinas.remove(_golosina)
	}
	
	method golosinas() = golosinas
	
	method primerGolosina() = golosinas.first()
	
	method ultimaGolosina() = golosinas.last()
	
	method pesoGolosinas() = golosinas.sum({ golo => golo.peso() })
	
	method probarGolosinas() {
		golosinas.forEach({ _golosina => _golosina.mordisco() })
	}
	
	method golosinaMasPesada() = golosinas.max({ golo => golo.peso() })
	
	method hayGolosinaSinTACC() = golosinas.any(
		{ _golosina => _golosina.libreGluten() }
	)
	
	method preciosCuidados() = golosinas.all(
		{ _golosina => _golosina.precio() < 10 }
	)
	
	method golosinaDeSabor(_sabor) = golosinas.find(
		{ golosina => golosina.sabor() == _sabor }
	)
	
	method golosinasDeSabor(_sabor) = golosinas.filter(
		{ golosina => golosina.sabor() == _sabor }
	)
	
	method sabores() = golosinas.map({ golosina => golosina.sabor() }).asSet()
	
	method golosinaMasCara() = golosinas.max({ _golosina => _golosina.precio() })
	
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.difference(
		golosinas
	)
	
	method saboresFaltantes(_saboresDeseados) = _saboresDeseados.filter(
		{ _saborDeseado => !self.tieneGolosinaDeSabor(_saborDeseado) }
	)
	
	method tieneGolosinaDeSabor(_sabor) = golosinas.any(
		{ _golosina => _golosina.sabor() == _sabor }
	)
	
	method comprarVarias(listaGolosinas) {
		golosinas.add(listaGolosinas)
	}
	
	method baniar(unaGolosina) {
		if (unaGolosina.toString() == "a GolosinaBaniada") {
			golosinas.forEach({ x => if (x == unaGolosina) golosinas.remove(x) })
			golosinas.add(unaGolosina)
		}
		golosinas.forEach({ x => if (x == unaGolosina) golosinas.remove(x) })
		golosinas.add(new GolosinaBaniada(golosinaInterior = unaGolosina))
	} // ?
}