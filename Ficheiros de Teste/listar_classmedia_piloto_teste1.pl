

listar_verifica_piloto_memoria(X):- findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
listar_verifica_piloto_memoria(X):- findall(X,piloto(X,_,_,_,_,_,_,_),_),nl.

posicao_lista([X|_],X, 0):-!.
posicao_lista([_|Cauda],X,N):-posicao_lista(Cauda,X,N1),!,N is N1+1.

%soma todos os elementos da lista
somatorio(0,[]):-!.
somatorio(X,[C|Cauda]):-somatorio(Y,Cauda),X is Y+C.

%conta o numero de elementos de uma lista.
contar_elementos_lista([],0).
contar_elementos_lista([_|Cauda],N):-contar_elementos_lista(Cauda,N1),N is N1+1.

%invoca as funcoes de somatorio para somar todos os elementos da lista, e conta os elementos para depois os dividir
media(X,L):-somatorio(S,L),contar_elementos_lista(L,N),X is S/N.

teste1:- consult('piloto.pl'),write('Npiloto'),read(X),nl,
								findall(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),
		     						  piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),L),
									  quicksort_pilotos(L,Lordenada),
									  posicao_lista(Lordenada,piloto(X,_,nome(Proprio,Apelido),_,_,_,_,_),Posicao),Posicao_Verdadeira is Posicao +1,
									  write('Numero de Piloto: '),write(X),nl,
									  write('Nome do Piloto: '),write(Proprio),write(' '),write(Apelido),nl,
									  write('Posicao Actual no Campeopnato: '),write(Posicao_Verdadeira),!.
									  %




mostrar_posicao_atual_campeonato(N_Piloto):-consult('piloto.pl'), listar_verifica_piloto_memoria(N_Piloto),!,
									  findall(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,_Pontuacao_atual),
		     						  piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),L),
									  quicksort_pilotos(L,Lordenada),posicao_lista(Lordenada,piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),N),Posicao is N + 1,
									  write('O piloto numero '),write(N_Piloto),write(' esta em '),write(Posicao),write('o lugar.'),nl.	

quicksort_pilotos([],[]).
quicksort_pilotos([X|Cauda],Ordenada) :-split_pilotos(X,Cauda,Menor,Maior),
									quicksort_pilotos(Menor,OrdenadaMenor),
									quicksort_pilotos(Maior,OrdenadaMaior),
									conc_pilotos(OrdenadaMenor,[X|OrdenadaMaior],Ordenada).

split_pilotos(_,[],[],[]).
split_pilotos(piloto(_,_,nome(_,_),_,_,_,_,Pontuacao_atual),[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Menor],Maior):-maior_que_pilotos(Pontuacao_atual,Pontuacao_atual1),!,split_pilotos(piloto(_,_,_,_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).
split_pilotos(piloto(N_Piloto,_,nome(Nome,Apelido),_,_,_,_,Pontuacao_atual),[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],Menor,[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Maior]):-split_pilotos(piloto(N_Piloto,_,nome(Nome,Apelido),_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).
conc_pilotos([],L,L).
conc_pilotos([X|L1],L2,[X|L3]):-conc_pilotos(L1,L2,L3).

maior_que_pilotos(X,Y):- X >Y. %devia ser X > Y mas como se pretende a ordem crescente (do piloto com mais pontos para o que tiver menos pontos usa-se o sinal de menor)

%findall(piloto(1,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),L)

%findall(piloto(X,_,nome_piloto(Proprio,Apelido),_,_,_,_,Pontuacao),
%		     						  piloto(X,_,nome(Proprio,Apelido),_,_,_,_,_,Pontuacao),L),
	%								  quicksort_pilotos(L,Lordenada),posicao_lista(Lordenada,piloto(Id_piloto,_,_,_,_,_,_,_),Posicao)