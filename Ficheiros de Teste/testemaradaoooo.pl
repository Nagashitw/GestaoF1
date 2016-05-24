calcular_percurso_pista:-consult('pistas.txt'),write('Introduza a Identificacao da pista: '),read(X),calcular_get_pistas(X).


calcular_get_pistas(X):-setof(X,pistas(X,_,_,_,_),_),fazcontas(X).

fazcontas(X):-get_info_pistas(X,Nome,Pais,Voltas,Metros),
Percurso is Voltas*Metros, KM is Percurso/1000,
write('Informacao da Pista: '),nl,nl,
write('Identificacao da Pista : '),write(X),nl,
write('Nome da Pista: '),write(Nome),nl,
write('Pais da Pista: '),write(Pais),nl,
write('Percurso em Metros: '),write(Percurso),nl,
write('Percurso em Kilometros: '),write(KM),nl.
get_info_pistas(X,Nome,Pais,Voltas,Metros):-setof(X,pistas(X,Nome,Pais,descricao(Voltas,Metros),_),_).