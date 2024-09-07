Algoritmo juegoDelDiezMil
	
	Definir dado Como Entero
	Definir CANTIDAD_DE_DADOS Como Entero
	Definir hayTresIguales Como Entero
	Definir  puntosEspeciales Como Entero
	Definir  puntosNormales Como Entero
	Definir puntosTirada Como Entero
	Definir puntosEscalera Como Entero
	Definir llegoAMilPts como Entero
	Definir opcionDadoElegida Como Caracter
	Definir posicionDado Como Entero
	Definir puedeTirarDado Como Entero
	Definir vecContador Como Entero

	Dimension vecContador[6]
	llegoAMilPts <- 0
	puntosEscalera <- 0
	puntosTirada <-0
	CANTIDAD_DE_DADOS <- 5
	Dimension dados[5] 
//	dados[0] <- 1
//	dados[1] <- 1
//	dados[2] <- 1
//	dados[3] <- 1
//	dados[4] <- 1
	//LLAMADO DE FUNCIONES!!
	tirarTodosLosDados(dados, CANTIDAD_DE_DADOS)
	mostrarDados(dados, CANTIDAD_DE_DADOS)
	contadoresDeTodosLosDados(dados, CANTIDAD_DE_DADOS, vecContador)
	hayTresIguales <- hayTresDadosIguales(dados, CANTIDAD_DE_DADOS, vecContador) //ES UNA BANDERA
	puntosEscalera <- hayEscalera(dados, CANTIDAD_DE_DADOS) //ES UNA BANDERA
	llegoAMilPts <- puedeAnotarONo(puntosTirada) //ES UNA BANDERA
	mostrar "bandera hayTresIguales" , hayTresIguales
	Si (hayTresIguales = 1) o (puntosEscalera=1) Entonces
		Si(hayTresIguales = 1) Entonces
			puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS)
			puntosTirada <- puntosPrueba(dados, CANTIDAD_DE_DADOS) + puntosEspeciales
			
		SiNo
			puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS)
			puntosTirada <- puntosEspeciales
		FinSi
		
		Mostrar "Usted hizo ",puntosTirada
	SiNo
		puntosNormales<- puntosParcialesTiradaSinPuntajeEspecial(dados, CANTIDAD_DE_DADOS,vecContador)
		puntosTirada <- puntosNormales + puntosTirada
		Mostrar "Usted hizo ",puntosTirada
	FinSi
	Si ( puedeAnotarONo(puntosTirada)=1) Entonces
		Mostrar "Usted puede anotar, usted hizo: ", puntosTirada
	SiNo
		Mostrar "Usted aun no puede anotar, hizo: ", puntosTirada
	FinSi
	
	//contadoresDeTodosLosDados(dados, CANTIDAD_DE_DADOS, vecContador)
	//Tirada de dados con eleccion del usuario 
	
//	repetir
//		Escribir "Elija el dado que desea volver a tirar y X para salir:"
//		leer opcionDadoElegida
//		opcionDadoElegida<-Mayusculas(opcionDadoElegida)
//		
//		si opcionDadoElegida <> 'X' Entonces
//			posicionDado<-obtenerPosicionPorLetraDado(opcionDadoElegida)
//			puedeTirarDado<-puedeVolverATirarDado(dados, CANTIDAD_DE_DADOS, posicionDado)
//			
//			si puedeTirarDado = 1  Entonces
//				//tira el dado elegido
//				dados[posicionDado]<-tirarDado
//			sino si hayEscalera(dados, CANTIDAD_DE_DADOS)=1 Entonces
//					tirarTodosLosDados(dados, CANTIDAD_DE_DADOS)
//				SiNo
//					//no tira el dado
//					Escribir "usted no puede volver a tirar ese dado "
//				FinSi
//			FinSi	
//			 
//		FinSi
//	Hasta Que opcionDadoElegida = 'X'
//	mostrarDados(dados, CANTIDAD_DE_DADOS)
	
	
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

Funcion puntosParcialesPorTirada <- puntosParcialesTiradaSinPuntajeEspecial(dados, CANTIDAD_DE_DADOS,vecContador)//FUNCION  PASA LOS PUNTOS POR PARTIDA SIN PUNTAJE ESPECIAL
	Definir i Como Entero
	Definir puntosConDadoUno , puntosConDadoCinco , puntosParcialesPorTirada Como Entero
	//Inicializar todas las variables con 0.
	
	Si(vecContador[0]>=1 y vecContador[0]<=2) o (vecContador[4] >=1 y vecContador[4] <=2) Entonces
		puntosConDadoUno<- (vecContador[0]*100)
		puntosConDadoCinco<- (vecContador[4]*50)
		puntosParcialesPorTirada<- puntosConDadoUno+puntosConDadoCinco
	sino
		puntosParcialesPorTirada<-0
	FinSi
FinFuncion

Funcion resultado <- hayTresDadosIguales(dados, CANTIDAD_DE_DADOS, vecContador)//FUNCION PASA LOS PUNTOS ESPECIALES POR PARTIDA
	definir i Como Entero
	definir resultado Como Entero
	
	si (vecContador[1] >= 3) o (vecContador[2] >= 3) o (vecContador[3] >= 3) o (vecContador[4] >= 3) o (vecContador[5] >= 3)  o (vecContador[0] >= 3) Entonces
		resultado<- 1
	SiNo
		resultado<- 0
	FinSi
FinFuncion

Funcion puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS)
	Definir i Como Entero
	Definir puntosEspeciales Como Entero
	Definir contadorUno, contadorDos, contadorTres, contadorCuatro, contadorCinco, contadorSeis Como Entero	
	//Inicializo todas las anteriores variables en 0.
	Si (hayTresDadosIguales(dados, CANTIDAD_DE_DADOS, vecContador)=1) Entonces
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

Funcion resultado <- puedeAnotarONo(puntosTirada)
	Definir resultado Como Entero
	resultado <- 0
	Si (puntosTirada>= 1000) Entonces
		resultado <- 1
	SiNo
		resultado <- 0
	FinSi
FinFuncion

Funcion posicion <- obtenerPosicionPorLetraDado(opcionDadoElegida)
	Segun opcionDadoElegida Hacer
		"A": posicion<-0
		"B": posicion<-1
		"C": posicion<-2
		"D": posicion<-3
		"E": posicion<-4
		De Otro Modo: posicion<--1
	Fin Segun
Fin Funcion 

SubAlgoritmo contadoresDeTodosLosDados(dados, CANTIDAD_DE_DADOS, vecContador)
	
	Para i<- 0 hasta CANTIDAD_DE_DADOS-1 con Paso 1 Hacer
		Segun dados[i]  Hacer
			1: vecContador[1-1]<-vecContador[1-1]  +1
			2: vecContador[2-1]<- vecContador[2-1]+1
			3: vecContador[3-1]<- vecContador[3-1]+1
			4: vecContador[4-1]<- vecContador[4-1]+1
			5: vecContador[5-1]<- vecContador[5-1]+1
			6: vecContador[6-1] <- vecContador[6-1] +1
		FinSegun
	FinPara
	Para  i<- 0 hasta CANTIDAD_DE_DADOS con Paso 1 Hacer
		Mostrar "la cantidad de veces que salio el numero " , i+1 , " son " ,  vecContador[i]
	Fin Para
FinSubAlgoritmo
Funcion res<-puedeVolverATirarDado(dados, CANTIDAD_DE_DADOS, posicionDado)
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
	Segun dados[posicionDado] Hacer
		1: si contadorUno >= 0 entonces 
				res<-0
			FinSi
		2: si contadorDos < 3  entonces 
				res<-1
			FinSi
		3: si contadorTres < 3 entonces 
				res<-1
			FinSi
		4: si contadorCuatro < 3 entonces 
				res<-1
			FinSi
		5: si contadorCinco >= 0 entonces 
				res<-0
			FinSi
		6: si contadorSeis < 3 entonces 
				res<-1
			FinSi 
	FinSegun
FinFuncion


 