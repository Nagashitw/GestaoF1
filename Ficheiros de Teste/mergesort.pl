
listar_classificacao_pilotos:-consult('piloto.pl'),findall(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),
	(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual)),Lista),
	msort(Lista,ListaOrdenada),
	write('Listagem de classificacoes por ordem crescente: '),nl,nl,aux_lista_ordenada(ListaOrdenada),nl.

aux_lista_ordenada([]):-!.
aux_lista_ordenada([piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual)|Cauda]):-
write('Numero de Piloto: '),write(N_Piloto),nl,
write('Nome: '),write(Proprio),write(' '),write(Apelido),nl,
write('Pontuacao Actual: '),write(Pontuacao_atual),nl,nl,aux_lista_ordenada(Cauda).

%piloto(n_piloto,equipa,nome(proprio,apelido), naturalidade, data_nasc(dia,mes,ano),morada,[titulo(ano,competicao)],pontuacao_atual).		

%(piloto[piloto(npiloto,_,nome(proprio,apelido),_,_,_,_,Pontuacao_atual)