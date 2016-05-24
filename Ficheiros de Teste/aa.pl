listar_resultados_ordem_crescente:-consult('resultados.pl'),consult('piloto.pl'),write('ID Piloto: '),read(X),nl,get_nome_piloto(X,Proprio,Apelido),
									write('Nome do Piloto: '), write(Proprio), write(' '),write(Apelido),
									listar_classificacoes_piloto(X).						
listar_classificacoes_piloto(X):- listar_get_pontuacoes(Lclass),
								  listar_verificar_pontuacoes(X,Lclass,Li),
								  aux_quicksort_pontuacoes(Li,Ordenada),nl,write(' Piloto no '),write(X),nl,
								  write('::: Classificacoes ordenadas por ordem crescente :::'),
								  listar_mostrar_lista_ordenada(X,Ordenada).

listar_verificar_pontuacoes(_,[],[]):-!.
listar_verificar_pontuacoes(N_Piloto,[X|Cauda],[[Posicao,X]|Li]):- listar_verificar_pontuacoes(N_Piloto,Cauda,Li),
															posicao_lista(X,N_Piloto,Posicao).
listar_mostrar_lista_ordenada(N_Piloto,[]):-!.
listar_mostrar_lista_ordenada(N_Piloto,[[Posicao,X]|Cauda]):-nl,Pos_Verdadeira is Posicao +1, write(Pos_Verdadeira),write(' lugar - '),
												achata(X,Lista_Achatada),
												write('Lista de Pontuacoes: '),nl,imprime_lista(Lista_Achatada),nl,devolve_primeiro(Lista_Achatada,Y)
												get_nome_piloto(Y,Proprio,Apelido),write(Proprio),write(Apelido),nl,
												listar_mostrar_lista_ordenada(N_Piloto,Cauda),!.

get_nome_piloto(X,Proprio,Apelido):-setof(X,piloto(X,_,nome(Proprio,Apelido),_,_,_,_,_),_).

listar_get_pontuacoes(L):-	findall(ListaResultados,resultados(_,_,ListaResultados),L).

posicao_lista([X|_],X, 0):-!.
posicao_lista([_|Cauda],X,N):-posicao_lista(Cauda,X,N1),!,N is N1+1.

aux_quicksort_pontuacoes([],[]).
aux_quicksort_pontuacoes([X|Cauda],Ordenada) :-aux_quicksort_split_pontuacoes(X,Cauda,Menor,Maior),
									aux_quicksort_pontuacoes(Menor,OrdenadaMenor),
									aux_quicksort_pontuacoes(Maior,OrdenadaMaior),
									aux_concatenar_sublistas_pontuacoes(OrdenadaMenor,[X|OrdenadaMaior],Ordenada).

aux_quicksort_split_pontuacoes(_,[],[],[]).
aux_quicksort_split_pontuacoes([Posicao,_],[[Posicao1,X1]|Cauda],[[Posicao1,X1]|Menor],Maior):-
								aux_comparar_2pontuacoes(Posicao,Posicao1),!,
								aux_quicksort_split_pontuacoes([Posicao,_],Cauda,Menor,Maior).

aux_quicksort_split_pontuacoes([Posicao,X],[[Posicao1,X1]|Cauda],Menor,[[Posicao1,X1]|Maior]):-
						aux_quicksort_split_pontuacoes([Posicao,X],Cauda,Menor,Maior).
aux_concatenar_sublistas_pontuacoes([],L,L).
aux_concatenar_sublistas_pontuacoes([X|L1],L2,[X|L3]):-aux_concatenar_titulos(L1,L2,L3).

aux_concatenar_titulos([],L,L).
aux_concatenar_titulos([X|L1],L2,[X|L3]):-aux_concatenar_titulos(L1,L2,L3).


aux_comparar_2pontuacoes(X,Y):- X >Y.


achata([], []) :- !.
achata([L|ListaSaida], ListaAchatada) :-
    !,
    achata(L, NovaLista),
    achata(ListaSaida, NovaListaSaida),
    append(NovaLista, NovaListaSaida, ListaAchatada).
achata(L, [L]).

%imrpime uma lista com uma melhor formatacao
imprime_lista([]).
imprime_lista([C|Cauda]) :-
        write(' '),write(C),write(' '),
        imprime_lista(Cauda).

% Contador de Posicoes
conta_posicoes(1,Contador):- !,Contador is 1. 
conta_posicoes(_,Contador):-  Contador is 0. 

devolve_primeiro([],_):-!,fail.
devolve_primeiro([C|Cauda]:- X is C),devolve_primeiro(Cauda).