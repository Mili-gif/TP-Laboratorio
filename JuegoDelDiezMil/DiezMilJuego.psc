Algoritmo DiezMilJuego
	Definir dados Como Entero
	Definir CANTIDAD_DE_DADOS, i Como Entero
	CANTIDAD_DE_DADOS <- 5
	Dimension dados[CANTIDAD_DE_DADOS] 
	dados[0] <- 1
	dados[1] <- 2
	dados[2] <- 3
	dados[3] <- 4
	dados[4] <- 5
	mostrarDados(dados, CANTIDAD_DE_DADOS)
	
	Definir dadosQuePuedeTirar, eleccion Como Caracter
	Definir puntajeJugador, puntajeRonda, puntajeTirada Como Entero
	dadosQuePuedeTirar <- obtenerDadosQuePuedeVolverALanzar(dados, CANTIDAD_DE_DADOS, 1)
	puntajeJugador <-  0
	puntajeRonda <- 0
	
	puntajeRonda <- obtenerPuntaje(dados, CANTIDAD_DE_DADOS, esPrimeraTirada)
	Escribir "dados son ", Longitud(dadosQuePuedeTirar),": ", dadosQuePuedeTirar
	mostarDadosQuePuedeTirar(dadosQuePuedeTirar)
	Escribir "Desea volver a tirar esos dados (Y)? o Terminar la ronda (N)"
	Leer eleccion
	eleccion <- Mayusculas(eleccion)
	Si eleccion = "Y" Entonces
		Para i <- 0 Hasta Longitud(dadosQuePuedeTirar) Con Paso 1 Hacer
			dados[obtenerPosicionPorLetraDado(Subcadena(dadosQuePuedeTirar,i,i))] <- tirarDado()
		Fin Para
	SiNo
		
	FinSi
	
	
FinAlgoritmo



//Funciones reutilizadas-------------------------------------------------------------------------
SubAlgoritmo tirarTodosLosDados(dados, CANTIDAD_DE_DADOS)
	Definir i Como Entero
	Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		dados[i] <- tirarDado()
	Fin Para
Fin Funcion

Funcion resultado <- tirarDado
	resultado <- azar(6-1+1)+1
Fin Funcion

Funcion letra <- obtenerLetraDelDadoPorPosicion(posicion)
	Segun posicion Hacer
		0: letra<-"A"
		1: letra<-"B"
		2: letra<-"C"
		3: letra<-"D"
		4: letra<-"E"
		De Otro Modo: letra<-"POSICION INVALIDA"
	Fin Segun
Fin Funcion

Funcion posicion <- obtenerPosicionPorLetraDado(dadoLetra)
	Segun dadoLetra Hacer
		"A": posicion<-0
		"B": posicion<-1
		"C": posicion<-2
		"D": posicion<-3
		"E": posicion<-4
		De Otro Modo: posicion<--1
	Fin Segun
Fin Funcion


SubAlgoritmo mostrarDados(dados, CANTIDAD_DE_DADOS)
	Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		Escribir "Dado ", obtenerLetraDelDadoPorPosicion(i),": ",dados[i]
	Fin Para
FinSubAlgoritmo

Funcion resultado <- hayEscalera(dados, CANTIDAD_DE_DADOS,esPrimeraTirada)
	resultado <- 0
	definir i Como Entero
	definir hayNroUno, hayNroDos, hayNroTres, hayNroCuatro, hayNroCinco, hayNroSeis Como Entero
	hayNroUno <- 0
	hayNroDos <- 0
	hayNroTres <- 0
	hayNroCuatro <- 0
	hayNroCinco <- 0
	hayNroSeis <- 0
	
	si esPrimeraTirada = 1 Entonces
		Para i <- 0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
			Segun dados[i] Hacer
				1: hayNroUno <- 1
				2: hayNroDos <- 1
				3: hayNroTres <- 1
				4: hayNroCuatro <- 1
				5: hayNroCinco <- 1
				6: hayNroSeis <- 1
			Fin Segun
		Fin Para
		
		Si (hayNroUno = 1 y hayNroDos = 1 y hayNroTres = 1 y hayNroCuatro = 1 y hayNroCinco = 1) o (hayNroDos = 1 y hayNroTres = 1 y hayNroCuatro = 1 y hayNroCinco = 1 y hayNroSeis = 1) Entonces
			resultado <- 1
		FinSi
	FinSi
	
FinFuncion

Funcion esValido <- eleccionElegirDadoEsValida(eleccion, opcionesValidas)
	definir i como entero
	esValido <- 0
	eleccion <- Mayusculas(eleccion)
	i <- 0
	Repetir
		si eleccion = Subcadena(opcionesValidas,i,i) Entonces
			esValido <- 1
		FinSi
		i <- i + 1
	Hasta Que i >= Longitud(opcionesValidas) o esValido = 1
	
FinFuncion
//----------------------------------------------------------------------------------------------------------------

Funcion puntaje <- obtenerPuntaje(dados, CANTIDAD_DE_DADOS, esPrimeraTirada)
	puntaje <- 0
	definir auxPuntaje, i, PUNTAJE_ESCALERA Como Entero
	PUNTAJE_ESCALERA <- 800
	
	si  hayEscalera(dados, CANTIDAD_DE_DADOS, esPrimeraTirada) = 1 Entonces
		puntaje <- PUNTAJE_ESCALERA 
	SiNo
		i <- 1
		Mientras i <= 6 y puntaje >= 0 Hacer
			auxPuntaje <- obtenerPuntajePorNro(dados, CANTIDAD_DE_DADOS,i)
			si auxPuntaje >= 0 Entonces
				puntaje <- puntaje + auxPuntaje
			sino
				puntaje <- -1
			FinSi
			i <- i + 1
		Fin Mientras
	FinSi
FinFuncion


Funcion puntaje <- obtenerPuntajePorNro(dados, CANTIDAD_DE_DADOS, nro)
	definir auxCantidad como entero
	definir TRIPLE, PUNTAJE_TRIPLE_UNO, PUNTAJE_DADO_UNO, PUNTAJE_DADO_CINCO, MULTIPLICADOR_TRIPLE  como entero
	TRIPLE <- 3
	PUNTAJE_TRIPLE_UNO <- 1000
	MULTIPLICADOR_TRIPLE <- 100
	PUNTAJE_DADO_UNO <- 100
	PUNTAJE_DADO_CINCO <- 50
	auxCantidad <- 0
	puntaje <- 0
	auxCantidad <- obtenerCantidaDeDadosCoincidentesANro(dados,CANTIDAD_DE_DADOS,nro)
	Segun nro Hacer
		1:  
			si auxCantidad >= TRIPLE Entonces
				puntaje <- PUNTAJE_TRIPLE_UNO + (auxCantidad-TRIPLE) * PUNTAJE_DADO_UNO
			SiNo
				puntaje <- auxCantidad * PUNTAJE_DADO_UNO
			FinSi
		5: 
			si auxCantidad >= TRIPLE Entonces
				puntaje <- MULTIPLICADOR_TRIPLE * nro + (auxCantidad-TRIPLE) * PUNTAJE_DADO_CINCO
			SiNo
				puntaje <- auxCantidad * PUNTAJE_DADO_CINCO
			FinSi
			
		2,3,4,6:
			si auxCantidad >= TRIPLE Entonces
				puntaje <- MULTIPLICADOR_TRIPLE * nro
			FinSi
		De Otro Modo: puntaje <- -1
	Fin Segun
	
FinFuncion

Funcion cantidad <- obtenerCantidaDeDadosCoincidentesANro(dados, CANTIDAD_DE_DADOS, nro)
	cantidad <- 0
	si nro < 1 o nro > 6 Entonces
		cantidad <- -1
	SiNo
		Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
			si dados[i] = nro Entonces
				cantidad <- cantidad + 1
			FinSi
		Fin Para
	FinSi
FinFuncion

//No puede volver a lanzar los dados que hacen puntaje (los triples) o 1 o 5
//Si todos los dados hacen puntaje, puede volver a lanzar todos los dados (Escalera servida, 1,1,1,1,1 o 3,3,3,1,5)
//Ejemplo con 3,3,3,4,6, deberia devolver el dado 4 y 6 para volver a lanzar
Funcion resultado <- obtenerDadosQuePuedeVolverALanzar(dados, CANTIDAD_DE_DADOS, esPrimeraTirada)
	definir i Como Entero
	definir dadosQueNoPuedeTirar Como Caracter
	resultado <- ""
	dadosQueNoPuedeTirar <- ""
	
	si hayEscalera(dados, CANTIDAD_DE_DADOS, esPrimeraTirada) = 1 Entonces
		resultado <- "ABCDE"
	SiNo
		//Busco triples y unos y cincos
		dadosQueNoPuedeTirar <- obtenerDadosTriples_2_3_4_6(dados, CANTIDAD_DE_DADOS)
		dadosQueNoPuedeTirar <- dadosQueNoPuedeTirar + obtenerDadosUnosYCincos(dados, CANTIDAD_DE_DADOS)
		resultado <- ObtenerDadosFaltantes(dadosQueNoPuedeTirar)
	FinSi
FinFuncion

//No verificamos 1 y 5 porque esos no puede volver a tirarlos
Funcion  resultado <- obtenerDadosTriples_2_3_4_6(dados, CANTIDAD_DE_DADOS)
	definir nro, hayTriple, auxCantidad Como Entero
	nro <- 1
	hayTriple <- 0
	resultado <- ""
	
	Mientras hayTriple = 0 y nro <= 6 Hacer
		Si nro <> 1 o nro <> 5 Entonces
			resultado <- resultado + obtenerDadosTriplesDeUnNro(dados, CANTIDAD_DE_DADOS,nro)
		FinSi
		nro <- nro + 1
	Fin Mientras
FinFuncion

Funcion  resultado <- obtenerDadosTriplesDeUnNro(dados, CANTIDAD_DE_DADOS,nro)
	definir i, hayTriple, cantidad Como Entero
	resultado <- ""
	
	cantidad <- obtenerCantidaDeDadosCoincidentesANro(dados,CANTIDAD_DE_DADOS,nro)
	si cantidad >= 3 Entonces
		Para i<-0 Hasta CANTIDAD_DE_DADOS-1 Con Paso 1 Hacer
			si dados[i] = nro Entonces
				resultado <- resultado + obtenerLetraDelDadoPorPosicion(i)
			FinSi
		Fin Para
	FinSi
FinFuncion

Funcion resultado <- obtenerDadosUnosYCincos(dados, CANTIDAD_DE_DADOS)
	definir i Como Entero
	resultado <- ""
	Para i <- 0 Hasta CANTIDAD_DE_DADOS-1 Con Paso 1 Hacer
		si dados[i] = 1 o dados[i] = 5 Entonces
			resultado <- resultado + obtenerLetraDelDadoPorPosicion(i)
		FinSi
	Fin Para	
FinFuncion


Funcion resultado <- obtenerDadosFaltantes(dadosQueNoPuedeTirar)
	definir DADOS_OPCIONES, dadoActualOpc, dadoActualNoPuedeTirar Como Caracter
	definir i,j, puedeUsarDado como entero
	DADOS_OPCIONES <- "ABCDE"
	resultado <- ""
	i <- 0
	Para i <- 0 Hasta Longitud(DADOS_OPCIONES) - 1 Con Paso 1 Hacer
		j <- 0
		puedeUsarDado <- 1
		dadoActualOpc <- Subcadena(DADOS_OPCIONES,i,i)
		Mientras j < Longitud(dadosQueNoPuedeTirar) y puedeUsarDado = 1 Hacer
			dadoActualNoPuedeTirar <- Subcadena(dadosQueNoPuedeTirar,j,j)
			si dadoActualOpc = dadoActualNoPuedeTirar Entonces
				puedeUsarDado <- 0
			FinSi
			j <- j + 1
		Fin Mientras
		si puedeUsarDado = 1 Entonces
			resultado <- resultado + dadoActualOpc
		FinSi
	Fin Para
FinFuncion

SubAlgoritmo mostarDadosQuePuedeTirar(dadosQuePuedeTirar)
	definir mensaje Como Caracter
	
	si Longitud(dadosQuePuedeTirar) > 0 Entonces
		mensaje <- "Los dados que puede volver a lanzar son: "
		Para i <- 0 Hasta Longitud(dadosQuePuedeTirar) - 1 Con Paso 1 Hacer
			si i = 0 Entonces
				mensaje <- mensaje + " " + Subcadena(dadosQuePuedeTirar,i,i)
			SiNo
				mensaje <- mensaje + ", " + Subcadena(dadosQuePuedeTirar,i,i)
			FinSi
		FinPara
		Escribir mensaje
	FinSi
FinSubAlgoritmo


SubAlgoritmo puedeTirarDado(dadoEleccion)
	definir mensaje Como Caracter
	
	si Longitud(dadosQuePuedeTirar) > 0 Entonces
		mensaje <- "Los dados que puede volver a lanzar son: "
		Para i <- 0 Hasta Longitud(dadosQuePuedeTirar) - 1 Con Paso 1 Hacer
			si i = 0 Entonces
				mensaje <- mensaje + " " + Subcadena(dadosQuePuedeTirar,i,i)
			SiNo
				mensaje <- mensaje + ", " + Subcadena(dadosQuePuedeTirar,i,i)
			FinSi
		FinPara
		Escribir mensaje
	FinSi
FinSubAlgoritmo

