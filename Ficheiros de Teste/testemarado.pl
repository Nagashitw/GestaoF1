%::::: 5a ::::::::::::::::::Visualizar dados completos de pilotos:::::::::: v :::%
listar_pilotos:-consult('piloto.pl'),nl,findall(piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   L),mostrar_L(L).

mostrar_L([]):-!.
mostrar_L([piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual)|L]):-
write('||=============================================================================================|'),nl,
write('|| Piloto:  ['),write(Numero),write('] '),write(Proprio),write(' '),write(Apelido),nl,
write('||'),tab(1),write('Equipa: '),write(Equipa),nl,
write('||'),tab(1),write('Naturalidade: '),write(Naturalidade),nl,
%write('||'),tab(1),write('Nacionalidade: '),write(Nacionalidade),nl,
write('||'),tab(1),write('Data de Nascimento: '),write(Dia),write('-'),write(Mes),write('-'),write(Ano),nl,
write('||'),tab(1),write('Morada: '),write(Morada),nl,
write('||'),tab(1),write('Pontuacao: '),write(Pontuacao_atual),nl,
write('||'),tab(1),write('----------------'),nl,
write('||'),tab(1),write(' Lista Titulos  '),nl,
write('||'),tab(1),write('----------------'),nl,
tab(1),write(' '),tratar_mostrar_lista_titulos(ListaTitulos),mostrar_L(L),nl.

tratar_mostrar_lista_titulos([]):-write('Sem titulos a mostrar / Fim da lista!'),nl.
tratar_mostrar_lista_titulos([titulo(Ano,Competicao)|L]):- write(' '),write(Ano),write(' - '),write(Competicao),nl,tratar_mostrar_lista_titulos(L).