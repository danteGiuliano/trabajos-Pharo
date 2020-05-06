"
|oms test saturacion can|
can :=0.
test := GenerarTest crearDatosAleatorios.
oms :=OMS crearOMS: (test RunTest: 50).
Transcript show:'Test en base a 50 paises, maximo 100';cr.
oms listarPaisesEnCrisis.
Transcript show:'Los siguientes paises pueden entrar en saturacion ';cr.
saturacion := oms posibleSaturacion.
saturacion do:[:s|
	Transcript show: s getNombrePais,'-'.
	can := can+1. 
	(can=20)ifTrue:[
		Transcript show:' ';cr. 
	]].
Transcript show:' ';cr.
Transcript show:'La cantidad de paises con posbile saturacion son ',can asString.
"
Class {
	#name : #GenerarTest,
	#superclass : #Object,
	#instVars : [
		'colNombres',
		'valoAl',
		'colNomPais'
	],
	#category : #sistemaSanitario
}

{ #category : #'as yet unclassified' }
GenerarTest class >> crearDatosAleatorios [
|a|
a := self new.
a inicializar.
^a.
]

{ #category : #'as yet unclassified' }
GenerarTest >> RunTest:canPaises [
|col pGen |
col:=OrderedCollection new.
canPaises timesRepeat: [ 
	pGen := Pais crearPais:(self getNombrePaisAleatorio ).
	col add: pGen.
	 ].
^col.
]

{ #category : #getters }
GenerarTest >> getEnServicio [
|a b|
b :=true.
a := (valoAl nextInt:2).
(a=1)ifTrue:[
	b :=false.
	].
^b.
]

{ #category : #getters }
GenerarTest >> getMatriculaAleatoria [
|a b|.
b :=''.
6 timesRepeat:[a :=valoAl nextInt:9.
	b:=b asString ,a asString .]. 
^b.
]

{ #category : #getters }
GenerarTest >> getNombreAleatorio [
|a b|
a := valoAl nextInt:99.
b:=colNombres at: a.
^ b asString.
]

{ #category : #'as yet unclassified' }
GenerarTest >> getNombrePaisAleatorio [
|tam ram|.
ram := Random new.
tam := colNomPais  size.
^colNomPais  at:(ram nextInt:tam).
]

{ #category : #'as yet unclassified' }
GenerarTest >> inicializar [
colNombres := #(Fitzgerald
Zachery
Noah
Dolan
Oliver
Armand
Dexter
Scott
Murphy
Henry
Brock
Felix
Aaron
Demetrius
Xavier
Clinton
Abdul
Clarke
Quentin
Zeus
Chase
Ashton
Macaulay
Matthew
Reuben
Vladimir
Merrill
Griffith
Simon
Abel
Felix
Xanthus
Jesse
Colt
Oliver
Chancellor
Elton
Dante
Duncan
Isaiah
Jackson
Thor
Colton
Clinton
Hakeem
James
Trevor
Stone
Flynn
Hayes
Ignatius
Joshua
Silas
Jason
Reese
Vernon
Lewis
Odysseus
Hammett
Brock
Kermit
Vance
Austin
Joel
Upton
Odysseus
Driscoll
Preston
Quinlan
Callum
Honorato
Malachi
Emerson
Kennedy
Cyrus
Murphy
Brian
Thomas
Aristotle
Bernard
Allistair
Amery
Geoffrey
Armando
Howard
Laith
Baker
Quamar
Callum
Cameron
Paul
Solomon
Cairo
Edward
Fitzgerald
Caleb
Jared
Barrett
Evan
Keaton
).
colNomPais  := #(Congo
Guam
Denmark
Bolivia
Slovakia
Ecuador
Slovenia
Germany
Cuba
Kenya
Bermuda
Lithuania
Vanuatu
France
Guatemala
Nepal
Burundi
Malta
Ukraine
Somalia
Poland
Jersey
Panama
Burundi
Azerbaijan
Sweden
Ghana
Mexico
Slovenia
Austria
Brunei
Indonesia
El Salvador
Kuwait
Niger
Bolivia
Iceland
Chile
Serbia
Israel
Togo
Thailand
Turkey
Myanmar
Viet Nam
Saint Lucia
Nicaragua
Micronesia
Christmas Island
Romania
Nicaragua
Moldova
Mexico
Ireland
Slovenia
Senegal
Niger
Canada
Netherlands
Finland
Seychelles
Portugal
Suriname
Croatia
Nepal
Guinea
Honduras
Argentina
Brasil
Chile
Paraguay
Canada
España
Mexico
Italia
Uruguay
).
valoAl := Random new.
]

{ #category : #'as yet unclassified' }
GenerarTest >> toStringDebug:unPais [
|a |
a:= 'El pais: ', unPais getNombrePais,' Posee: ', unPais getColEnfermos asString ,' Asintomaticos o leves '.
a := a , unPais getColMedicos asString ,' Medicos que no trabajan  y la situacion de los hospitales es ',unPais getHospital.
 ^a.

]
