"
Estado de enfermo
Libre = Fuera de un hospital
medio = hospital
grave = hospital
critico = hospital

"
Class {
	#name : #Enfermo,
	#superclass : #Object,
	#instVars : [
		'estado',
		'dni',
		'nombre',
		'hospitalizado'
	],
	#category : #'Dante Giuliano P1'
}

{ #category : #contructor }
Enfermo class >> crearConNombre:unNombre conDni:unDni yHospitalizado:unEstado [
|a |.
a := self new.
a unNuevoEnfermo: unNombre  conDni:unDni   yEstado:'nulo'  esHospitalizado:unEstado. 
^a.
]

{ #category : #getters }
Enfermo >> getEstado [
^estado.
]

{ #category : #getters }
Enfermo >> getHospitalizado [
^hospitalizado.
]

{ #category : #setter }
Enfermo >> setEstado:unEstado [
estado := unEstado .
]

{ #category : #inicializador }
Enfermo >> unNuevoEnfermo:unNombre conDni:unDni yEstado:unEstado esHospitalizado:unBooleano [.
nombre := unNombre.
dni := unDni.
estado :=unEstado.
hospitalizado := unBooleano
]
