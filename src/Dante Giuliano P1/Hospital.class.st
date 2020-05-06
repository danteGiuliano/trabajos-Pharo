Class {
	#name : #Hospital,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'tipo',
		'ubicacion',
		'camasC',
		'camasCO',
		'camasT',
		'camasTO',
		'tipoHospital',
		'subColMedicos',
		'colEnfermos'
	],
	#category : #'Dante Giuliano P1'
}

{ #category : #contructor }
Hospital class >> construirEn:unLugar deTipo:unTipo conCamasComunes:camC yCamasDeTerapia:camT [
|a|.
a :=self new.
a unHospitalDeTipo: unTipo  conUbicacionn:unLugar   conUnaCanCamasC:camC   yCamasDeTerapia:camT.
^a. 
]

{ #category : #EjeciciosDelParcial }
Hospital >> getCamasDisponibles [
|totalC aux1 aux2|
aux1 := camasC - camasCO.
aux2 := camasT - camasTO.
totalC :=aux1 + aux2.
^totalC.
]

{ #category : #setters }
Hospital >> nuevoInfetado:unEnfermo [
|aux|.
aux:= unEnfermo getEstado.
((camasC >=camasCO)=(camasT>=camasTO) )ifTrue:[
	(aux='Grave')ifTrue:[
	camasCO := camasCO +1.
	]ifFalse:[
	camasTO := camasTO +1.
	].
colEnfermos add:unEnfermo .	
	].

]

{ #category : #setters }
Hospital >> nuevoMedico:unMedico [ 
subColMedicos add:unMedico .
]

{ #category : #getters }
Hospital >> obtenerPorcentajeDe:minimo sobre:maximo [.
^((minimo*100)/maximo)
]

{ #category : #EjeciciosDelParcial }
Hospital >> situacionHospital [
|situacion|.
situacion :=#(0 0 0 0 0).
situacion at:1 put: subColMedicos size. " Cantidad de medicos"
situacion at:2 put: camasC . "Cantidad de camas totales"
situacion at:3 put: camasCO. "Cantidad de camas disponibles"
situacion at:4 put: camasT. "Cantidad de camas de terapia totales"
situacion at:5 put: camasTO. "Cantidad de capas Ocupadas"
^situacion.

]

{ #category : #inicializador }
Hospital >> unHospitalDeTipo: unTipo conUbicacionn:unaUbicacion conUnaCanCamasC:unaCantidad yCamasDeTerapia:otraCantidad [ 
tipo := unTipo.
ubicacion :=unaUbicacion.
camasC :=unaCantidad asNumber.
camasT :=otraCantidad asNumber.
camasCO :=0.
camasTO :=0.
colEnfermos := OrderedCollection new.
subColMedicos :=OrderedCollection new.
]
