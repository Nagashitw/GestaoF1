addpista:-nl,write('IDPista: '),read(IDPista),pesquisar_pista_add(IDPista).

%Pesquisa a Pista 

pesquisar_pista_add(IDPista):-seen,see('pistas.txt'),pesquisa_pista_add(IDPista),!,copiaficheiro('pistascopias.txt','pistas.txt').
pesquisar_pista_add(IDPista):-addpista.


pesquisa_pista_add(IDPista):-read(X),retorna_pista_add(IDPista,X).

retorna_pista_add(IDPista,end_of_file):-seen, inserir_pista(IDPista).
retorna_pista_add(IDPista,pistas(IDPista,_,_,_,_)):-!,seen , write('Pista já existe!'),nl,nl,nl,fail.
retorna_pista_add(IDPista,_):-pesquisa_pista_add(IDPista).


inserir_pista(IDPista):-
write('Nome da pista: '),read(Nome_pista),
write('Pais: '),read(Pais),
write('Descricao: '),nl,
write('	Numero de voltas: '),read(Voltas),
write('	Metros: '),read(M),
write('Historico:'),nl,pede_lista_historico([],LH),
tell('pistascopias.txt'), see('pistas.txt'),copiaf,writeq(pistas(IDPista, Nome_pista, Pais, descricao(Voltas,M),LH)),write('.'),nl,told, seen.


%copiar ficheiro
copiaficheiro(A,B):-seen,told,see(A),tell(B),copiaf,seen,told.
copiaf:-read(Item),copia(Item).
copia(end_of_file):-!.
copia(Item):-writeq(Item),write('.'),nl,copiaf.

%pede_lista_historico([],LH)
pede_lista_historico(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica_lista_historico(X,Li,Lf).
verifica_lista_historico('s',Li,[historico(Piloto,Ano)|Lf]):-!, write('Piloto? '),read(Piloto), write('Ano? '),read(Ano), pede_lista_historico(Li,Lf).
verifica_lista_historico(_,Li,Li). 