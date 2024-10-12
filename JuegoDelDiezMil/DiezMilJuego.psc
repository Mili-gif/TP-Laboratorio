CANTIDAD_DE_DADOS	Definir dados Como Entero
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
//----------------------------------------------------------------------------------------------------------------

Funcion puntaje <- obtenerPuntaje(dados, CANTIDAD_DE_DADOS)
	puntaje <- 0
	Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
		
		
	Fin Para
FinFuncion

Funcion puntaje obtenerPuntajePorNro(dados, CANTIDAD_DE_DADOS, nro)
	puntaje <- 0
	Segun nro Hacer
		1: 
			
		1: letra<-"B"
		2: letra<-"C"
		3: letra<-"D"
		4: letra<-"E"
		De Otro Modo: puntaje <- -1
	Fin Segun
FinFuncion

Funcion cantidad <- obtenerCantidaDeDadosCoincidentesANro(dados, CANTIDAD_DE_DADOS, nro)
	cantidad <- 0
	si nro < 1 o nro > 6 Entonces
		cantidad <- -1
	SiNo
		Para i<-0 Hasta CANTIDAD_DE_DADOS - 1 Con Paso 1 Hacer
			si dados[i] = nro
			
		Fin Para
	FinSi
	
FinFuncion
