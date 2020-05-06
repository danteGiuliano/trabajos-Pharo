"
espero funcione :c

"
Class {
	#name : #Hechizero,
	#superclass : #Object,
	#instVars : [
		'unArma',
		'danio',
		'nivel',
		'nombre'
	],
	#category : #'Dante Giuliano'
}

{ #category : #'as yet unclassified' }
Hechizero class >> crearConNombre: unNombre [
|a|.
a := self new.
a crearUnHechizeroDeNombre: unNombre.
]

{ #category : #inicializador }
Hechizero >> crearUnHechizeroDeNombre:unNombre [
nombre :=unNombre.
nivel:=1.
unArma := Arma crearArmaPara:'Hechizero'.
danio:=8.
]

{ #category : #observadores }
Hechizero >> getNivel [
^nivel.
]

{ #category : #modificadores }
Hechizero >> levepUP [
|a|.
a := Random new.
nivel := nivel+1.
danio:= a nextInt:5.
]

{ #category : #observadores }
Hechizero >> obtenerDanio [
	^ unArma hacerDanio:danio.
]
