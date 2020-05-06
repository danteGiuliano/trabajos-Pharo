"
aiudaaa
"
Class {
	#name : #Guerrero,
	#superclass : #Object,
	#instVars : [
		'unArma',
		'danio',
		'nivel',
		'nombre'
	],
	#category : #juegoDeRol
}

{ #category : #'as yet unclassified' }
Guerrero class >> crearConNombre:unNombre [
|a|.
a := self new.
a habiaUnGuerreroDeNombre:unNombre.
^a.
]

{ #category : #observadores }
Guerrero >> getNivel [
^nivel.
]

{ #category : #Inicializador }
Guerrero >> habiaUnGuerreroDeNombre:unNombre [.
nombre :=unNombre.
nivel :=1.
unArma := Arma crearArmaPara:'Guerrero'.
danio:=10.

]

{ #category : #modificadores }
Guerrero >> levepUP [
|a|
a := Random new.
nivel := nivel+1.
danio:= a nextInt:5
]

{ #category : #observadores }
Guerrero >> obtenerDanio [
^ unArma hacerDanio:danio.
]
