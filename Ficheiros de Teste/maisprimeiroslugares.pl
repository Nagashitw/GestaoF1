listar_piloto_mais_vitorioso:-consult('piloto.pl'),consult('resultados.pl'),findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
listar_piloto_mais_vitorioso:-consult('piloto.pl'),consult('resultados.pl'),findall(X,piloto(X,_,_,_,_,_,_,_),L),calcular_piloto_primeiros(L,Li),maximo_lista_primeiros(Li,Max),nl,listar_mostra_max(Max),nl.

listar_mostra_max(lugares(X,C)):- nl,write('O piloto com mais primeiros lugares e o piloto no '),write(X),write(' com '),write(C),write(' lugares.').

calcular_piloto_primeiros([],_).
calcular_piloto_primeiros([X|L],[lugares(X,C)|Li]):-calcular_piloto_primeiros(L,Li),calcular_N_primeiros_lugares(X,C).


maximo_lista_primeiros([lugares(X,C)],lugares(X,C)).
maximo_lista_primeiros([lugares(X,C),lugares(X1,C1)|Cauda],Max):-maximo_lista_primeiros([lugares(X1,C1)|Cauda],MaxCauda),maximo_primeiros(lugares(X,C),MaxCauda,Max).

maximo_primeiros(lugares(X,C),lugares(_,C1),lugares(X,C)):- C>=C1.
maximo_primeiros(lugares(_,C),lugares(X1,C1),lugares(X1,C1)):- C<C1.


calcular_N_primeiros_lugares(N_Piloto,Contador):- aux_calcular_n_primeiros_lugares(N_Piloto,Contador).

aux_calcular_n_primeiros_lugares(_,0):- findall(Lista_resultados,resultados(_,_,Lista_resultados),[]),!.
aux_calcular_n_primeiros_lugares(N_Piloto,Contador):- findall(Lista_resultados,resultados(_,_,Lista_resultados),L),
													listar_trata_primeiros_lugares(N_Piloto,L,Contador),nl,
													write('Numero do Piloto'),write(N_Piloto),nl,write('Numero de Primeiros Lugares: '),write(Contador),nl.

listar_trata_primeiros_lugares(_,[],0):-!.
listar_trata_primeiros_lugares(N_Piloto,[X|L],Contador):- listar_aux_trata_primeiros_lugares(N_Piloto,X, Contador_cabeca),
													listar_trata_primeiros_lugares(N_Piloto,L,Contador_Cauda),
													Contador is Contador_cabeca+Contador_Cauda.
														
listar_aux_trata_primeiros_lugares(_,[],0):-!.
listar_aux_trata_primeiros_lugares(X,Lista_resultados,Contador):-posicao_lista(Lista_resultados,X,Posicao),!,conta_posicoes(Posicao,Contador).
listar_aux_trata_primeiros_lugares(_,_,0).


conta_posicoes(1,Contador):- !,Contador is 1. 
conta_posicoes(_,Contador):-  Contador is 0. 





posicao_lista([X|_],X, 0):-!.
posicao_lista([_|Cauda],X,N):-posicao_lista(Cauda,X,N1),!,N is N1+1.

%consult('piloto.pl'),consult('resultados.pl'),findall(Lista_resultados,resultados(_,_,Lista_resultados),L).