"
la variable valor hace referencia al valor de la cara frontal
"
Class {
	#name : #DadoN,
	#superclass : #Object,
	#instVars : [
		'caras'
	],
	#category : #juegoDeRol
}

{ #category : #'as yet unclassified' }
DadoN class >> unDadoDeCantidadDeCaras:unaCantidad [
|a|
a:= self new.
a unDadoDeCaras: unaCantidad.
^a.
]

{ #category : #aplicaciones }
DadoN >> tirarDado [
|a|
a := Random new.
^a nextInt:caras.
]

{ #category : #inicializador }
DadoN >> unDadoDeCaras:unaCara [ 
(unaCara isNumber & unaCara asNumber >0)ifTrue: [ 
	caras :=unaCara.
	 ].
]
