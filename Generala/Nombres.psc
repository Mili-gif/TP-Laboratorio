
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
	Definir DADO_A,DADO_B,DADO_C,DADO_D,DADO_E, OPC_DEJAR_DE_ELEGIR Como Caracter
	DADO_A <- "A"
	DADO_B <- "B"
	DADO_C <- "C"
	DADO_D <- "D"
	DADO_E <- "E"
	OPC_DEJAR_DE_ELEGIR<- "X"
	
	Definir CANTIDAD_TIPOS_PUNTAJES, cantidadDeJugadores como Entero
	CANTIDAD_TIPOS_PUNTAJES <- 10
	cantidadDeJugadores <- 2
	
	Definir jugador1, jugador2,eleccion Como Caracter
	Definir fila, columna como Entero
	Definir tablaDePuntajes, contadorTiradas como Entero
	
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
	
	//dados[0] <- 5
	//dados[1] <- 5
	//dados[2] <- 6
	//dados[3] <- 4
	//dados[4] <- 5
	//mostrarDados(dados, CANTIDAD_DE_DADOS)
	//mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,1) 
	
	Escribir "Ingrese el nombre del primer jugador"
	Leer jugador1
	Escribir "Ingrese el nombre del segundo jugador"
	Leer jugador2
	
	Definir nroJugador Como Entero
	nroJugador <- 1
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
	Definir eleccionValida, esFaseDeTiradas Como Entero
	Definir elecciones Como Caracter
	esFaseDeTiradas <- 1
	contadorTiradas <- 1
	
	Repetir
		eleccionValida <- 0
		elecciones<-""
		Repetir //Para validar si la eleccion es valida
			//mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador) 
			Escribir "Elija los dados que quiera volver a tirar."
			Escribir "En caso de no querer elegir dados ingrese X."
			Leer eleccion
			eleccion <- Mayusculas(eleccion);
			eleccionValida <- eleccionElegirDadoEsValida(eleccion)
			
			si eleccionValida = 1 Entonces
				elecciones <- Concatenar(elecciones,eleccion)
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
	//Fin de la fase de "Eleccion de dados para volver a tirar"
	//------------------------------------------------------------------------------------------------------------------------------------------------------
	//Comienzo  de la fase de buscar puntajes y mostrar puntajes
	Definir tipoPuntajeElegido Como Caracter
	Definir  tipoPuntajeElegidoEsValido  Como Entero
	
	
	Repetir
		mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador) 
		Leer tipoPuntajeElegido
		tipoPuntajeElegidoEsValido <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,tipoPuntajeElegido, tablaDePuntajes,nroJugador)
		si tipoPuntajeElegidoEsValido = 0 Entonces
			Escribir "Opción no valida, vuelva a elegir"
			Escribir ""
		FinSi
	Hasta Que  tipoPuntajeElegidoEsValido = 1
	
	//------------------------------------------------------------------------------------------------------------------------------------------------------	
	// Se anota el puntaje
	Definir indiceTipoPuntaje, puntaje como entero
	indiceTipoPuntaje <- obtenerPosicionDeLaTablaDePuntajes(tipoPuntajeElegido)
	puntaje <- obtenerPuntaje(dados,CANTIDAD_DE_DADOS,tipoPuntajeElegido)
	tablaDePuntajes[indiceTipoPuntaje,nroJugador-1] <- puntaje
	mostrarTablaPuntaje(tablaDePuntajes, CANTIDAD_TIPOS_PUNTAJES ,cantidadDeJugadores)
	Escribir "Fin del turno"
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
	definir numeroUno, numeroDos, numeroTres, numeroCuatro, numeroCinco, numeroSeis Como Entero
	numeroUno <- 0
	numeroDos <- 0
	numeroTres <- 0
	numeroCuatro <- 0
	numeroCinco <- 0
	numeroSeis <- 0
	
	
	Para i <- 0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		Segun dados[i] Hacer
			1: numeroUno <- 1
			2: numeroDos <- 1
			3: numeroTres <- 1
			4: numeroCuatro <- 1
			5: numeroCinco <- 1
			6: numeroSeis <- 1
		Fin Segun
	Fin Para
	
	si(numeroUno = numeroDos Y numeroUno = numeroTres Y numeroUno = numeroCuatro) O (numeroDos = numeroTres Y numeroDos = numeroCuatro Y numeroDos = numeroCinco) O (numeroUno = numeroTres Y numeroUno = numeroCuatro Y numeroUno = numeroCinco) O (numeroUno = numeroDos Y numeroUno = numeroTres Y numeroUno = numeroCinco) O (numeroUno = numeroDos Y numeroUno = numeroCuatro Y numeroUno = numeroCinco) Entonces
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

subalgoritmo mostrarOpcionesDePuntajes(dados,CANTIDAD_DE_DADOS, tablaDePuntajes,nroJugador) 
	definir puedeUnoPuntaje, puedeDosPuntaje, puedeTresPuntaje, puedeCuatroPuntaje, puedeCincoPuntaje, puedeSeisPuntaje, resultadoEscalera, resultadoFull, resultadoPoker, resultadoGenerala  Como Entero
	definir aux  Como Entero
	puedeUnoPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"1", tablaDePuntajes,nroJugador)
	puedeDosPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"2", tablaDePuntajes,nroJugador)
	puedeTresPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"3", tablaDePuntajes,nroJugador)
	puedeCuatroPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"4", tablaDePuntajes,nroJugador)
	puedeCincoPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"5", tablaDePuntajes,nroJugador)
	puedeSeisPuntaje <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"6", tablaDePuntajes,nroJugador)
	resultadoEscalera <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"E", tablaDePuntajes,nroJugador)
	resultadoFull <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"F", tablaDePuntajes,nroJugador)
	resultadoPoker <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"P", tablaDePuntajes,nroJugador)
	resultadoGenerala <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,"G", tablaDePuntajes,nroJugador)
	
	aux <- puedeUnoPuntaje + puedeDosPuntaje + puedeTresPuntaje + puedeCuatroPuntaje + puedeCincoPuntaje + puedeSeisPuntaje + resultadoEscalera + resultadoFull + resultadoPoker + resultadoGenerala
	Escribir ""
	si aux > 0 Entonces
		Escribir  "Posibles Jugadas disponibles: "
		si puedeUnoPuntaje = 1 Entonces 
			Escribir "1 - Puntos con 1 (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"1"),")"  
		FinSi
		si puedeDosPuntaje = 1 Entonces 
			Escribir "2 - Puntos con 2 (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"2"),")"  
		FinSi
		si puedeTresPuntaje = 1 Entonces 
			Escribir "3 - Puntos con 3 (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"3"),")"  
		FinSi
		si puedeCuatroPuntaje = 1 Entonces 
			Escribir "4 - Puntos con 4 (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"4"),")"  
		FinSi
		si puedeCincoPuntaje = 1 Entonces 
			Escribir "5 - Puntos con 5 (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"5"),")"  
		FinSi
		si puedeSeisPuntaje = 1 Entonces 
			Escribir "6 - Puntos con 6 (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"6"),")"  
		FinSi
		si resultadoEscalera = 1 Entonces 
			Escribir "E - Escalera (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"E"),")"  
		FinSi
		si resultadoFull = 1 Entonces 
			Escribir "F - Full (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"F"),")"  
		FinSi
		si resultadoPoker = 1 Entonces 
			Escribir "P - Poker (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"P"),")"  
		FinSi
		si resultadoGenerala = 1 Entonces 
			Escribir "G - Generala (",obtenerPuntaje(dados,CANTIDAD_DE_DADOS,"G"),")"  
		FinSi
		
	SiNo
		Escribir  "No hay jugadas disponibles "
	FinSi
	Escribir ""
	
FinSubAlgoritmo

Funcion resultado <- puedeAnotarPuntaje(dados,CANTIDAD_DE_DADOS,tipoPuntaje, tablaDePuntajes,nroJugador)
	definir yaTienePuntaje, indicePuntaje, tipoPuntajePuedeAnotar como entero
	yaTienePuntaje <- 0
	tipoPuntajePuedeAnotar <- 0
	indicePuntaje <- obtenerPosicionDeLaTablaDePuntajes(tipoPuntaje)
	si tablaDePuntajes[indicePuntaje,nroJugador-1] = -1 Entonces
		Segun tipoPuntaje Hacer
			"1": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,1)
			"2": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,2)
			"3": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,3)
			"4": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,4)
			"5": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,5)
			"6": tipoPuntajePuedeAnotar <- existeNro(dados,CANTIDAD_DE_DADOS,6)
			"E": tipoPuntajePuedeAnotar <- hayEscalera(dados,CANTIDAD_DE_DADOS)
			"F": tipoPuntajePuedeAnotar <- hayFull(dados,CANTIDAD_DE_DADOS)
			"P": tipoPuntajePuedeAnotar <- 0//hayPoker(dados,CANTIDAD_DE_DADOS)
			"G": tipoPuntajePuedeAnotar <- 0//hayPoker(dados,CANTIDAD_DE_DADOS)
			De Otro Modo: tipoPuntajePuedeAnotar <- 0
		Fin Segun
	SiNo
		yaTienePuntaje <- 1
	FinSi
	
	si yaTienePuntaje = 1 o tipoPuntajePuedeAnotar = 0
		resultado <- 0
	sino
		resultado <- 1
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
		"E": puntaje <- 20
		"F": puntaje <- 30
		"P": puntaje <- 40
		"G": puntaje <- 50
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
	definir i,j Como Entero
	Para i <- 0 Hasta cantDePuntajes-1 Con Paso 1 Hacer
		Para j <- 0 Hasta nroDeJugadores-1 Con Paso 1 Hacer
			Escribir  tablaDePuntajes[i,j] , " " Sin Saltar
		Fin Para
		Escribir ""
	Fin Para
	
FinSubAlgoritmo





