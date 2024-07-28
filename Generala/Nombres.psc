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
	
	
	
	
	
	Definir jugador1, jugador2,eleccion Como Caracter
	Definir fila, columna como Entero
	Definir tablaDePuntajes, contadorTiradas como Entero
	
	Dimension tablaDePuntajes[10,2]
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
	
	
	Escribir "Ingrese el nombre del primer jugador"
	Leer jugador1
	Escribir "Ingrese el nombre del segundo jugador"
	Leer jugador2
	
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
			Escribir "Elija los dados que quiera volver a tirar."
			Escribir "En caso de querer salir ingrese X."
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
	//Fin de la fase de "Eleccion de dados para volver a tirar"
	//------------------------------------------------------------------------------------------------------------------------------------------------------
	//Comienzo  de la fase de buscar puntajes y mostrar puntajes
	//Definir hayEscalera, hayPoker, hayFull, hayGenerala como Entero
	//hayEscalera <- hayEscalera(dados,CANTIDAD_DE_DADOS)
	//hayPoker <- hayPoker(dados,CANTIDAD_DE_DADOS)
	//hayFull <- hayFull(dados,CANTIDAD_DE_DADOS)
	//hayGenerala <- hayGenerala(dados,CANTIDAD_DE_DADOS)
	
	//------------------------------------------------------------------------------------------------------------------------------------------------------	
	
FinAlgoritmo






































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
		"E" : indice<- 6
		"F": indice<- 7
		"P": indice<- 8
		"G": indice<- 9
		De Otro Modo: indice<- -1
	FinSegun
	
FinFuncion









