Algoritmo juegoDelDiezMil
	
	Definir dado Como Entero
	Definir CANTIDAD_DE_DADOS Como Entero
	Definir hayTresIguales Como Entero
	Definir  puntosEspeciales Como Entero
	Definir  puntosNormales Como Entero
	Definir puntosTirada Como Entero
	Definir puntosEscalera Como Entero
	puntosEscalera <- 0
	puntosTirada<-0
	CANTIDAD_DE_DADOS <- 5
	Dimension dados[5] 
	dados[0] <- 1
	dados[1] <- 2
	dados[2] <- 3
	dados[3] <- 5
	dados[4] <- 4
	//LLAMADO DE FUNCIONES!!
	//tirarTodosLosDados(dados, CANTIDAD_DE_DADOS)
	mostrarDados(dados, CANTIDAD_DE_DADOS)
	hayTresIguales <- hayTresDadosIguales(dados, CANTIDAD_DE_DADOS) //ES UNA BANDERA
	puntosEscalera <- hayEscalera(dados, CANTIDAD_DE_DADOS) //ES UNA BANDERA
	Si hayTresIguales = 1 Entonces
		puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS)
		puntosTirada <- puntosPrueba(dados, CANTIDAD_DE_DADOS) + puntosEspeciales
		Mostrar "Usted hizo ",puntosTirada
	SiNo
		puntosNormales<- puntosParcialesTiradaSinPuntajeEspecial(dados, CANTIDAD_DE_DADOS)
		puntosTirada <- puntosNormales + puntosTirada
		Mostrar "Usted hizo ",puntosTirada
	FinSi
FinAlgoritmo

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

Funcion puntosParcialesPorTirada <- puntosParcialesTiradaSinPuntajeEspecial(dados, CANTIDAD_DE_DADOS)//FUNCION  PASA LOS PUNTOS POR PARTIDA SIN PUNTAJE ESPECIAL
	Definir i Como Entero
	Definir puntosConDadoUno Como Entero
	Definir puntosConDadoCinco Como Entero
	Definir puntosParcialesPorTirada Como Entero
	Definir contadorUno, contadorDos, contadorTres, contadorCuatro, contadorCinco, contadorSeis Como Entero
	//Inicializar todas las variables con 0.
	
	Para i<- 0 hasta CANTIDAD_DE_DADOS-1 con Paso 1 Hacer
        Segun dados[i]  Hacer
			1: contadorUno<- contadorUno +1
			5: contadorCinco<- contadorCinco+1
		FinSegun
	FinPara
	
	Si(contadorUno>=1 y contadorUno<=2) o (contadorCinco >=1 y contadorCinco <=2) Entonces
		puntosConDadoUno<- (contadorUno*100)
		puntosConDadoCinco<- (contadorCinco*50)
		puntosParcialesPorTirada<- puntosConDadoUno+puntosConDadoCinco
	sino
		puntosParcialesPorTirada<-0
	FinSi
FinFuncion

Funcion resultado <- hayTresDadosIguales(dados, CANTIDAD_DE_DADOS)//FUNCION PASA LOS PUNTOS ESPECIALES POR PARTIDA
	definir i Como Entero
	definir resultado Como Entero
	definir puntosParcialesPorTirada Como Entero
	definir contadorUno, contadorDos, contadorTres, contadorCuatro, contadorCinco, contadorSeis Como Entero
	//Inicializar todas las variables con 0.
	
	Para i<- 0 hasta CANTIDAD_DE_DADOS-1 con Paso 1 Hacer
        Segun dados[i]  Hacer
			1: contadorUno<- contadorUno +1
			2: contadorDos<- contadorDos+1
			3: contadorTres<- contadorTres+1
			4: contadorCuatro<- contadorCuatro+1
			5: contadorCinco<- contadorCinco+1
			6: contadorSeis <- contadorSeis +1
		FinSegun
	FinPara
	
	Si(contadorUno >=3 o contadorDos >=3 o contadorTres >=3 o contadorCuatro >=3 o contadorCinco >=3 o contadorSeis >=3) Entonces
		resultado <- 1
	sino 
		resultado <- 0
	FinSi
FinFuncion

Funcion puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS)
	Definir i Como Entero
	Definir puntosEspeciales Como Entero
	Definir contadorUno, contadorDos, contadorTres, contadorCuatro, contadorCinco, contadorSeis Como Entero	
	//Inicializo todas las anteriores variables en 0.
	Si (hayTresDadosIguales(dados, CANTIDAD_DE_DADOS)=1) Entonces
		Para i <- 0 hasta CANTIDAD_DE_DADOS-1 con Paso 1 Hacer
			Segun dados[i] Hacer
				1: 
					contadorUno<- contadorUno +1;
					Si(contadorUno>=3) entonces
						puntosEspeciales <- 1000
					Finsi
				2: 
					contadorDos<- contadorUno +1;
					Si(contadorDos>=3) entonces
						puntosEspeciales <- 200
					Finsi
				3: 
					contadorTres<- contadorTres+1;
					Si(contadorTres>=3) entonces
						puntosEspeciales <- 300
					Finsi
				4: 
					contadorCuatro<- contadorCuatro +1;
					Si(contadorCuatro>=3) entonces
						puntosEspeciales <- 400
					Finsi
				5: 
					contadorCinco<- contadorCinco+1;
					Si(contadorCinco>=3) entonces
						puntosEspeciales <- 500
					Finsi
				6: 
					contadorSeis <- contadorSeis +1;
					Si(contadorSeis >=3) entonces
						puntosEspeciales <- 600
					Finsi
				De otro Modo: 
					puntosEspeciales <- 0
			FinSegun
		FinPara
	FinSi
	Si (hayEscalera(dados, CANTIDAD_DE_DADOS)=1) Entonces
		puntosEspeciales <- 500
	FinSi
FinFuncion

Funcion puntosComunes <- puntosPrueba(dados, CANTIDAD_DE_DADOS)
	Definir i Como Entero
	Definir resultado Como Entero
	Definir puntosComunes Como Entero
	Definir aux Como Entero
	Definir puntosConDadoUno, puntosConDadoCinco Como Entero 
	Definir contadorUno, contadorDos, contadorTres, contadorCuatro, contadorCinco, contadorSeis Como Entero
	aux<-0
	//Inicializar todas las variables con 0.
	Para i<- 0 hasta CANTIDAD_DE_DADOS-1 con Paso 1 Hacer
        Segun dados[i]  Hacer
			1: contadorUno<- contadorUno +1
			2: contadorDos<- contadorDos+1
			3: contadorTres<- contadorTres+1
			4: contadorCuatro<- contadorCuatro+1
			5: contadorCinco<- contadorCinco+1
			6: contadorSeis <- contadorSeis +1
		FinSegun
	FinPara 
	Si(contadorUno>3 o contadorCinco>3) Entonces //NO USAR NUMEROS MAGICOS!! VER DE CAMBIAR EL 3
		Si(contadorUno>3) Entonces
			aux<- contadorUno - 3
			puntosComunes<- aux * 100 
		Sino 
			Si(contadorCinco>3) Entonces
				aux<- contadorCinco - 3
				puntosComunes<- aux * 50
			FinSi
		FinSi
		
	FinSi
	Si(contadorUno>=1 y contadorUno<=2) o (contadorCinco >=1 y contadorCinco <=2) Entonces
		
		Si(contadorUno>=1 y contadorUno<=2) Entonces
			puntosConDadoUno<- (contadorUno*100)
		SiNo
			puntosConDadoCinco<- (contadorCinco*50)
		FinSi
		puntosComunes<- puntosConDadoUno+puntosConDadoCinco + puntosComunes
	sino
		puntosComunes<-puntosComunes
	FinSi
FinFuncion

Funcion resultado <- hayEscalera(dados, CANTIDAD_DE_DADOS) //BANDERA PARA VER SI HAY ESCALERA O NO
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
	