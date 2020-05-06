Class {
	#name : #OMS,
	#superclass : #Object,
	#instVars : [
		'colPaises'
	],
	#category : #sistemaSanitario
}

{ #category : #constructor }
OMS class >> crearOMS:unaColPaises [
|a|.
a := self new.
a unaOMS: unaColPaises .
^a.
]

{ #category : #EjeciciosDelParcial }
OMS >> listarPaisesEnCrisis [
|lista debug|
debug := GenerarTest new.
lista :=OrderedCollection new.
colPaises do:[:unPais|
	(unPais verificarCrisis )ifTrue:[
	lista add: unPais getNombrePais.
	"La siguiente linea es para poder debugear en el Transcript para poder mostrar la informacion"
	Transcript show: (debug toStringDebug: unPais);cr.
		].
	].
^lista.
]

{ #category : #setter }
OMS >> nuevoPaisIntegrante:unPais [
colPaises add: unPais.

]

{ #category : #getters }
OMS >> paisesRegistrados [
^colPaises size.
]

{ #category : #EjeciciosDelParcial }
OMS >> posibleSaturacion [
|colSaturados|
colSaturados := OrderedCollection new.
colSaturados:=colPaises select: [ :unPais| unPais posibleRecaida  ].
^colSaturados.
]

{ #category : #inicializador }
OMS >> unaOMS:unaColPaises [
"veamos que pasa"
colPaises :=unaColPaises.
]
