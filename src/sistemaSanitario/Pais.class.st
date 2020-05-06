Class {
	#name : #Pais,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'colMedicos',
		'colInfectados',
		'colHospitales'
	],
	#category : #sistemaSanitario
}

{ #category : #contructor }
Pais class >> crearPais: unNombre [
|a b|.
b := Random new. 
a := self new.
a unPaisDeNombre: unNombre yIndice:(b nextInt:3). 
^a.
]

{ #category : #getters }
Pais >> getColEnfermos [
^colInfectados size.
]

{ #category : #getters }
Pais >> getColHospitales [
^colHospitales size asString.
]

{ #category : #getters }
Pais >> getColMedicos [
^colMedicos size.
]

{ #category : #getters }
Pais >> getHospital [
|a med enfT camC camT enfC  |
med :=0.
camC :=0.
camT :=0.
enfC :=0.
enfT :=0.
colHospitales do: [ :h| a := h situacionHospital.
	 med := med + (a at:1).
	enfC := enfC + (a at:2).
	camC := camC + (a at:3).
	camT := camT + (a at:5).
	enfT := enfT  +(a at:4)
	].
a:='Los hospitales tienen Medicos: ',med asString ,' con ',enfC asString ,' Enfermos Graves'.
a:= a ,enfT asString ,' enfermos criticos',' El total de camas es. ',camC asString ,' Camas comunes '.
a := a, camT asString ,' Camas de terapia '.
^a.
 
]

{ #category : #getters }
Pais >> getNombrePais [
^nombre.
]

{ #category : #setter }
Pais >> nuevoInfectadoLibre:unEnfermo [
colInfectados add:unEnfermo .
]

{ #category : #setter }
Pais >> nuevoMedico: unMedico [
colMedicos add: unMedico.

]

{ #category : #EjeciciosDelParcial }
Pais >> posibleRecaida [
|camD res recaidaInfectados|
res := false.
recaidaInfectados := colInfectados size.
colHospitales do: [ :h |
	camD := h getCamasDisponibles.
	 ].
(recaidaInfectados >=camD)ifTrue:[
	res := true.
	].
^res.

]

{ #category : #setter }
Pais >> tieneHospital:unHospital [
colHospitales add: unHospital.

]

{ #category : #inicializador }
Pais >> unPaisDeNombre:unNombre yIndice:unNumero [
|e ram h m paciente |
nombre :=unNombre.
colInfectados := OrderedCollection new.
colMedicos :=OrderedCollection new. 
colHospitales :=OrderedCollection new.
"--------------------------------------------"
e :=GenerarTest crearDatosAleatorios.
ram :=Random new.
4 timesRepeat: [
	h :=Hospital construirEn: 'unaZona' deTipo:'unTipo'  conCamasComunes:(ram nextInt:200)+300  yCamasDeTerapia: (ram nextInt:200)+300.
	colHospitales add: h.
	 ].
colHospitales do:[ :miHospital | 
	(ram nextInt:1200/unNumero)+90 timesRepeat: [ 
	paciente:= Enfermo crearConNombre: e getNombreAleatorio  conDni:'DNI:',e getMatriculaAleatoria   yHospitalizado: e getEnServicio.
	(paciente getHospitalizado =true)ifTrue:[
		paciente setEstado:'Grave'.
		(e getEnServicio)ifTrue:[
			paciente setEstado:'Critico'
			].
		
		miHospital nuevoInfetado:paciente.
		]ifFalse:[
		paciente setEstado:'leve'.
		(e getEnServicio)ifTrue:[
			paciente setEstado:'Asintomatico'
			 ].
		self nuevoInfectadoLibre: paciente.
		].
	 ].
(ram nextInt:30)+60 timesRepeat: [ 
	m:=Medico crearMedicoDeNombre: e getNombreAleatorio deMatricula:e getMatriculaAleatoria   yEstado: e getEnServicio.
	(m getServicio =true)ifTrue:[
		miHospital nuevoMedico: m.
		].
	self nuevoMedico: m.
	 ].
	].

]

{ #category : #EjeciciosDelParcial }
Pais >> verificarCrisis [ 
|pGrav pCri camCri camGr res  canMed  tup totalP aux1 aux2|.
"----------------------------"
res:= false.
pGrav := 0.
pCri := 0.
camCri :=0.
camGr  :=0.
canMed :=0.
"----------------------------"
colHospitales do:[:h|
	 tup :=h situacionHospital.
	canMed :=canMed + (tup at:1) .
	pGrav := pGrav  +(tup at:3).
	camGr  := camGr   +(tup at:2).
	pCri := pCri + (tup at:5).
	camCri := camCri + (tup at:4).
	].
totalP := pGrav + pCri.
aux1 := canMed <= (totalP/10).
aux2 := (pCri >= camCri)or:[pGrav >= camGr].
(aux1 or:[aux2] ) ifTrue: [ 
	res := true.
	 ].
^res.


]
