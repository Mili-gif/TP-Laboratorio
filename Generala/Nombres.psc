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
	Dimension dados[5] 
	
	
	Escribir "Ingrese el nombre del primer jugador"
	Leer jugador1
	Escribir "Ingrese el nombre del segundo jugador"
	Leer jugador2
	
	//------------------------------------------------------------------------------------------------------------------------------------------------------
	//Comienzo de Turno, se tiran todos los dados
	tirarTodosLosDados(dados,CANTIDAD_DE_DADOS)
	Escribir "Los resultados que salieron en cada dado fueron: "
	mostrarDados(dados,CANTIDAD_DE_DADOS)
	
	
	
	//------------------------------------------------------------------------------------------------------------------------------------------------------
	//Eleccion de dados para volver a tirar
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
		si elecciones = "X" o contadorTiradas >= 3 Entonces
			//Borrar Pantalla	
			esFaseDeTiradas <- 0
			
		FinSi
		contadorTiradas <- contadorTiradas + 1
	Hasta Que esFaseDeTiradas = 0
	
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





