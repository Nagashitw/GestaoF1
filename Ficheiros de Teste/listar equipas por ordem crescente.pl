listar_classificacao_equipas:-consult('piloto.pl'),findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_),[]),!,fail.
listar_classificacao_equipas:-consult('piloto.pl'),findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_),L), %set e para eliminar duplicados numa lista
								set(L, Lequipas),listar_calculo_pontos_equipas(Lequipas,Li),listar_quicksort_equipas(Li,Li_sorted),trata_Lisorted(Li_sorted).

trata_Lisorted([]):-!.
trata_Lisorted([pontuacao(X,Pontos)|L]):-write(' Equipa: '),write(X),write(' Pontos: '),write(Pontos),nl,trata_Lisorted(L).
%criar lista com pontuacao de cada equipa
listar_calculo_pontos_equipas([],_):-!.
listar_calculo_pontos_equipas([X|L],[pontuacao(X,Pontos)|Li]):-listar_calculo_pontos_equipas(L,Li),listar_soma_pontos_pilotos(X,Pontos).

%somar pontos dos pilotos da mesma equipa
listar_soma_pontos_pilotos(Equipa,Contador):- findall(pilotos_da_equipa(X,Pontuacao),piloto(X,Equipa,_,_,_,_,_,Pontuacao),L),
									listar_aux_pilotos_equipa(L,Contador).

listar_aux_pilotos_equipa([],0):-!.
listar_aux_pilotos_equipa([pilotos_da_equipa(_,Pontuacao)|L],Contador1):- listar_aux_pilotos_equipa(L,Contador), 
																		Contador1 is Contador + Pontuacao.  


listar_quicksort_equipas([],[]).
listar_quicksort_equipas([X|Tail],Sorted) :-aux_quicksort_split_equipas(X,Tail,Small,Big),
									listar_quicksort_equipas(Small,SortedSmall),
									listar_quicksort_equipas(Big,SortedBig),
									concatenar_sublistas_equipas(SortedSmall,[X|SortedBig],Sorted).

aux_quicksort_split_equipas(_,[],[],[]).
aux_quicksort_split_equipas(pontuacao(_,Pontos),[pontuacao(X1,Pontos1)|Tail],[pontuacao(X1,Pontos1)|Small],Big):-listar_comparacao_equipas(Pontos,Pontos1),!,aux_quicksort_split_equipas(pontuacao(_,Pontos),Tail,Small,Big).
aux_quicksort_split_equipas(pontuacao(_,_),[pontuacao(X1,Pontos1)|Tail],Small,[pontuacao(X1,Pontos1)|Big]):-aux_quicksort_split_equipas(pontuacao(X1,Pontos1),Tail,Small,Big).
concatenar_sublistas_equipas([],L,L).
concatenar_sublistas_equipas([X|L1],L2,[X|L3]):-concatenar_sublistas_equipas(L1,L2,L3).

listar_comparacao_equipas(X,Y):- X <Y. %devia ser X > Y mas como se pretende a ordem crescente (do piloto com mais pontos para o que

%Algumas funcoes uteis retiradas da internet
	% An empty list is a set.
set([], []).

% Put the head in the result,
% remove all occurrences of the head from the tail,
% make a set out of that.
set([H|T],[H|T1]):-remv(H,T,T2),set(T2,T1).
% Removing anything from an empty list yields an empty list.
remv(_,[],[]).

% If the head is the element we want to remove,
% do not keep the head and
% remove the element from the tail to get the new list.
remv(X,[X|T],T1) :- remv(X,T,T1).

% If the head is NOT the element we want to remove,
% keep the head and
% remove the element from the tail to get the new tail.
remv(X,[H|T],[H|T1]) :-X \= H,remv(X, T, T1).