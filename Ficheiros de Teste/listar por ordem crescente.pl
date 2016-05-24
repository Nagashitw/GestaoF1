mostrar_quicksort_pilotos([],[]).
mostrar_quicksort_pilotos([Cabeca|Cauda],ListaOrdenada) :-mostrar_split_pilotos(Cabeca,Cauda,Menor,Maior),
									mostrar_quicksort_pilotos(Menor,OrdenadoMenor),
									mostrar_quicksort_pilotos(Maior,OrdenadoMaior),
									concatenar_sublistas_pilotos(OrdenadoMenor,[Cabeca|OrdenadoMaior],ListaOrdenada).

mostrar_split_pilotos(_,[],[],[]).
mostrar_split_pilotos(piloto(_,nome(_,_),_,_,_,_,Pontuacao_atual),
	[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],
	[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Menor],Maior):-

mostrar_comparacaologica_pilotos(Pontuacao_atual,Pontuacao_atual1),!,
mostrar_split_pilotos(piloto(_,_,_,_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).

mostrar_split_pilotos(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),
			[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Cauda],Menor,
			[piloto(N_Piloto1,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)|Maior]):-
mostrar_split_pilotos(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),Cauda,Menor,Maior).



concatenar_sublistas_pilotos([],L,L).
concatenar_sublistas_pilotos([Cabeca|L1],L2,[Cabeca|L3]):-concatenar_sublistas_pilotos(L1,L2,L3).

mostrar_comparacaologica_pilotos(X,Y):- X <Y.

listar_classificacao_pilotos:-consult('piloto.pl'),findall(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),
	(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual)),Lista),
	mostrar_quicksort_pilotos(Lista,ListaOrdenada),
	write('Listagem de classificacoes por ordem crescente: '),nl,nl,aux_lista_ordenada(ListaOrdenada),nl.

aux_lista_ordenada([]):-!.
aux_lista_ordenada([piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual)|Cauda]):-
write('Numero de Piloto: '),write(N_Piloto),nl,
write('Nome: '),write(Proprio),write(' '),write(Apelido),nl,
write('Pontuacao Actual: '),write(Pontuacao_atual),nl,nl,aux_lista_ordenada(Cauda).

%piloto(n_piloto,equipa,nome(proprio,apelido), naturalidade, data_nasc(dia,mes,ano),morada,[titulo(ano,competicao)],pontuacao_atual).		

%piloto[piloto(n_piloto,_,nome(_,_),_,_,_,_,Pontuacao_atual)

%piloto[piloto(N_Piloto,_,nome(Proprio1,Apelido1),_,_,_,_,Pontuacao_atual1)