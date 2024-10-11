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
	Definir hayUnosOCincos Como Entero
	Definir resTiraTodosLosDados Como Entero
	Definir puedeTirarLosCincoDados Como Entero
	Dimension vecContador[6]
	llegoAMilPts <- 0
	puntosEscalera <- 0
	puntosTirada <- 0
	CANTIDAD_DE_DADOS <- 5
	Dimension dados[5] 
//	dados[0] <- 5
//	dados[1] <- 5
//	dados[2] <- 5
//	dados[3] <- 5
//	dados[4] <- 5
	//LLAMADO DE FUNCIONES!!
	tirarTodosLosDados(dados, CANTIDAD_DE_DADOS)
	mostrarDados(dados, CANTIDAD_DE_DADOS)
	contadoresDeTodosLosDados(dados, CANTIDAD_DE_DADOS, vecContador)
	hayTresIguales <- hayTresDadosIguales(dados, CANTIDAD_DE_DADOS, vecContador) //ES UNA BANDERA
	puntosEscalera <- hayEscalera(dados, CANTIDAD_DE_DADOS, vecContador) //ES UNA BANDERA
	llegoAMilPts <- puedeAnotarONo(puntosTirada) //ES UNA BANDERA
	Si (hayTresIguales = 1) o (puntosEscalera=1) Entonces
		Si(hayTresIguales = 1) Entonces
			puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS, vecContador)
			puntosTirada <- puntosUnosyCincos(dados, CANTIDAD_DE_DADOS, vecContador) + puntosEspeciales
			//mostrar "puntosPrueba(dados, CANTIDAD_DE_DADOS, vecContador) + puntosEspeciales ",puntosTirada
			
		SiNo
			puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS, vecContador)
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
	
	hayUnosOCincos<- hayTodoUnosOCincos(CANTIDAD_DE_DADOS, vecContador)
	//mostrar "hay todo cinco o uno", hayUnosOCincos
	puedeTirarLosCincoDados<-puedeVolverATirarLosCincoDados(vecContador,hayUnosOCincos, puntosEscalera)
	
	//Tirada de dados con eleccion del usuario 
	
	si hayUnosOCincos = 1 Entonces
		Escribir "Puede volver a tirar todos los dados <1> para si <0> para no: "
		leer resTiraTodosLosDados 
		si resTiraTodosLosDados = 1 Entonces
			tirarTodosLosDados(dados, CANTIDAD_DE_DADOS)
		FinSi
	FinSi
	
	repetir
		Escribir "Elija el dado que desea volver a tirar y X para salir:"
		leer opcionDadoElegida
		opcionDadoElegida<-Mayusculas(opcionDadoElegida)
		
		si opcionDadoElegida <> 'X' Entonces
			posicionDado<-obtenerPosicionPorLetraDado(opcionDadoElegida)
			puedeTirarDado<-puedeVolverATirarDado(dados, vecContador, posicionDado, puntosEscalera)
			
			si puedeTirarDado = 1  Entonces
				//tira el dado elegido
				dados[posicionDado]<-tirarDado
			SiNo
				//no tira el dado
				Escribir "usted no puede volver a tirar ese dado "
			FinSi	
			
		FinSi
	Hasta Que opcionDadoElegida = 'X'
	mostrarDados(dados, CANTIDAD_DE_DADOS)
	
	
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

Funcion puntosEspeciales <- obtienePuntosEspeciales(dados, CANTIDAD_DE_DADOS, vecContador)
	Definir i Como Entero
	Definir puntosEspeciales Como Entero
	Si (hayTresDadosIguales(dados, CANTIDAD_DE_DADOS, vecContador)=1) Entonces
		Para i<-0 Hasta CANTIDAD_DE_DADOS Con Paso 1 Hacer
			Segun i Hacer
				0:
					Si(vecContador[0] >= 3) Entonces
						puntosEspeciales<- 1000
					FinSi
				1:
					Si(vecContador[1] >= 3) Entonces
						puntosEspeciales<- 200
					FinSi
				2:
					Si(vecContador[2] >= 3) Entonces
						puntosEspeciales<- 300
					FinSi
				3:
					Si(vecContador[3] >= 3) Entonces
						puntosEspeciales<- 400
					FinSi
				4:
					Si(vecContador[4] >= 3) Entonces
						puntosEspeciales<- 500
					FinSi
				5:
					Si(vecContador[5] >= 3) Entonces
						puntosEspeciales<- 600
					FinSi
				De Otro Modo:
					puntosEspeciales<- 0
			Fin Segun
		Fin Para
		
	FinSi
	Si (hayEscalera(dados, CANTIDAD_DE_DADOS,vecContador)=1) Entonces
		puntosEspeciales <- 500
	FinSi
FinFuncion

Funcion puntosComunes <- puntosUnosyCincos(dados, CANTIDAD_DE_DADOS, vecContador)
	Definir i Como Entero
	Definir resultado Como Entero
	Definir puntosComunes Como Entero
	Definir aux Como Entero
	Definir puntosConDadoUno, puntosConDadoCinco Como Entero 
	aux<-0
	Si(vecContador[0]>3 o vecContador[4]>3) Entonces //NO USAR NUMEROS MAGICOS!! VER DE CAMBIAR EL 3
		Si(vecContador[0]>3) Entonces
			aux<- vecContador[0] - 3
			puntosComunes<- aux * 100 
		Sino 
			Si(vecContador[4]>3) Entonces
				aux<- vecContador[4] - 3
				puntosComunes<- aux * 50
			FinSi
		FinSi
		
	FinSi
	Si(vecContador[0]>=1 y vecContador[0]<=2) o (vecContador[4] >=1 y vecContador[4] <=2) Entonces
		
		Si(vecContador[0]>=1 y vecContador[0]<=2) Entonces
			puntosConDadoUno <- (vecContador[0]*100)
		FinSi
			
		Si(vecContador[4] >=1 y vecContador[4] <=2) Entonces
			puntosConDadoCinco <- (vecContador[4]*50)
		FinSi
		puntosComunes<- puntosConDadoUno+puntosConDadoCinco + puntosComunes
	sino
		puntosComunes<-puntosComunes
	FinSi
FinFuncion

Funcion resultado <- hayEscalera(dados, CANTIDAD_DE_DADOS,vecContador) //BANDERA PARA VER SI HAY ESCALERA O NO
	resultado <- 0
	definir i Como Entero
	
	Si (vecContador[0] = 1 y vecContador[1] = 1 y vecContador[2] = 1 y vecContador[3] = 1 y vecContador[4] = 1) o (vecContador[5] = 1 y vecContador[1] = 1 y vecContador[2] = 1 y vecContador[3] = 1 y vecContador[4] = 1) Entonces
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
//	Para  i<- 0 hasta CANTIDAD_DE_DADOS con Paso 1 Hacer
//		Mostrar "la cantidad de veces que salio el numero " , i+1 , " son " ,  vecContador[i]
//	Fin Para
FinSubAlgoritmo
Funcion res<-puedeVolverATirarDado(dados,vecContador, posicionDado,puntosEscalera)
	
	Segun dados[posicionDado] Hacer
		1: si vecContador[0] >= 0 entonces 
				res<-0
			FinSi
		2: si vecContador[1]< 3  entonces 
				res<-1
			FinSi
		3: si vecContador[2]< 3 entonces 
				res<-1
			FinSi
		4: si vecContador[3]< 3 entonces 
				res<-1
			FinSi
		5: si vecContador[4]>= 0 entonces 
				res<-0
			FinSi
		6: si vecContador[5]< 3 entonces 
				res<-1
			FinSi 
	FinSegun
	si puntosEscalera = 1 Entonces
		res <- 0
	FinSi
FinFuncion 

Funcion res<- hayTodoUnosOCincos(CANTIDAD_DE_DADOS, vecContador)
	si (vecContador[0] = CANTIDAD_DE_DADOS o vecContador[4] = CANTIDAD_DE_DADOS) Entonces
		res<-1
	FinSi
FinFuncion
Funcion resultado <- puedeVolverATirarLosCincoDados(vecContador,hayUnosOCincos, puntosEscalera)//esta funcion nos va servir para los casos que tiene que volver a tirar los 5 dados
	si(vecContador[0] >= 4 Y vecContador[4] = 1) O (vecContador[0] >= 3 Y vecContador[4] = 2) O (vecContador[0] >= 2 Y vecContador[4] = 3) O (vecContador[0] >= 1 Y vecContador[4] = 4) O (hayUnosOCincos=1) o (puntosEscalera=1) Entonces
		resultado <- 1
	SiNo
		resultado <- 0
	FinSi
FinFuncion
//	res<- puedeTirarTodosLosDados(vecContador, puntosEscalera )
//
//Funcion 
 