listar_piloto_mais_titulos:- consult('piloto.pl'),consult('resultados.pl'), findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
listar_piloto_mais_titulos:- consult('piloto.pl'),consult('resultados.pl'), findall(X,piloto(X,_,_,_,_,_,_,_),L),
							  listar_titulos_pilotos(L),
							  findall(num_titulos(X,N),num_titulos(X,N),Lnt),
							  aux_quicksort_titulos(Lnt,Lnt_Sorted),listar_mostra_mais_titulos(Lnt_Sorted).


listar_mostra_mais_titulos([]):-!.
listar_mostra_mais_titulos([num_titulos(X,N)|_]):- get_nome_piloto(X,Proprio,Apelido),
write('Piloto com mais Titulos: '),nl,nl,
write('Piloto com mais titulos: '),nl,
write('Numero de Piloto: '),write(X),nl,
write('Nome do Piloto: '),write(Proprio),write(' '),write(Apelido),nl,
write('Numero de Titulos: '),write(N),nl.


listar_titulos_pilotos([]):-!.
listar_titulos_pilotos([X|L]):-listar_contar_titulos_piloto(X,N),
										  write('O piloto '),write(X),
										  write(' tem '),write(N),write(' titulos.'),nl,
										  assertz(num_titulos(X,N)),
										  listar_titulos_pilotos(L).

listar_contar_titulos_piloto(X,N):-findall(ListaTitulos,piloto(X,_,_,_,_,_,ListaTitulos,_),L),achata(L,L_achatada),
listar_contar_elementos_lista_achatada(L_achatada,N).

listar_contar_elementos_lista_achatada([],0).
listar_contar_elementos_lista_achatada([titulo(_,_)|L],N):-listar_contar_elementos_lista_achatada(L,N1),N is N1+1.								


aux_quicksort_titulos([],[]).
aux_quicksort_titulos([X|Cauda],Ordenada) :-aux_quicksort_split_titulos(X,Cauda,Menor,Maior),
									aux_quicksort_titulos(Menor,OrdenadaMenor),
									aux_quicksort_titulos(Maior,OrdenadaMaior),
									aux_concatenar_titulos(OrdenadaMenor,[X|OrdenadaMaior],Ordenada).

aux_quicksort_split_titulos(_,[],[],[]).
aux_quicksort_split_titulos(num_titulos(_,N),[num_titulos(X1,N1)|Cauda],[num_titulos(X1,N1)|Menor],Maior):-
								aux_comparar_2titulos_decrescente(N,N1),!,
								aux_quicksort_split_titulos(num_titulos(_,N),Cauda,Menor,Maior).

aux_quicksort_split_titulos(num_titulos(X,N),[num_titulos(X1,N1)|Cauda],Menor,[num_titulos(X1,N1)|Maior]):-
						aux_quicksort_split_titulos(num_titulos(X,N),Cauda,Menor,Maior).
aux_concatenar_titulos([],L,L).
aux_concatenar_titulos([X|L1],L2,[X|L3]):-aux_concatenar_titulos(L1,L2,L3).

aux_comparar_2titulos_decrescente(X,Y):- X <Y.


get_nome_piloto(X,Proprio,Apelido):-setof(X,piloto(X,_,nome(Proprio,Apelido),_,_,_,_,_),_).

achata([], []) :- !.
achata([L|ListaSaida], ListaAchatada) :-
    !,
    achata(L, NovaLista),
    achata(ListaSaida, NovaListaSaida),
    append(NovaLista, NovaListaSaida, ListaAchatada).
achata(L, [L]).
