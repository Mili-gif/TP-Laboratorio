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
	
	Definir jugador1, jugador2,eleccion, respuestaTirada Como Caracter
	Definir fila, columna como Entero
	Definir tablaDePuntajes, contadorTiradas como Entero
	Dimension tablaDePuntajes[10,2]
	Dimension dados[5] 
	Escribir "Ingrese el nombre del primer jugador"
	Leer jugador1
	Escribir "Ingrese el nombre del segundo jugador"
	Leer jugador2
	
	tirarTodosLosDados(dados,CANTIDAD_DE_DADOS)
	//dadoB<- tirarDado()
	//dadoC<- tirarDado()
	//dadoD<- tirarDado()
	//dadoE<- tirarDado()
	Escribir "Los resultados que salieron en cada dado fueron: "
	mostrarDados(dados,CANTIDAD_DE_DADOS)
	contadorTiradas <- 1
	
	//Aca el usuario puede anotar los puntos si asi lo quisiera. Que no tenga la obligacion de volver a tirar los dados.
	//Comienza la segunda Tirada
	Definir eleccionValida Como Entero
	//Eleccion de dados 
	//El usuario puede seleccionar los dados (ABCDE) que quiera volver a tirar (que pasa si vuelve a elegir un dado que ya elegió)
	//En caso de que quiera dejar de seleccionar los dados elije X y los dados que elegio se tiran
	//Si no elegió ningun dado ó se terminaron sus tiradas dispobibles, se va a la fase de elegir puntuacion
	 
	Repetir
		eleccionValida <- 0
		respuestaTirada <- "N"
		Repetir //Para validar si la eleccion es valida
			Escribir "Elija los dados que quiera volver a tirar."
			Escribir "En caso de querer salir ingrese X."
			Leer eleccion
			eleccion <- Mayusculas(eleccion)
			
			Segun eleccion Hacer
				DADO_A:
					dados[obtenerPosicionPorLetraDado(DADO_A)] <- tirarDado()
					eleccionValida <- 1
				DADO_B:
					dados[obtenerPosicionPorLetraDado(DADO_B)] <- tirarDado()
					eleccionValida <- 1
				DADO_C:
					dados[obtenerPosicionPorLetraDado(DADO_C)] <- tirarDado()
					eleccionValida <- 1
				DADO_D:
					dados[obtenerPosicionPorLetraDado(DADO_D)] <- tirarDado()
					eleccionValida <- 1
				DADO_E:
					dados[obtenerPosicionPorLetraDado(DADO_E)] <- tirarDado()
					eleccionValida <- 1
				OPC_DEJAR_DE_ELEGIR:
					eleccionValida <- 1
				De Otro Modo:
					Escribir "Opcion no valida"
					//Borrar Pantalla	
			Fin Segun
		Hasta Que eleccionValida = 1
		
		
		Escribir "Los resultados de la tirada fueron: "
		mostrarDados(dados,CANTIDAD_DE_DADOS)
		si eleccion = "X" Entonces
			//Borrar Pantalla	
			
			contadorTiradas <- contadorTiradas + 1
			
			Escribir "¿Usted desea volver a tirar?. Si [S] o No [N]"
			Leer respuestaTirada
			respuestaTirada <- Mayusculas(respuestaTirada)
		FinSi
	Hasta Que contadorTiradas >= 3 o respuestaTirada = 'N'
	
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
		"A":
			posicion<-0
		"B":
			posicion<-1
		"C":
			posicion<-2
		"D":
			posicion<-3
		"E":
			posicion<-4
		De Otro Modo:
			posicion<--1
	Fin Segun
Fin Funcion

Funcion letra <- obtenerLetraDelDadoPorPosicion(posicion)
	Segun posicion Hacer
		0:
			letra<-"A"
		1:
			letra<-"B"
		2:
			letra<-"C"
		3:
			letra<-"D"
		4:
			letra<-"E"
		De Otro Modo:
			letra<-"POSICION INVALIDA"
	Fin Segun
Fin Funcion




