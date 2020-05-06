"
Esta clase contiene todo sobre medicos

"
Class {
	#name : #Medico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'matricula',
		'enServicio'
	],
	#category : #sistemaSanitario
}

{ #category : #'as yet unclassified' }
Medico class >> crearMedicoDeNombre: unNombre deMatricula:unaMatricula yEstado:unEstado [
|a|.
a := self new.
a unMedicoDeNombre: unNombre deMatricula:unaMatricula yTrabaja:unEstado.
^a. 
]

{ #category : #getter }
Medico >> getServicio [
^enServicio.
]

{ #category : #inicializador }
Medico >> unMedicoDeNombre: unNombre deMatricula:unaMatricula yTrabaja:unEstado [
nombre := unNombre.
matricula :=unaMatricula.
enServicio :=unEstado.
]
