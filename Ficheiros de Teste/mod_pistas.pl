modificar_pista:-nl,write('Introduza o ID da Pista: '),read(X),modificar_pista2(X).
modificar_pista2(X)	:-	see('pistas.txt'),modificar_existe_pista(X),seen,!,modificar_remover_pista(X),modicar_inserir_pista(X),see('pistas2.txt'),read(Copia),seen,append('pistas3.txt'),write(Copia),write('.'),told.
modificar_pista2(_)	:-	write('A pista nao existe!'),nl.
%::::: 4c ::::::::::::::::::Modificar dados de resultados:::::::::: v :::%
modificar_resultado(Dia,Mes,Ano):- resultado_existe(Dia,Mes,Ano),!,modificar_resultado_aux(Dia,Mes,Ano).
modificar_resultado(_,_,_):- write('O resultado selecionado nao existe! '),nl.

modificar_resultado_aux(Dia,Mes,Ano):-write('Digite a nova lista de resultados: '),
devolve_numero_pilotos(N),devolve_lista_classificacoes([],L,N),
resultado(Id_pista,data_prova(Dia,Mes,Ano),_),
assertz(resultado(Id_pista,data_prova(Dia,Mes,Ano),L)),
retract(resultado(Id_pista,_,_)).

resultado_existe(Dia,Mes,Ano):-findall(data_prova(Dia,Mes,Ano),resultado(_,data_prova(_,_,_,_),_),[]),!,fail.
resultado_existe(Dia,Mes,Ano):-findall(data_prova(Dia,Mes,Ano),resultado(_,data_prova(Dia,Mes,Ano),_),_),write('O resultado existe!'),nl.



modificar_existe_pista(X):- read(P),modificar_compara_pistas(X,P).
modificar_compara_pistas(_,end_of_file):-!.
modificar_compara_pistas(X,pista(X,_,_,_,_)):-!.
modificar_compara_pistas(X,_):- modificar_existe_pista(X).

modificar_remover_pista(X):-modificar_verficheiro_pista(IDPista), 
modificar_copiaficheiro('pistas2.txt','pistas.txt').
		
	
modificar_verficheiro_pista(IDPista)	:-	see('pistas.txt'),tell('pistas2.txt'),modificar_lerficheiro_pista(IDPista),seen,told.
modificar_lerficheiro_pista(IDPista)	:-	read(X),remover_verifica_pista(IDPista,X).

% Verifica-se se essa pista existe na lista

remover_verifica_pista(_,end_of_file)		:-	!.
remover_verifica_pista(IDPista,pista(IDPista,_,_,_,_))	:-	!,modificar_lerficheiro_pista(IDPista).
remover_verifica_pista(IDPista,A):-	writeq(A),write(''),nl,modificar_lerficheiro_pista(IDPista).


modificar_addpista(IDPista).

%Pesquisa a Pista 

modificar_pesquisar_pista_add(IDPista):-seen,see('pistas.txt'),modificar_pesquisa_pista_add(IDPista),!,
modificar_copiaficheiro('pistas2.txt','pistas.txt').
modificar_pesquisar_pista_add(IDPista):-modificar_addpista.


modificar_pesquisa_pista_add(IDPista):-read(X),modificar_retorna_pista_add(IDPista,X).

modificar_retorna_pista_add(IDPista,end_of_file):-seen, modicar_inserir_pista(IDPista).
modificar_retorna_pista_add(IDPista,pistas(IDPista,_,_,_,_)):-!,seen , write('Pista já existe!'),nl,nl,nl,fail.
modificar_retorna_pista_add(IDPista,_):-modificar_pesquisa_pista_add(IDPista).


modicar_inserir_pista(IDPista):-
write('IDPistaome da pista: '),read(IDPistaome_pista),
write('Pais: '),read(Pais),
write('Descricao: '),nl,
write('	IDPistaumero de voltas: '),read(Voltas),
write('	Metros: '),read(M),
write('Historico:'),nl,modificar_pede_lista_historico([],LH),
tell('pistas2.txt'), see('pistas.txt'),modificar_copiaf,writeq(pistas(IDPista, IDPistaome_pista, Pais, descricao(Voltas,M),LH)),write('.'),nl,told, seen.


%copiar ficheiro

modificar_copiaficheiro(A,B):-seen,told,see(A),tell(B),modificar_copiaf,seen,told.
modificar_copiaf:-read(Item),modificar_copia(Item).
modificar_copia(end_of_file):-!.
modificar_copia(Item):-writeq(Item),write('.'),nl,modificar_copiaf.

%modificar_pede_lista_historico([],LH)
modificar_pede_lista_historico(Li,Lf):-write('Inserir novo? (s/n)'),read(X),modificar_verifca(X,Li,Lf).
modificar_verifca('s',Li,[historico(Piloto,Ano)|Lf]):-!, write('Piloto? '),read(Piloto), write('Ano? '),read(Ano), modificar_pede_lista_historico(Li,Lf).
modificar_verifca(_,Li,Li). 
%pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), [historico(Piloto, Ano)]).



