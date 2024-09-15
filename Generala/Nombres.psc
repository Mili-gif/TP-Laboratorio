
Algoritmo tpLaboratorioGenerala
	//Reglas Generala
	//Escalera: 1-2-3-4 y 5 ; 2-3-4-5 y 6 ó 3-4-5-6 y 1, el 1 se puede colocar después del 6.
	//Full: 3 dados del mismo número y 2 iguales de otro.
	//Poker: 4 dados iguales (ver: "Del Poker"en Generala Real)
	//Generala: 5 dados iguales.
	//Doble Generala: igual a la anterior (es optativa).
	//Definir dadoA,dadoB, dadoC, dadoD, dadoE como Entero
	Definir dados,CANTIDAD_DE_DADOS como Entero
	CANTIDAD_DE_DADOS <- 5
	Definir DADO_A,DADO_B,DADO_C,DADO_D,DADO_E, OPC_DEJAR_DE_ELEGIR, auxContinuarSiguienteTurno Como Caracter
	DADO_A <- "A"
	DADO_B <- "B"
	DADO_C <- "C"
	DADO_D <- "D"
	DADO_E <- "E"
	OPC_DEJAR_DE_ELEGIR<- "X"
	
	Definir CANTIDAD_TIPOS_PUNTAJES, CANTIDAD_RONDAS, cantidadDeJugadores, nroJugador, proximoNroJugador, nroRonda  como Entero
	CANTIDAD_TIPOS_PUNTAJES <- 10
	CANTIDAD_RONDAS <- 2
	cantidadDeJugadores <- 2
	nroJugador <- 1
	nroRonda <- 1
	
	Definir fila, columna como Entero
	Definir tablaDePuntajes como Entero
	
	Dimension tablaDePuntajes[CANTIDAD_TIPOS_PUNTAJES,cantidadDeJugadores]
	inicializarTablaDePuntajes(tablaDePuntajes, CANTIDAD_TIPOS_PUNTAJES, cantidadDeJugadores)
	//Fila 0 para puntos de con el dado 1
	//Fila 1 para puntos de con el dado 2
	//Fila 2 para puntos de con el dado 3
	//Fila 3 para puntos de con el dado 4
	//Fila 4 para puntos de con el dado 5
	//Fila 5 para puntos de con el dado 6
	//Fila 6 para puntos de Escalera
	//Fila 7 para puntos de Full
	//Fila 8 para puntos de Poker
	//Fila 9 para puntos de Generala
	
	
	Dimension dados[5] 
	
	//dados[0] <- 1
	//dados[1] <- 2
	//dados[2] <- 3
	//dados[3] <- 4
	//dados[4] <- 5
	//mostrarDados(dados, CANTIDAD_DE_DADOS)	
	//mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,1) 
	
	Definir nombresJugadores, nombreJugador Como Caracter 
	Dimension nombresJugadores[cantidadDeJugadores]
	
	Para nroJugador <- 1 Hasta cantidadDeJugadores Con Paso 1 Hacer
		Escribir "Ingrese el nombre del jugador ", nroJugador
		Leer nombreJugador
		nombresJugadores[nroJugador-1] <- nombreJugador
	Fin Para
	
	nroJugador <- 1
	
	//Definicion de variables
	
	
	
	
	Mientras nroRonda <= CANTIDAD_RONDAS Hacer
		Mientras nroJugador <= cantidadDeJugadores Hacer
			Escribir "Turno del jugador ", nroJugador, ": ", nombresJugadores[nroJugador-1]
			
			//------------------------------------------------------------------------------------------------------------------------------------------------------
			//Comienzo de Turno, se tiran todos los dados
			tirarTodosLosDados(dados,CANTIDAD_DE_DADOS)
			Escribir "Los resultados que salieron en cada dado fueron: "
			mostrarDados(dados, CANTIDAD_DE_DADOS)
			
			//------------------------------------------------------------------------------------------------------------------------------------------------------
			//Comienzo de la fase de "Eleccion de dados para volver a tirar"
			//El usuario puede seleccionar los dados (ABCDE) que quiera volver a tirar (que pasa si vuelve a elegir un dado que ya elegió?)
			//En caso de que quiera dejar de seleccionar los dados elije X y los dados que elegio se tiran
			//Si no elegió ningun dado ó se terminaron sus tiradas dispobibles, se va a la fase de elegir puntuacion
			comenzarFaseTiradaDeDados(dados, CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador)
			//Fin de la fase de "Eleccion de dados para volver a tirar"
			//------------------------------------------------------------------------------------------------------------------------------------------------------
			//Comienzo  de la fase de buscar , mostrar puntajes y anotar puntaje 			
			comenzarFaseBuscarYMostrarPuntajesYAnotarPuntaje(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador)
			Borrar Pantalla
			mostrarTablaPuntaje(tablaDePuntajes, CANTIDAD_TIPOS_PUNTAJES ,cantidadDeJugadores)
			Escribir "Fin del turno"
			nroJugador <- nroJugador + 1
			escribirSeparador()
			
			Si nroJugador > cantidadDeJugadores Entonces
				proximoNroJugador <- 1
			sino 
				proximoNroJugador <- nroJugador 
			FinSi
			Escribir "Pulse cualquier tecla para continuar con el turno del jugador " + nombresJugadores[proximoNroJugador-1]
			Leer auxContinuarSiguienteTurno
			
		Fin Mientras
		nroJugador <- 1 
		nroRonda <- nroRonda + 1
	Fin Mientras
	
	
FinAlgoritmo



































SubAlgoritmo inicializarTablaDePuntajes(tablaDePuntajes, CANTIDAD_TIPOS_PUNTAJES ,nroDeJugadores)
	Definir c,f Como Entero //(c de columnas y f de filas)
	Para f<-0 Hasta CANTIDAD_TIPOS_PUNTAJES-1 Con Paso 1 Hacer
		Para c<-0 Hasta nroDeJugadores-1 Con Paso 1 Hacer
			tablaDePuntajes[f,c]<- -1
		Fin Para
	Fin Para
FinSubAlgoritmo


Funcion resultado <- tirarDado
	resultado <- azar(6-1+1)+1
Fin Funcion


SubAlgoritmo mostrarDados(dados, CANTIDAD_DE_DADOS)
	Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		Escribir "Dado ", obtenerLetraDelDadoPorPosicion(i),": ",dados[i]
	Fin Para
FinSubAlgoritmo



SubAlgoritmo tirarTodosLosDados(dados, CANTIDAD_DE_DADOS)
	definir i Como Entero
	Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		dados[i] <- tirarDado()
	Fin Para
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

//-----------------------------------------------------------------------------------------------
//Funciones para la fase de eleccion de tiradas de dados
Funcion esValido <- eleccionElegirDadoEsValida(eleccion)
	definir opcionesValidas Como Caracter
	definir i como entero
	esValido <- 0
	opcionesValidas <- "ABCDEX"
	eleccion <- Mayusculas(eleccion)
	i <- 0
	Repetir
		si eleccion = Subcadena(opcionesValidas,i,i) Entonces
			esValido <- 1
		FinSi
		i <- i + 1
	Hasta Que i >= Longitud(opcionesValidas) o esValido = 1
	
FinFuncion


SubAlgoritmo tirarDadosConEleccion(dados , dadosElegidos)
	definir i Como Entero
	i <- 0
	definir eleccion Como Caracter
	
	Repetir
		eleccion <- Subcadena(dadosElegidos,i,i)
		si eleccion <> "X" Entonces
			dados[obtenerPosicionPorLetraDado(eleccion)] <- tirarDado()
		FinSi
		i <- i+1
	Hasta Que i >= Longitud(dadosElegidos) o eleccion = "X"
	
Fin Funcion

//-----------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------
//Funciones para ver buscar puntajes
Funcion resultado <- hayEscalera(dados, CANTIDAD_DE_DADOS)
	resultado <- 0
	definir i Como Entero
	definir hayNroUno, hayNroDos, hayNroTres, hayNroCuatro, hayNroCinco, hayNroSeis Como Entero
	hayNroUno <- 0
	hayNroDos <- 0
	hayNroTres <- 0
	hayNroCuatro <- 0
	hayNroCinco <- 0
	hayNroSeis <- 0
	
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
FinFuncion

Funcion resultado <- hayPoker(dados, CANTIDAD_DE_DADOS)
	resultado <- 0
	definir i Como Entero
	definir contadorUno, contadorDos, contadorTres, contadorCuatro, contadorCinco, contadorSeis Como Entero
	contadorUno <- 0
	contadorDos <- 0
	contadorTres <- 0
	contadorCuatro <- 0
	contadorCinco <- 0
	contadorSeis <- 0
	
	
	Para i <- 0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		Segun dados[i] Hacer
			1: contadorUno <- contadorUno + 1
			2: contadorDos <- contadorDos + 1
			3: contadorTres <- contadorTres + 1
			4: contadorCuatro <- contadorCuatro + 1
			5: contadorCinco <- contadorCinco + 1
			6: contadorSeis <- contadorSeis + 1
		Fin Segun
	Fin Para
	
	si contadorUno >= 4 o contadorDos >= 4 o contadorTres >= 4 o contadorCuatro >= 4 o contadorCinco >= 4
		resultado <- 1
	FinSi
	
FinFuncion

Funcion resultado <- hayFull (dados, CANTIDAD_DE_DADOS)
    definir cont1, cont2, flag, num1, num2, flag2 Como Entero
    flag2<-0
    num2<-0
    flag<-0
    cont1<-0
    cont2<-0
    Para i<-0 Hasta CANTIDAD_DE_DADOS-1 Con Paso 1 Hacer
        si flag=0 Entonces
            num1<-dados[i]
            flag<-1
        FinSi
        si dados[i] = num1 Entonces
            cont1 <- cont1 +1
        FinSi
        si flag2=0 entonces
            si dados[i]<>num1 entonces
                num2<-dados[i]
                flag2<-1
            finsi
        FinSi
        si dados[i] = num2 Entonces
            cont2 <- cont2 +1
        FinSi
    Fin Para
    si cont1 = 2 y cont2 = 3 o cont1=3 y cont2=2 Entonces
        resultado<- 1
    SiNo
        resultado<- 0
    FinSi
Fin Funcion

Funcion resultado <- hayGenerala(dados)
	resultado <- 0
	si(dados[0]=dados[1] Y dados[0]=dados[2] Y dados[0]=dados[3] Y dados[0]=dados[4] Y dados[0]=dados[5]) Entonces
		resultado <- 1
	FinSi
	
FinFuncion

subalgoritmo mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador, esDuranteTirada) 
	definir puedeUnoPuntaje, puedeDosPuntaje, puedeTresPuntaje, puedeCuatroPuntaje, puedeCincoPuntaje, puedeSeisPuntaje, resultadoEscalera, resultadoFull, resultadoPoker, resultadoGenerala  Como Entero
	definir aux  Como Entero
	definir auxMensaje, puntajeMsj , tipoPuntaje Como Caracter
	
	puedeUnoPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"1", tablaDePuntajes,nroJugador,esDuranteTirada )
	puedeDosPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"2", tablaDePuntajes,nroJugador,esDuranteTirada )
	puedeTresPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"3", tablaDePuntajes,nroJugador,esDuranteTirada )
	puedeCuatroPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"4", tablaDePuntajes,nroJugador,esDuranteTirada )
	puedeCincoPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"5", tablaDePuntajes,nroJugador,esDuranteTirada )
	puedeSeisPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"6", tablaDePuntajes,nroJugador,esDuranteTirada )
	resultadoEscalera <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"E", tablaDePuntajes,nroJugador,esDuranteTirada )
	resultadoFull <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"F", tablaDePuntajes,nroJugador,esDuranteTirada )
	resultadoPoker <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"P", tablaDePuntajes,nroJugador,esDuranteTirada )
	resultadoGenerala <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"G", tablaDePuntajes,nroJugador,esDuranteTirada )
	
	aux <- puedeUnoPuntaje + puedeDosPuntaje + puedeTresPuntaje + puedeCuatroPuntaje + puedeCincoPuntaje + puedeSeisPuntaje + resultadoEscalera + resultadoFull + resultadoPoker + resultadoGenerala
	si aux > 0 Entonces
		//Escribir  "Posibles Jugadas disponibles: "
		si puedeUnoPuntaje = 1 Entonces 
			auxMensaje <- "Puntos con 1 (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"1")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "1 - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si puedeDosPuntaje = 1 Entonces 
			auxMensaje <- "Puntos con 2 (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"2")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "2 - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si puedeTresPuntaje = 1 Entonces 
			auxMensaje <- "Puntos con 3 (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"3")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "3 - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si puedeCuatroPuntaje = 1 Entonces 
			auxMensaje <- "Puntos con 4 (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"4")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "4 - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si puedeCincoPuntaje = 1 Entonces 
			auxMensaje <- "Puntos con 5 (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"5")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "5 - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si puedeSeisPuntaje = 1 Entonces 
			auxMensaje <- "Puntos con 6 (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"6")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "6 - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si resultadoEscalera = 1 Entonces 
			
			auxMensaje <- "Escalera (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"E")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "E - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si resultadoFull = 1 Entonces 
			auxMensaje <- "Full (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"F")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "F - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si resultadoPoker = 1 Entonces 
			auxMensaje <- "Poker (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"P")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "P - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		si resultadoGenerala = 1 Entonces 
			auxMensaje <- "Generala (" + ConvertirATexto(obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"G")) + ")"  
			si(esDuranteTirada = 0) Entonces
				auxMensaje  <- "G - " + auxMensaje
			FinSi
			Escribir auxMensaje
			auxMensaje <- ""
		FinSi
		
	SiNo
		Escribir  "No hay jugadas disponibles "
	FinSi
	Escribir ""
	
FinSubAlgoritmo




Funcion resultado <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,tipoPuntaje, tablaDePuntajes,nroJugador,esDuranteTiradas)
	definir yaTienePuntaje, indicePuntaje, tipoPuntajePuedeAnotar como entero
	yaTienePuntaje <- 0
	tipoPuntajePuedeAnotar <- 0
	indicePuntaje <- obtenerPosicionDeLaTablaDePuntajes(tipoPuntaje)
	si indicePuntaje <> -1 y tablaDePuntajes[indicePuntaje,nroJugador-1] = -1 Entonces
		Segun tipoPuntaje Hacer
			"1": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,1)
			"2": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,2)
			"3": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,3)
			"4": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,4)
			"5": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,5)
			"6": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,6)
			"E": tipoPuntajePuedeAnotar <- hayEscalera(dados,CANTIDAD_DE_DADOS)
			"F": tipoPuntajePuedeAnotar <- hayFull(dados,CANTIDAD_DE_DADOS)
			"P": tipoPuntajePuedeAnotar <- hayPoker(dados,CANTIDAD_DE_DADOS)
			"G": tipoPuntajePuedeAnotar <- hayGenerala(dados)
			De Otro Modo: tipoPuntajePuedeAnotar <- 0
		Fin Segun
	SiNo
		yaTienePuntaje <- 1
	FinSi
	
	si esDuranteTiradas = 1 Entonces
		si yaTienePuntaje = 1 o tipoPuntajePuedeAnotar = 0
			resultado <- 0
		sino
			resultado <- 1
		FinSi
	SiNo
		si yaTienePuntaje = 1 
			resultado <- 0
		sino
			resultado <- 1
		FinSi
	FinSi
	
	
FinFuncion

funcion resultado <- existeNro(dados,CANTIDAD_DE_DADOS,nro)
	definir i Como Entero
	i <- 0
	resultado <- 0
	Mientras i <= CANTIDAD_DE_DADOS - 1 y resultado = 0 Hacer
		si dados[i] = nro Entonces
			resultado <- 1
		FinSi
		i <- i + 1
	Fin Mientras
	
FinFuncion



//Esta funcion debe usarse despues validar que la opcionElegida sea valida
Funcion puntaje  <-  obtenerPuntaje(dados,CANTIDAD_DE_DADOS,opcionElegida)
	definir i Como Entero
	puntaje <- 0
	Segun opcionElegida Hacer
		"1","2","3","4","5","6":
			definir nro como entero
			nro <- ConvertirANumero(opcionElegida)
			Para i <- 0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
				si dados[i] = nro Entonces
					puntaje <- puntaje + nro
				FinSi
			Fin Para
		"E": 
			si hayEscalera(dados, CANTIDAD_DE_DADOS) = 1 Entonces
				puntaje <- 20
			sino 
				puntaje <- 0
			FinSi
		"F": 
			si hayFull(dados, CANTIDAD_DE_DADOS) = 1 Entonces
				puntaje <- 30
			sino 
				puntaje <- 0
			FinSi
		"P":
			si hayPoker(dados, CANTIDAD_DE_DADOS) = 1 Entonces
				puntaje <- 40
			sino 
				puntaje <- 0
			FinSi
		"G":
			si hayGenerala(dados) = 1 Entonces
				puntaje <- 50
			sino 
				puntaje <- 0
			FinSi
		De Otro Modo:
			puntaje <- -1
	Fin Segun
FinFuncion



Funcion indice <- obtenerPosicionDeLaTablaDePuntajes(opcionElegida)
	opcionElegida <- Mayusculas(opcionElegida)
	Segun opcionElegida Hacer
		"1": indice<- 0
		"2": indice<- 1
		"3": indice<- 2
		"4": indice<- 3
		"5": indice<- 4
		"6": indice<- 5
		"E": indice<- 6
		"F": indice<- 7
		"P": indice<- 8
		"G": indice<- 9
		De Otro Modo: indice<- -1
	FinSegun
FinFuncion

SubAlgoritmo escribirSeparador
	Escribir "----------------------------------------------------------------------------"
FinSubAlgoritmo

SubAlgoritmo mostrarTablaPuntaje(tablaDePuntajes, cantDePuntajes ,nroDeJugadores)
	definir i,j, puntaje, cont Como Entero
	definir valorPuntaje, aux, filaTexto Como Caracter
	Dimension etiquetasDePuntajes[cantDePuntajes]
	etiquetasDePuntajes[0] <- "   1       "
	etiquetasDePuntajes[1] <- "   2       "
	etiquetasDePuntajes[2] <- "   3       "
	etiquetasDePuntajes[3] <- "   4       "
	etiquetasDePuntajes[4] <- "   5       "
	etiquetasDePuntajes[5] <- "   6       "
	etiquetasDePuntajes[6] <- "Escalera   "
	etiquetasDePuntajes[7] <- " Full      "
	etiquetasDePuntajes[8] <- " Poker     "
	etiquetasDePuntajes[9] <- "Generala   "
	
	Para i <- 0 Hasta cantDePuntajes-1 Con Paso 1 Hacer
		filaTexto <- ""
		aux <- " "
		filaTexto <- Concatenar(filaTexto, etiquetasDePuntajes[i])
		Para j <- 0 Hasta nroDeJugadores-1 Con Paso 1 Hacer
			puntaje <- tablaDePuntajes[i,j]
			si puntaje = -1 Entonces
				valorPuntaje <- "-"
			SiNo
				valorPuntaje <- ConvertirATexto(puntaje)
			FinSi
			aux <- Concatenar(aux,valorPuntaje) 
			aux <- Concatenar(aux," ") 
			
		Fin Para
		Escribir Concatenar(filaTexto, aux)
	Fin Para
	
FinSubAlgoritmo

SubAlgoritmo comenzarFaseTiradaDeDados(dados, CANTIDAD_DE_DADOS, tablaDePuntajes, nroJugador )
	Definir eleccionValida, esFaseDeTiradas, contadorTiradas Como Entero
	Definir elecciones, eleccion Como Caracter
	esFaseDeTiradas <- 1
	contadorTiradas <- 1
	
	Repetir
		eleccionValida <- 0
		elecciones<-""
		Escribir ""
		Escribir "Jugadas con puntajes"
		mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador,1)
		Repetir //Para validar si la eleccion es valida
			 
			Escribir "Elija los dados que quiera volver a tirar."
			Escribir "En caso de no querer elegir dados ingrese X."
			Leer eleccion
			eleccion <- Mayusculas(eleccion);
			eleccionValida <- eleccionElegirDadoEsValida(eleccion)
			
			si eleccionValida = 1 Entonces
				elecciones <- Concatenar(elecciones,eleccion)
			SiNo
				Escribir "Opción invalida. Por favor ingresela nuevamente"
				Escribir ""
			FinSi
			
		Hasta Que eleccion = "X"
		
		tirarDadosConEleccion(dados , elecciones)
		mostrarDados(dados,CANTIDAD_DE_DADOS)		
		si elecciones = "X" o contadorTiradas >= 2 Entonces
			//Borrar Pantalla	
			esFaseDeTiradas <- 0
		FinSi
		contadorTiradas <- contadorTiradas + 1
		
	Hasta Que esFaseDeTiradas = 0
	escribirSeparador()
FinSubAlgoritmo


//fase de buscar puntajes y mostrar puntajes
SubAlgoritmo comenzarFaseBuscarYMostrarPuntajesYAnotarPuntaje(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador)
	Definir tipoPuntajeElegido Como Caracter
	Definir  tipoPuntajeElegidoEsValido  Como Entero
	Repetir
		Escribir  "Posibles Jugadas disponibles: "
		mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador,0) 
		Leer tipoPuntajeElegido
		tipoPuntajeElegido <- Mayusculas(tipoPuntajeElegido)
		tipoPuntajeElegidoEsValido <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,tipoPuntajeElegido, tablaDePuntajes,nroJugador,0)
		si tipoPuntajeElegidoEsValido = 0 Entonces
			Escribir "Opción no valida, vuelva a elegir"
			Escribir ""
		FinSi
	Hasta Que  tipoPuntajeElegidoEsValido = 1
	
	//------------------------------------------------------------------------------------------------------------------------------------------------------	
	//Anotacion del puntaje elegido
	Definir indiceTipoPuntaje, puntaje como entero
	indiceTipoPuntaje <- obtenerPosicionDeLaTablaDePuntajes(tipoPuntajeElegido)
	puntaje <- obtenerPuntaje(dados,CANTIDAD_DE_DADOS,tipoPuntajeElegido)
	tablaDePuntajes[indiceTipoPuntaje,nroJugador-1] <- puntaje
FinSubAlgoritmo
