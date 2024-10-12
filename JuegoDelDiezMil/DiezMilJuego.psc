Algoritmo DiezMilJuego
	Definir dados Como Entero
	Definir CANTIDAD_DE_DADOS Como Entero
	CANTIDAD_DE_DADOS <- 5
	Dimension dados[CANTIDAD_DE_DADOS] 
//	dados[0] <- 5
//	dados[1] <- 5
//	dados[2] <- 5
//	dados[3] <- 5
//	dados[4] <- 5
	
	
	
	
	
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

SubAlgoritmo mostrarDados(dados, CANTIDAD_DE_DADOS)
	Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		Escribir "Dado ", obtenerLetraDelDadoPorPosicion(i),": ",dados[i]
	Fin Para
FinSubAlgoritmo

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
//----------------------------------------------------------------------------------------------------------------

Funcion puntaje <- obtenerPuntaje(dados, CANTIDAD_DE_DADOS)
	puntaje <- 0
	definir auxPuntaje, i, PUNTAJE_ESCALERA Como Entero
	PUNTAJE_ESCALERA <- 800
	
	si  hayEscalera(dados, CANTIDAD_DE_DADOS) = 1 Entonces
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
