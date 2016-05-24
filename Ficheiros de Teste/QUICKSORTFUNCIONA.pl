submenu_class_equipas:-write('Qual a ordem de ordenacao das equipas'),nl,
write(' 1- Ordem Crescente'),nl,
write(' 2- Ordem Descrescente'),nl,
write('Opcao: '),read(Op),nl,listar_classificacao_equipas(Op).

listar_classificacao_pilotos(1):-consult('piloto.pl'),findall(piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),
		     						  piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),L),
									  quicksort_pilotos(L,Lordenada),nl,
									  write('Listagem de classificacoes do campeonato por ordem crescente:'),nl,
									  listar_mostra_listar_ordenada(Lordenada).

listar_classificacao_pilotos(2):-consult('piloto.pl'),findall(piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),
		     						  piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),L),
									  quicksort_pilotos2(L,Lordenada),nl,
									  write('Listagem de classificacoes do campeonato por ordem decrescente:'),nl,
									  listar_mostra_listar_ordenada(Lordenada).



listar_mostra_listar_ordenada([]):-!.
listar_mostra_listar_ordenada([piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao)|L]):-nl,
	write('Numero de Piloto: '),write(X),nl,
	write('Nome do Piloto: '),write(Nome),write(' '),write(Proprio),nl,
	write('Pontuacao Atual: '),write(Pontuacao),nl, listar_mostra_listar_ordenada(L).

%Crescente
quicksort_pilotos2([],[]).
quicksort_pilotos2([X|Cauda],Ordenada) :-split_pilotos2(X,Cauda,Menor,Maior),
									quicksort_pilotos2(Menor,OrdenadaMenor),
									quicksort_pilotos2(Maior,OrdenadaMaior),
									conc_pilotos(OrdenadaMenor,[X|OrdenadaMaior],Ordenada).

split_pilotos2(_,[],[],[]).
split_pilotos2(piloto(_,_,nome(_,_),_,_,_,_,Pontuacao_atual),[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Menor],Maior):-comparar_2_pilotos_crescente(Pontuacao_atual,Pontuacao_atual1),!,split_pilotos2(piloto(_,_,_,_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).
split_pilotos2(piloto(N_Piloto,_,nome(Nome,Apelido),_,_,_,_,Pontuacao_atual),[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],Menor,[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Maior]):-split_pilotos2(piloto(N_Piloto,_,nome(Nome,Apelido),_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).
conc_pilotos([],L,L).
conc_pilotos([X|L1],L2,[X|L3]):-conc_pilotos(L1,L2,L3).

comparar_2_pilotos_crescente(X,Y):- X > Y.

%DECRESCENTE
comparar_2_pilotos_decrescente(X,Y):- X < Y.
quicksort_pilotos([],[]).
quicksort_pilotos([X|Cauda],Ordenada) :-split_pilotos(X,Cauda,Menor,Maior),
									quicksort_pilotos(Menor,OrdenadaMenor),
									quicksort_pilotos(Maior,OrdenadaMaior),
									conc_pilotos(OrdenadaMenor,[X|OrdenadaMaior],Ordenada).

split_pilotos(_,[],[],[]).
split_pilotos(piloto(_,_,nome(_,_),_,_,_,_,Pontuacao_atual),[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Menor],Maior):-comparar_2_pilotos_decrescente(Pontuacao_atual,Pontuacao_atual1),!,split_pilotos(piloto(_,_,_,_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).
split_pilotos(piloto(N_Piloto,_,nome(Nome,Apelido),_,_,_,_,Pontuacao_atual),[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],Menor,[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Maior]):-split_pilotos(piloto(N_Piloto,_,nome(Nome,Apelido),_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).
conc_pilotos([],L,L).
conc_pilotos([X|L1],L2,[X|L3]):-conc_pilotos(L1,L2,L3).