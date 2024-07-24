Algoritmo tpLaboratorioGenerala
	//Reglas Generala
	//Escalera: 1-2-3-4 y 5 ; 2-3-4-5 y 6 ó 3-4-5-6 y 1, el 1 se puede colocar después del 6.
	//Full: 3 dados del mismo número y 2 iguales de otro.
	//Poker: 4 dados iguales (ver: "Del Poker"en Generala Real)
	//Generala: 5 dados iguales.
	//Doble Generala: igual a la anterior (es optativa).
	Definir dadoA,dadoB, dadoC, dadoD, dadoE como Entero
	Definir jugador1, jugador2,eleccion, respuestaTirada Como Caracter
	Definir fila, columna como Entero
	Definir tablaDePuntajes, contadorTiradas como Entero
	Dimension tablaDePuntajes[10,2]
	Escribir "Ingrese el nombre del primer jugador"
	Leer jugador1
	Escribir "Ingrese el nombre del segundo jugador"
	Leer jugador2
	dadoA<- tirarDado()
	dadoB<- tirarDado()
	dadoC<- tirarDado()
	dadoD<- tirarDado()
	dadoE<- tirarDado()
	Escribir "Los resultados que salieron en cada dado fueron: "
	mostrarDados(dadoA,dadoB,dadoC,dadoD,dadoE)
	contadorTiradas <- 1
	
	//Aca el usuario puede anotar los puntos si asi lo quisiera. Que no tenga la obligacion de volver a tirar los dados.
	//Comienza la segunda Tirada
	Definir eleccionValida Como Entero
	eleccionValida <- 0
	respuestaTirada <- "N"
	Repetir
		Repetir //Para validar si la eleccion es valida
			Escribir "Elija los dados que quiera volver a tirar."
			Escribir "En caso de querer salir ingrese X."
			Leer eleccion
			eleccion <- Mayusculas(eleccion)
			
			Segun eleccion Hacer
				"A":
					dadoA<- tirarDado()
					eleccionValida <- 1
				"B":
					dadoB<- tirarDado()
					eleccionValida <- 1
				"C":
					dadoC<- tirarDado()
					eleccionValida <- 1
				"D":
					dadoD<- tirarDado()
					eleccionValida <- 1
				"E":
					dadoE<- tirarDado()
					eleccionValida <- 1
				"X":
					eleccionValida <- 1
				De Otro Modo:
					Escribir "Opcion no valida"
					//Borrar Pantalla	
			Fin Segun
		Hasta Que eleccionValida = 1
		
		si eleccion = "X" Entonces
			//Borrar Pantalla	
			Escribir "Los resultados de la tirada fueron: "
			mostrarDados(dadoA,dadoB,dadoC,dadoD,dadoE)
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


SubAlgoritmo mostrarDados(dadoA,dadoB,dadoC,dadoD,dadoE)
	Escribir "Dado A: ",dadoA
	Escribir "Dado B: ",dadoB
	Escribir "Dado C: ",dadoC
	Escribir "Dado D: ",dadoD
	Escribir "Dado E: ",dadoE
FinSubAlgoritmo







