"
sadsads

"
Class {
	#name : #Arma,
	#superclass : #Object,
	#instVars : [
		'tipo',
		'cara',
		'canDados'
	],
	#category : #juegoDeRol
}

{ #category : #'as yet unclassified' }
Arma class >> crearArmaPara:unaClase [
|a|
a := self new.
(unaClase = Hechizero)ifTrue: [
	a craftearArma: 'Hechizo'.
	  ] ifFalse: [ 	a craftearArma: 'Hacha'. ].
^a. 
]

{ #category : #inicializador }
Arma >> craftearArma:unTipo [
(unTipo ='Hacha')ifTrue: [ 
	tipo :='Hacha'.
	cara:=2.
canDados :=6.
	 ] ifFalse:[ 
	tipo :='Hechizo'.
	cara :=3.
	canDados :=3.
	].

]

{ #category : #aplicacion }
Arma >> hacerDanio:unNivel [
|a b|
b :=0.
a := DadoN unDadoDeCantidadDeCaras: cara.
canDados timesRepeat: [
	b := b + a tirarDado. 
 ].
^b+unNivel.
]

{ #category : #observadores }
Arma >> tipo [
	^ tipo
]
