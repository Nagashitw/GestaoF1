ler_numero(X)	:-	read(X).

escreve_menu :- tab(20),
write('================================ CALENDARIO DE FORMULA 1 ==========================='),nl,tab(20),
write('         _____    ___                                                               '),nl,tab(20),
write('        |    ___| |_    |                                                           '),nl,tab(20),  
write('        |   |__       |   |                                                         '),nl,tab(20),
write('        |    __|      |   |                                                         '),nl,tab(20), 
write('        |   |           |   |                                                       '),nl,tab(20),
write('        | _|           |  _|                                                        '),nl,tab(20),
write('                                                                                    '),nl,tab(20),
write('                                                                                    '),nl,tab(20),      
write('===================================================================================='),nl,tab(20),
write('(1)  Adicionar:                                                                     '),nl,tab(20),
write('(2)  Adicionar resultados                                                           '),nl,tab(20),
write('(3)  Remover dados:                                                                 '),nl,tab(20),
write('(4)  Modificar dados:                                                               '),nl,tab(20),
write('(5)  Visualizar dados completos:                                                    '),nl,tab(20),
write('(6)  Pesquisar por campos:                                                          '),nl,tab(20),
write('(7)  Atualizar pontuacao dos pilotos                                                '),nl,tab(20),
write('(8)  Listar classificacao atual dos pilotos no campeonato por ordem crescente.      '),nl,tab(20),
write('(9)  Listar classificacao atual das equipas no campeonato por ordem crescente.      '),nl,tab(20),
write('(10) Listar resultados de uma prova com identificacao dos pilotos.                  '),nl,tab(20),
write('(11) Mostrar a posicao atual de um piloto no campeonato                             '),nl,tab(20),
write('(12) Listar classificacao media de determinado piloto nas provas ja realizadas.     '),nl,tab(20),
write('(13) Listar as classificacoes de um piloto por ordem crescente de posicao.          '),nl,tab(20),
write('(14) Piloto com mais 1o lugares.                                                    '),nl,tab(20),
write('(15) Mostrar piloto com mais titulos.                                               '),nl,tab(20),
write('(16) Mostrar piloto mais velho a competir                                           '),nl,tab(20),
write('(17) Guardar dados que estejam a ser manipulados em memoria em ficheiro.            '),nl,tab(20),
write('===================================================================================='),nl,tab(20),
write('     Outras funcionalidades                                                         '),nl,tab(20),
write('(18) Calcular o numero de pessoas que ganharam um titulo numa pista.                '),nl,tab(20),
write('(19) Calcular comprimento da volta individual de cada pista.                        '),nl,tab(20),
write('(20)	Verificar se um piloto ficou classificado numa dada prova.                     '),nl,tab(20),
write('(21)	Sobre o Projeto                                                                '),nl,tab(20),
write('===================================================================================='),nl,tab(20),
write('(0)  SAIR                                                                           '),nl,tab(20),
write('===================================================================================='),nl.


% ==================================== PREDICADOS SUBMENUS=========================================%

escreve_submenu_adicionar:-
write('|======== Adicionar ========|'),nl,
write('| a. Pilotos                |'),nl,
write('| b. Pistas                 |'),nl,
write('|===========================|'),nl,
read(X),escreve_submenu_adicionar(X).


escreve_submenu_remover:-
write('|========= Remover =========|'),nl,
write('| a. Pilotos                |'),nl,
write('| b. Pistas                 |'),nl,
write('| c. Resultados             |'),nl,
write('|===========================|'),nl,
read(X),escreve_submenu_remover(X).

escreve_submenu_modificar:-
write('|======== Modificar ========|'),nl,
write('| a. Pilotos                |'),nl,
write('| b. Pistas                 |'),nl,
write('| c. Resultados             |'),nl,
write('|===========================|'),nl,
read(X),escreve_submenu_modificar(X).

escreve_submenu_listar:-
write('|======== Visualizar dados completos ========|'),nl,
write('| a. Pilotos                                 |'),nl,
write('| b. Pistas                                  |'),nl,
write('| c. Resultados                              |'),nl,
write('|============================================|'),nl,
read(X),escreve_submenu_listar(X).

escreve_submenu_pesquisar:-
write('|======== Pesquisar por campos ========|'),nl,
write('| a. Dos Pilotos                       |'),nl,
write('| b. Das Pistas                        |'),nl,
write('|======================================|'),nl,
read(X),escreve_submenu_pesquisar(X).

escreve_submenu_adicionar(a):-write('Digite o numero do piloto a inserir'),nl,read(X),inserir_piloto(X).
escreve_submenu_adicionar(b):-write('Digite o numero da pista a inserir'),nl,read(X),inserir_pista(X).

escreve_submenu_remover(a):-write('Digite o numero do piloto a remover'),nl,read(X),remover_piloto(X).
escreve_submenu_remover(b):-write('Digite o numero da pista a remover'),nl,read(X),remover_pista(X).
escreve_submenu_remover(c):-write('Digite o resultado a remover'),nl,read(X),remover_pista(X).

escreve_submenu_modificar(a):-write('Digite o numero do piloto a modificar'),nl,read(X),modificar_piloto(X).
escreve_submenu_modificar(b):-write('Digite o numero da pista a modificar'),nl,read(X),modificar_pista(X).
escreve_submenu_modificar(c):-write('Digite o resultado a modificar'),nl,read(X),modificar_resultado(X).

escreve_submenu_listar(a):-write('Digite o numero do piloto para ver os seus dados completos'),nl,read(X),listar_pilotos(X).
escreve_submenu_listar(b):-write('Digite o numero da pista para ver os seus dados completos'),nl,read(X),listar_pistas(X).
escreve_submenu_listar(c):-write('Digite o resultado que deseja ver'),nl,listar_resultados.

escreve_submenu_pesquisar(a):-write('Pesquisar piloto por campos'),nl,read(X),pesquisa_piloto_campos(X).
escreve_submenu_pesquisar(b):-write('Pesquisar pistas por campos'),nl,read(X),pesquisar_pistas_campos(X).


% ==================================== PREDICADOS MENU=========================================%

menu:-
consult('pilotos.pl'),consult('resultados.pl'),
escreve_menu,write('Escolha uma opcao seguida de ponto final ( Ex: 1.) **'),nl,
ler_numero(X),menu(X).


menu(0):-!.
menu(1):-escreve_submenu_adicionar.
menu(2):-inserir_resultado.
menu(3):-escreve_submenu_remover.
menu(4):-escreve_submenu_modificar.
menu(5):-escreve_submenu_listar.
menu(6):-escreve_submenu_pesquisar.
menu(7):-write('Numero do Piloto a atualizar: '),read(X),atualizar_pontuacao_pilotos(X).
menu(8):-listar_classificacao_pilotos.
menu(9):-listar_classificacao_equipas.
menu(10):-listar_resultados_com_identificacao.
menu(11):-write('Numero do Piloto: '),read(X),mostrar_posicao_atual_campeonato(X).
menu(12):-write('Numero de Piloto: '),read(X),listar_classificacao_media_piloto(X).
menu(13):-write('Numero de Piloto: '),read(X),listar_classificacoes_piloto(X).
menu(14):-mostrar_piloto_1lugares.
menu(15):-mostrar_piloto_mais_titulos.
menu(16):-mostrar_mais_velho.
menu(17):-save_all.
menu(18):-write('Numero da Pista: '),read(X),mostrar_pista_com_mais_resultados(X).
menu(19):-write('Numero da Pista: '),read(X),calcular_comprimento_volta(X).
menu(20):-write('Piloto No: '),read(X),nl,
		  write('Dia da Prova: '),read(Dia1),nl,
		  write('Mes da Prova: (com plicas) '),read(Mes),nl,
		  write('Ano da Prova: '),read(Ano),nl,
		  verificar_classificacao_piloto(X,Dia1,Mes,Ano).
menu(21):-write('======== Sobre ========='),nl,
		  write(' Projeto realizado por  '),nl,
		  write('    Ana Mateus no12091  '),nl.

% ============================== FUNCOES AUXILIARES=========================================%

piloto_existe(X):- findall(X,piloto(X,_,_,_,_,_,_,_,_),[]),!,fail.
piloto_existe(X):- findall(X,piloto(X,_,_,_,_,_,_,_,_),_),write('O piloto existe!'),nl.


piloto_existee(X):- findall(X,piloto(X,_,_,_,_,_,_,_,_),[]),!,fail.
piloto_existee(X):- findall(X,piloto(X,_,_,_,_,_,_,_,_),_),nl.


pista_existe(X):- read(P),compara_pistas(X,P).
compara_pistas(_,end_of_file):-!.
compara_pistas(X,pista(X,_,_,_,_)):-!,write('A pista existe!'),fail.
compara_pistas(X,_):- pista_existe(X).

pista_existe2(X):- read(P),compara_pistas2(X,P).
compara_pistas2(_,end_of_file):-!.
compara_pistas2(X,pista(X,_,_,_,_)):-!.
compara_pistas2(X,_):- pista_existe2(X).


copia(A,B):- see(A),tell(B),copia_ficheiro,seen,told.
copia_ficheiro:-read(X),copia_aux(X).
copia_aux(end_of_file):-!.
copia_aux(X):- writeq(X), write('.'),nl,copia_ficheiro.


contar_elementos_lista([],0).
contar_elementos_lista([_|L],N):-contar_elementos_lista(L,N1),N is N1+1.


quicksort([],[]).
quicksort([X|Tail],Sorted) :-split( X, Tail, Small, Big),
							quicksort(Small,SortedSmall),
							quicksort(Big,SortedBig),
				conc(SortedSmall,[X|SortedBig],Sorted).

split(_,[],[],[]).
split(X,[Y|Tail],[Y|Small],Big):-maior_que(X,Y),!,split(X,Tail,Small,Big).
split(X,[Y|Tail],Small,[Y|Big]):-split(X,Tail,Small,Big).
conc([],L,L).
conc([X|L1],L2,[X|L3]):-conc(L1,L2,L3).

maior_que(X,Y):- X >Y.


concatenar([],L,L).
concatenar([C|CL1],L2,[C|Cauda]):-concatenar(CL1,L2,Cauda).

inverte_lista([],[]).
inverte_lista([C|Cauda],Li):-inverte_lista(Cauda,Cauda_invertida),concatenar(Cauda_invertida,[C],Li).


maxlist([X],X).
maxlist([X,Y|Rest],Max):-maxlist([Y|Rest],MaxRest),max(X,MaxRest,Max).

max(X,Y,X):- X>=Y.
max(X,Y,Y):- X<Y.


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

adicionar_elemento_fim(X,[],[X]).
adicionar_elemento_fim(X,[A|L],[A|L1]):-adicionar_elemento_fim(X,L,L1).


% posiçao na lista
posicao_lista([X|_],X, 0):-!.
posicao_lista([_|Tail],X,Index):-posicao_lista(Tail,X,Index1),!,Index is Index1+1.


achata([], []) :- !.
achata([L|Ls], FlatL) :-
    !,
    achata(L, NewL),
    achata(Ls, NewLs),
    append(NewL, NewLs, FlatL).
achata(L, [L]).


membro(X,[X|_]).
membro(X,[_|T]):- membro(X,T).

% ::::::::::::::::::::::::::::::::::::::%
% ::        Predicados das            ::% 
% ::        Opções do Menu            ::%
% ::::::::::::::::::::::::::::::::::::::%


%::::: 1a ::::::::::::::::: Adicionar Pilotos::::::::::: v :::%
inserir_piloto(X):- piloto_existe(X),!,listing(piloto).
inserir_piloto(X):- write('O piloto nao existe! Inserir Piloto: '),nl,
write('Equipa: '),read(Equipa),nl,
write('Nome do Piloto: '),read(Proprio),write('Apelido: '),read(Apelido),nl,
write('Naturalidade: '),read(Naturalidade),nl,
write('Nacionalidade: '),read(Nacionalidade),nl,
write('Data de Nascimento: Dia: '),read(Dia),write('Mes: '),read(Mes),write('Ano: '),read(Ano),nl,
write('Morada: '),read(Morada),nl,
write('Titulos: '),pedelista(Li,Lf),nl,
write('Pontuacao: '),read(Pontuacao),nl,
assertz(piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,Lf,Pontuacao)),nl,
write('Piloto inserido com sucesso!'),nl,listing(piloto).

pedelista(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica(X,Li,Lf).
verifica('s',Li,[titulo(X,Y)|Lf]):-!,write('Ano? '),read(X),write('Competicao? '),read(Y),pedelista(Li,Lf).
verifica(_,Li,Li).

%::::: 1b ::::::::::::::::::Adicionar Pistas:::::::::: v :::%
inserir_pista(X):- see('pistas.txt'),pista_existe(X),seen,!,aux_inserir_pista(X).
inserir_pista(_):- fail.

aux_inserir_pista(X):-write('Inserir dados da pista: '),nl,
write('Nome da Pista: '),read(Nome_pista),nl,
write('Pais: '),read(Pais),nl,
write('Descricao: Voltas: '),read(Voltas),write('Percurso: '),read(Percurso),write('Localizacao: '),read(Localizacao),nl,
write('Resultados: '),pedelista_pistas_resultados(Li,Lf),nl,
see('pistas.txt'),tell('copia_pistas.txt'),
escreve_pista(pista(X,
			 Nome_pista,
			 Pais,
			 descricao(Voltas,Percurso,Localizacao),
			 Lf)),
seen,nl,told,write('Pista inserida com sucesso!'),copia('copia_pistas.txt','pistas.txt').

escreve_pista(Pista):-read(X),escreve_pista_aux(Pista,X).
escreve_pista_aux(Pista,end_of_file):-writeq(Pista),write('.'),!.
escreve_pista_aux(Pista,X):- writeq(X), write('.'),nl,escreve_pista(Pista).

pedelista_pistas_resultados(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica_pistas_resultados(X,Li,Lf).
verifica_pistas_resultados('s',Li,[resultados(X,Y)|Lf]):-!,write('Nome Piloto? '),read(X),write('Ano? '),read(Y),pedelista_pistas_resultados(Li,Lf).
verifica_pistas_resultados(_,Li,Li).


%::::: 2 :::::::::::::::::::Adicionar resultados:::::::::: v :::%
inserir_resultado:-write('::Divulgar resultados::'),nl,
write('Digite o numero da pista: '),read(X),nl,
write('Data da Prova:   '),write('Dia inicio: '),read(Dia1),
								write(' Dia fim: '),read(Dia2),
								write(' Mes: '),read(Mes),
								write(' Ano: '),read(Ano),
devolve_numero_pilotos(N),
devolve_lista_classificacoes([],L,N),
assertz(resultado(X,data_prova(Dia1,Dia2,Mes,Ano),L)),nl,
write('Resultado inserido com sucesso!').


% 20-20+1 = 1    20-N+1   20-5+1 = 16º lugar

devolve_lista_classificacoes(L,L, 0):-!.
devolve_lista_classificacoes(Li,[Aux|Lf],N):- P is 10-N+1,write('Piloto posicao '),write(P),write(':'),read(Aux),N1 is N-1,devolve_lista_classificacoes(Li,Lf,N1).


devolve_numero_pilotos(0):-findall(X,piloto(X,_,_,_,_,_,_,_,_),[]).
devolve_numero_pilotos(N):-findall(X,piloto(X,_,_,_,_,_,_,_,_),L),contar_elementos_lista(L,N).

%::::: 3a ::::::::::::::::::Remover dados de pilotos:::::::::: v :::%
remover_piloto(X):-retract(piloto(X,_,_,_,_,_,_,_,_)),
				   listing(piloto),
				   told,
				   write('Piloto removido com sucesso!'),tratar_resultados_idpiloto(X),nl,write('Resultados atualizados').

tratar_resultados_idpiloto(_):-findall(resultado(1,data_prova(Dia1,Dia2,Mes,Ano),Lista),
										resultado(1,data_prova(Dia1,Dia2,Mes,Ano),Lista),[]),!,fail.
tratar_resultados_idpiloto(X):-findall(resultado(1,data_prova(Dia1,Dia2,Mes,Ano),Lista),
										resultado(1,data_prova(Dia1,Dia2,Mes,Ano),Lista),L),tratar_lista_resultados_idpiloto(X,L).

tratar_lista_resultados_idpiloto(X,[resultado(Id,data_prova(Dia1,Dia2,Mes,Ano),Li)|L]):- remover_elemento_lista(X,Li,Lnova),
assertz(resultado(Id,data_prova(Dia1,Dia2,Mes,Ano),Lnova)),retract(resultado(Id,_,_)),tratar_lista_resultados_idpiloto(X,L).

remover_elemento_lista(_,[],[]).
remover_elemento_lista(X,[X|Cauda],Cauda).
remover_elemento_lista(X,[Y|Cauda],[Y|Cauda1]):-remover_elemento_lista(X,Cauda,Cauda1).


%::::: 3b ::::::::::::::::::Remover dados de pistas:::::::::: v :::%
remover_pista(X):- see('pistas.txt'),tell('copia.txt'),ler_remover(X),seen,told.
ler_remover(X):- read(T),aux_remover(X,T).
aux_remover(_,end_of_file):-!.
aux_remover(X,pista(X,_,_,_,_)):- !,ler_remover(X).
aux_remover(X,T):- writeq(T),write('.'),nl,ler_remover(X).

%falta copiar ficheiro copia para pistas
%::::: 3c ::::::::::::::::::Remover dados de resultados:::::::::: v :::%
remover_resultados(Id_pista,Dia1,Dia2,Mes,Ano):-retract(resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),_)),
				   listing(resultado),
				   told,
				   write('Resultado removido com sucesso!').
%decrescimo nos pontos dos jogadores,atualizar pontuacao
%::::: 4a ::::::::::::::::::Modificar dados de pilotos:::::::::: v :::%
modificar_piloto(X):- piloto_existe(X),!,menu_modificar_piloto(X).
modificar_piloto(_):- write('O piloto selecionado nao existe!'),nl.


menu_modificar_piloto(X):-	write('Escolha que dados modificar'),nl,
write(' [1]	Equipa'),nl,
write(' [2]	Morada'),nl,
write(' [3]	Pontuacao'),nl,
read(N),nl,menu_modificar_piloto_aux(X,N).


menu_modificar_piloto_aux(X,1)	:-	write('Nova Equipa: '),read(Equipa),nl,
piloto(X,_,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,Lista_titulos,Pontuacao),
assertz(piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,Lista_titulos,Pontuacao)),
retract(piloto(X,_,_,_,_,_,_,_,_)).

menu_modificar_piloto_aux(X,2)	:-	write('Nova Morada: '),read(Morada),nl,
piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),_,Lista_titulos,Pontuacao),
assertz(piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,Lista_titulos,Pontuacao)),
retract(piloto(X,_,_,_,_,_,_,_,_)).

menu_modificar_piloto_aux(X,3)	:-	write('Nova Pontuacao'),read(Pontuacao),nl,
piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,Lista_titulos,_),
assertz(piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,Lista_titulos,Pontuacao)),
retract(piloto(X,_,_,_,_,_,_,_,_)).

%::::: 4b ::::::::::::::::::Modificar dados de pistas::::::::::  :::%
modificar_pista(X)	:-	see('pistas.txt'),pista_existe2(X),seen,!,remover_pista(X),inserir_pista(X),see('copia_pistas.txt'),read(Copia),seen,append('copia.txt'),write(Copia),write('.'),told.
modificar_pista(_)	:-	write('A pista nao existe!'),nl.
%::::: 4c ::::::::::::::::::Modificar dados de resultados:::::::::: v :::%
modificar_resultado(Dia1,Mes,Ano):- resultado_existe(Dia1,Mes,Ano),!,modificar_resultado_aux(Dia1,Mes,Ano).
modificar_resultado(_,_,_):- write('O resultado selecionado nao existe! '),nl.

modificar_resultado_aux(Dia1,Mes,Ano):-write('Digite a nova lista de resultados: '),
devolve_numero_pilotos(N),devolve_lista_classificacoes([],L,N),
resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),_),
assertz(resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),L)),
retract(resultado(Id_pista,_,_)).

resultado_existe(Dia1,Mes,Ano):-findall(data_prova(Dia1,Mes,Ano),resultado(_,data_prova(_,_,_,_),_),[]),!,fail.
resultado_existe(Dia1,Mes,Ano):-findall(data_prova(Dia1,Mes,Ano),resultado(_,data_prova(Dia1,_,Mes,Ano),_),_),write('O resultado existe!'),nl.

%::::: 5a ::::::::::::::::::Visualizar dados completos de pilotos:::::::::: v :::%
listar_pilotos:-nl,findall(piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   L),mostrar_L(L).

mostrar_L([]):-!.
mostrar_L([piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual)|L]):-
write('||=============================================================================================|'),nl,
write('|| Piloto:  ['),write(Numero),write('] '),write(Proprio),write(' '),write(Apelido),nl,
write('||'),tab(1),write('Equipa: '),write(Equipa),nl,
write('||'),tab(1),write('Naturalidade: '),write(Naturalidade),nl,
write('||'),tab(1),write('Nacionalidade: '),write(Nacionalidade),nl,
write('||'),tab(1),write('Data de Nascimento: '),write(Dia),write('-'),write(Mes),write('-'),write(Ano),nl,
write('||'),tab(1),write('Morada: '),write(Morada),nl,
write('||'),tab(1),write('Pontuacao: '),write(Pontuacao_atual),nl,
write('||'),tab(1),write('----------------'),nl,
write('||'),tab(1),write(' Lista Titulos  '),nl,
write('||'),tab(1),write('----------------'),nl,
tab(1),write(' '),tratar_mostrar_lista_titulos(ListaTitulos),mostrar_L(L),nl.

tratar_mostrar_lista_titulos([]):-write('Sem titulos a mostrar / Fim da lista!'),nl.
tratar_mostrar_lista_titulos([titulo(Ano,Competicao)|L]):- write(' '),write(Ano),write(' - '),write(Competicao),nl,tratar_mostrar_lista_titulos(L).
%::::: 5b ::::::::::::::::::Visualizar dados completos de pistas:::::::::: v :::%

listar_pistas :- nl,see('pistas.txt'), read(T),aux_listar_pistas(T),seen.
aux_listar_pistas(end_of_file):- !.
aux_listar_pistas(pista(Id_pista,Nome_pista,Pais,descricao(Voltas,Percurso,Localizacao),ListaResultados)):-
write('ID Pista: '),write(Id_pista),nl,
write('Pais: '),write(Pais),nl,
write('Nome da Pista: '),write(Nome_pista),nl,
write('[Descricao] Voltas: '),write(Voltas),write(' Percurso: '),write(Percurso),write(' Localizacao: '),write(Localizacao),nl,
write(' Resultados   '),nl,tab(2),
tratar_mostrar_lista_resultados_pista(ListaResultados),nl,listar_pistas.

tratar_mostrar_lista_resultados_pista([]):-write('Sem titulos a mostrar / Fim da lista!'),nl.
tratar_mostrar_lista_resultados_pista([resultados(Num_piloto,Ano)|L]):-write(Num_piloto),write('-'),write(Ano),nl,tratar_mostrar_lista_resultados_pista(L).

%::::: 5c ::::::::::::::::::Visualizar dados completos de resultados:::::::::: v :::%
listar_resultados:-nl,write(':::::  Resultados  :::::'),nl,
findall(resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),Classificacao),
		resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),Classificacao),L),mostrar_L_resultados(L).

mostrar_L_resultados([]):-!.
mostrar_L_resultados([resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),Classificacao)|L]):-
write('  ID Pista: '),write(Id_pista),nl,
write('  Data da prova:  De '),write(Dia1),write(' a '),write(Dia2),write(' de '),write(Mes),write(' de '),write(Ano),nl,
write('  Classificacao: '),nl,tratar_classificacao(Classificacao),nl,mostrar_L_resultados(L),nl.

tratar_classificacao([]):-write('Sem resultados a mostrar / Fim da lista!'),nl.
tratar_classificacao([X|L]):-write(X),write(' - '),devolve_nome_piloto(X,Nome,Apelido),write(Nome),write(' '),write(Apelido),nl, tratar_classificacao(L).

devolve_nome_piloto(X,Nome,Apelido):-setof(X,piloto(X,_,nome_piloto(Nome,Apelido),_,_,_,_,_,_),_).

%::::: 6a ::::::::::::::::::Pesquisar por campos dos pilotos:::::::: v :::%
pesquisar_campos_piloto:- write('::::: Pesquisar por campos ::::::'),
nl,write('Escolher valor: 1 - ID  2- Apelido'),nl,read(X),verifica_campos_piloto(X).

verifica_campos_piloto(1):-!,write('Numero?  '),read(A),pesquisa_campos_piloto_id(A).
verifica_campos_piloto(2):-!,write('Apelido? '),read(A),pesquisa_campos_piloto_nome(A).
verifica_campos_piloto(_):-!.

pesquisa_campos_piloto_id(X):- findall(piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
									   piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),[]),!,fail.
pesquisa_campos_piloto_id(X):- findall(piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
									   piloto(X,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),L),
write('::Resultados da pesquisa por Numero: ::'),nl,mostrar_L_pesquisa(L).


pesquisa_campos_piloto_nome(X):- findall(piloto(Num,Equipa,nome_piloto(Proprio,X),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
									     piloto(Num,Equipa,nome_piloto(Proprio,X),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),[]),!,fail.
pesquisa_campos_piloto_nome(X):- findall(piloto(Num,Equipa,nome_piloto(Proprio,X),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
									     piloto(Num,Equipa,nome_piloto(Proprio,X),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),L),
write('::Resultados da pesquisa por Apelido: ::'),nl,mostrar_L_pesquisa(L).

mostrar_L_pesquisa([]):-!.
mostrar_L_pesquisa([piloto(X,_,nome_piloto(Proprio,Apelido),_,_,_,_,_,_)|L]):-
write('|| Piloto:  ['),write(X),write('] '),write(Proprio),write(' '),write(Apelido),nl,mostrar_L_pesquisa(L),nl.

%::::: 6b ::::::::::::::::::Pesquisar por campos das pistas:::::::::: v :::%
pesquisar_campos_pistas:- write('::::: Pesquisar por campos ::::::'),
nl,write('Escolher valor: 1 - Nome da pista 2- Localizacao'),nl,read(X),verifica_campos_pistas(X).

verifica_campos_pistas(1):-!,write('Nome da Pista? (com plicas) '),read(A),pesquisa_campos_pistas_nome(A).
verifica_campos_pistas(2):-!,write('Localizacao? (com plicas) '),read(A),pesquisa_campos_pistas_localizacao(A).
verifica_campos_pistas(_):-!.


pesquisa_campos_pistas_nome(X):- see('pistas.txt'),read(T),aux_pesquisar_campos_pistas_nome(X,T),seen. 
pesquisa_campos_pistas_localizacao(X):- see('pistas.txt'),read(T),aux_pesquisar_campos_pistas_localizacao(X,T),seen.

aux_pesquisar_campos_pistas_nome(_,end_of_file)	:-	!.
aux_pesquisar_campos_pistas_nome(X,pista(Id_pista,X,_,descricao(_,_,Localizacao),_)):- !,write(':: Resultados da pesquisa por nome: ['),write(X),write('] ::'),nl,write('Numero: '),write(Id_pista), write(' '),write(X),write(' Localizacao: '),write(Localizacao),nl, pesquisa_campos_pistas_nome(X).
aux_pesquisar_campos_pistas_nome(X,_):- pesquisa_campos_pistas_nome(X).

aux_pesquisar_campos_pistas_localizacao(_,end_of_file)	:-	!.
aux_pesquisar_campos_pistas_localizacao(X,pista(Id_pista,Nome,_,descricao(_,_,X),_)):- !,write(':: Resultados da pesquisa por localizacao: ['),write(X),write('] ::'),nl,write('Numero: '),write(Id_pista),write(' Localizacao: '),write(X), write(' Nome: '),write(Nome),nl.
aux_pesquisar_campos_pistas_localizacao(X,_):- pesquisa_campos_pistas_localizacao(X).

%::::: 7 :::::::::::::::::::Atualizar pontuação dos pilotos:::::::::: v :::%

atualizar_tudo:-findall(X,piloto(X,_,_,_,_,_,_,_,_),[]),!,fail.
atualizar_tudo:-findall(X,piloto(X,_,_,_,_,_,_,_,_),L), write(L),trata_atualizar_tudo(L),nl,
write('Pontuacoes atualizadas!'),listing(piloto).

trata_atualizar_tudo([]):-!.
trata_atualizar_tudo([X|L]):- write(X),atualizar_pontuacao_pilotos(X), trata_atualizar_tudo(L).


atualizar_pontuacao_pilotos(Id_Piloto):-calcular_pontuacao_piloto(Id_Piloto,NovaPontuacao),
	piloto(Id_Piloto,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,Lista_titulos,_),
	write(Id_Piloto),nl,
	retract(piloto(Id_Piloto,_,_,_,_,_,_,_,_)),
    write('qq coisa'),nl,
    assertz(piloto(Id_Piloto,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,
    	data_nasc(Dia,Mes,Ano),Morada,Lista_titulos,NovaPontuacao)).


calcular_pontuacao_piloto(X,Pontuacao):-aux_calcular_pontuacao_piloto(X,Pontuacao).

aux_calcular_pontuacao_piloto(_,0):-findall(Lista_resultados,
										  resultado(_,_,Lista_resultados),[]),!.
aux_calcular_pontuacao_piloto(X,Pontuacao):-findall(Lista_resultados,
										  resultado(_,_,Lista_resultados),L),trata_lista_resultados_pontuacoes(X,L,Pontuacao).


atribuir_pontos(1,Pontos):-!,Pontos is 25.
atribuir_pontos(2,Pontos):-!,Pontos is 18.
atribuir_pontos(3,Pontos):-!,Pontos is 15.
atribuir_pontos(4,Pontos):-!,Pontos is 12.
atribuir_pontos(5,Pontos):-!,Pontos is 10.
atribuir_pontos(6,Pontos):-!,Pontos is 8.
atribuir_pontos(7,Pontos):-!,Pontos is 6.
atribuir_pontos(8,Pontos):-!,Pontos is 4.
atribuir_pontos(9,Pontos):-!,Pontos is 2.
atribuir_pontos(10,Pontos):-!,Pontos is 1.
atribuir_pontos(_,Pontos):-Pontos is 0.


trata_lista_resultados_pontuacoes(_,[],0):-!.
trata_lista_resultados_pontuacoes(X,[Lista_resultados|L],Pontuacao):-
aux_trata_lista_resultados_pontuacoes(X,Lista_resultados,PontuacaoCabeca),trata_lista_resultados_pontuacoes(X,L,PontuacaoCauda),
									Pontuacao is PontuacaoCauda+PontuacaoCabeca.

aux_trata_lista_resultados_pontuacoes(_,[],0):-!.
aux_trata_lista_resultados_pontuacoes(X,Lista_resultados,Pontuacao):-
											posicao_lista(Lista_resultados,X,Posicao),!,
											atribuir_pontos(Posicao,Pontuacao).
aux_trata_lista_resultados_pontuacoes(_,_,0).
											

%::::: 8 :::::::::::::::::::Listar classificação atual dos pilotos no campeonato por ordem crescente::::::::: v :::%
listar_classificacao_pilotos:-findall(piloto(X,_,nome_piloto(Nome,Proprio),_,_,_,_,_,Pontuacao),
		     						  piloto(X,_,nome_piloto(Nome,Proprio),_,_,_,_,_,Pontuacao),L),
									  quicksort_pilotos(L,Lordenada),nl,
									  write('Listagem de classificacoes do campeonato por ordem crescente:'),nl,
									  write('=== Numero === Nome === Pontuacao ==='),nl,
									  tratar_lista_ordenada(Lordenada).

tratar_lista_ordenada([]):-!.
tratar_lista_ordenada([piloto(X,_,nome_piloto(Nome,Proprio),_,_,_,_,_,Pontuacao)|L]):-
	write('['),write(X),write('] '),
	write(Nome),write(' '),	write(Proprio),
	write(' - '),write(Pontuacao),write(' pontos'),nl, tratar_lista_ordenada(L).

quicksort_pilotos([],[]).
quicksort_pilotos([X|Tail],Sorted) :-split_pilotos(X,Tail,Small,Big),
									quicksort_pilotos(Small,SortedSmall),
									quicksort_pilotos(Big,SortedBig),
									conc_pilotos(SortedSmall,[X|SortedBig],Sorted).

split_pilotos(_,[],[],[]).
split_pilotos(piloto(_,_,nome_piloto(_,_),_,_,_,_,_,Pontuacao),
	[piloto(Id_Piloto1,_,nome_piloto(Nome1,Apelido1),_,_,_,_,_,Pontuacao1)|Tail],
	[piloto(Id_Piloto1,_,nome_piloto(Nome1,Apelido1),_,_,_,_,_,Pontuacao1)|Small],Big):-

maior_que_pilotos(Pontuacao,Pontuacao1),!,
split_pilotos(piloto(_,_,_,_,_,_,_,_,Pontuacao),Tail,Small,Big).

split_pilotos(piloto(Id_Piloto,_,nome_piloto(Nome,Apelido),_,_,_,_,_,Pontuacao),
	[piloto(Id_Piloto1,_,nome_piloto(Nome1,Apelido1),_,_,_,_,_,Pontuacao1)|Tail],Small,
	[piloto(Id_Piloto1,_,nome_piloto(Nome1,Apelido1),_,_,_,_,_,Pontuacao1)|Big]):-
split_pilotos(piloto(Id_Piloto,_,nome_piloto(Nome,Apelido),_,_,_,_,_,Pontuacao),Tail,Small,Big).


conc_pilotos([],L,L).
conc_pilotos([X|L1],L2,[X|L3]):-conc_pilotos(L1,L2,L3).

maior_que_pilotos(X,Y):- X <Y. %devia ser X > Y mas como se pretende a ordem crescente (do piloto com mais pontos para o que tiver menos pontos usa-se o sinal de menor)

%::::: 9 :::::::::::::::::::Listar classificação atual das equipas no campeonato por ordem crescente::::::::::  :::%

listar_classificacao_equipas:-findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_,_),[]),!,fail.
listar_classificacao_equipas:-findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_,_),L), %set e para eliminar duplicados numa lista
								set(L, Lequipas),calcular_pontuacao_equipas(Lequipas,Li),quicksort_equipas(Li,Li_sorted),trata_Lisorted(Li_sorted).

trata_Lisorted([]):-!.
trata_Lisorted([pontuacao(X,Pontos)|L]):-write(' Equipa: '),write(X),write(' Pontos: '),write(Pontos),nl,trata_Lisorted(L).
%criar lista com pontuacao de cada equipa
calcular_pontuacao_equipas([],_):-!.
calcular_pontuacao_equipas([X|L],[pontuacao(X,Pontos)|Li]):-calcular_pontuacao_equipas(L,Li),pontos_equipas(X,Pontos).

%somar pontos dos pilotos da mesma equipa
pontos_equipas(Equipa,Contador):- findall(pilotos_da_equipa(X,Pontuacao),piloto(X,Equipa,_,_,_,_,_,_,Pontuacao),L),
									tratar_pilotos_equipa(L,Contador).

tratar_pilotos_equipa([],0):-!.
tratar_pilotos_equipa([pilotos_da_equipa(_,Pontuacao)|L],Contador1):- tratar_pilotos_equipa(L,Contador), 
																		Contador1 is Contador + Pontuacao.  


quicksort_equipas([],[]).
quicksort_equipas([X|Tail],Sorted) :-split_equipas(X,Tail,Small,Big),
									quicksort_equipas(Small,SortedSmall),
									quicksort_equipas(Big,SortedBig),
									conc_equipas(SortedSmall,[X|SortedBig],Sorted).

split_equipas(_,[],[],[]).
split_equipas(pontuacao(_,Pontos),[pontuacao(X1,Pontos1)|Tail],[pontuacao(X1,Pontos1)|Small],Big):-maior_que_equipas(Pontos,Pontos1),!,split_equipas(pontuacao(_,Pontos),Tail,Small,Big).
split_equipas(pontuacao(_,_),[pontuacao(X1,Pontos1)|Tail],Small,[pontuacao(X1,Pontos1)|Big]):-split_equipas(pontuacao(X1,Pontos1),Tail,Small,Big).
conc_equipas([],L,L).
conc_equipas([X|L1],L2,[X|L3]):-conc_equipas(L1,L2,L3).

maior_que_equipas(X,Y):- X <Y. %devia ser X > Y mas como se pretende a ordem crescente (do piloto com mais pontos para o que


%::::: 10 ::::::::::::::::::Listar resultados de uma prova com identificação dos pilotos:::: v :::%

listar_resultados_com_identificacao:-write('Digite a data da prova: Dia-> '),read(Dia1),
									 write('Mes-> '),read(Mes),
									 write('Ano-> '),read(Ano),
				findall(resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),Classificacao),
						resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),Classificacao),L),mostrar_resultados_identificacao(L).

mostrar_resultados_identificacao([]):-!.
mostrar_resultados_identificacao([resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),Classificacao)|L]):-
write('  ID Pista: '),write(Id_pista),nl,
write('  Data da prova:  De '),write(Dia1),write(' a '),write(Dia2),write(' de '),write(Mes),write(' de '),write(Ano),nl,
write('  Classificacao (do 1o Lugar ao Ultimo): '),nl,tratar_classificacao(Classificacao),nl,mostrar_resultados_identificacao(L),nl.

%::::: 11 ::::::::::::::::::Mostrar a posição atual de um piloto no campeonato:::: v :::%

mostrar_posicao_atual_campeonato(Id_piloto):- piloto_existee(X),!,findall(piloto(X,_,nome_piloto(Nome,Proprio),_,_,_,_,_,Pontuacao),
		     						  piloto(X,_,nome_piloto(Nome,Proprio),_,_,_,_,_,Pontuacao),L),
									  quicksort_pilotos(L,Lordenada),posicao_lista(Lordenada,piloto(Id_piloto,_,_,_,_,_,_,_,_),Posicao),Posicao1 is Posicao + 1,
									  write('O piloto numero '),write(Id_piloto),write(' esta em '),write(Posicao1),write('o lugar.'),nl.	

%::::: 12 ::::::::::::::::::Listar classificação média de determinado piloto nas provas já realizadas:::: v :::%

listar_classificacao_media_piloto(X):- findall(Lista_resultados,resultado(_,_,Lista_resultados),L),
										  trata_classificacoes_para_media(X,L,Li),media(Resultado,Li),
										  write('O piloto no '),write(X),write(' tem media de classificacoes de '),
										  write(Resultado),nl.


trata_classificacoes_para_media(_,[],[]):-!.
trata_classificacoes_para_media(Id_Piloto,[X|L],[Posicao|Li]):-trata_classificacoes_para_media(Id_Piloto,L,Li),
													 posicao_lista(X,Id_Piloto,Posicao).



media(X,L):-soma(S,L),contar_elementos_lista(L,N),X is S/N.
soma(0,[]):-!.
soma(X,[C|Cauda]):-soma(Y,Cauda),X is Y+C.
%::::: 13 ::::::::::::::::::Listar as classificações de um piloto por ordem crescente de posição (melhor ao pior):::: v :::%

%lista com todas as classificacoes do piloto
%ordena-la e mostra-la  ex: 1º  lugar prova x, 2º lugar prova y

obter_lista_classificacoes(L):-	findall(Lista_resultados,resultado(_,_,Lista_resultados),L).
									
listar_classificacoes_piloto(X):- obter_lista_classificacoes(Lclass),
								  procurar_classificacoes(X,Lclass,Li),
								  quicksort_class(Li,Sorted),write(Sorted),write(' Piloto no '),write(X),nl,
								  write('::: Classificacoes ordenadas por ordem crescente :::'),
								  tratar_sorted(X,Sorted).

procurar_classificacoes(_,[],[]):-!.
procurar_classificacoes(Id_Piloto,[X|L],[[Posicao,X]|Li]):- procurar_classificacoes(Id_Piloto,L,Li),
															posicao_lista(X,Id_Piloto,Posicao).																	
tratar_sorted(Id_Piloto,[[Posicao,X]|L]):-nl,write(Posicao),write(' lugar - '),
												achata(X,Xachatado),
												determina_prova(Xachatado,Listax),
												%write('X achatado '),write(Xachatado),nl,write('Listax '),write(Listax),nl,
												trata_listax(Listax),
												tratar_sorted(Id_Piloto,L).  										

trata_listax([]):-!.
trata_listax([[Dia1,Mes,Ano]|L]):- write('Prova do dia '),write(Dia1),write( ' de '),write(Mes),write(' de '),write(Ano),write(' .'),
									trata_listax(L).

quicksort_class([],[]).
quicksort_class([X|Tail],Sorted) :-split_class(X,Tail,Small,Big),
									quicksort_class(Small,SortedSmall),
									quicksort_class(Big,SortedBig),
									conc_class(SortedSmall,[X|SortedBig],Sorted).

split_class(_,[],[],[]).
split_class([Posicao,_],[[Posicao1,X1]|Tail],[[Posicao1,X1]|Small],Big):-
								maior_que_class(Posicao,Posicao1),!,
								split_class([Posicao,_],Tail,Small,Big).

split_class([Posicao,X],[[Posicao1,X1]|Tail],Small,[[Posicao1,X1]|Big]):-
						split_class([Posicao,X],Tail,Small,Big).
conc_class([],L,L).
conc_class([X|L1],L2,[X|L3]):-conc_titulos(L1,L2,L3).

maior_que_class(X,Y):- X >Y. 

determina_prova(Lista_resultados,L):-findall([Dia1,Mes,Ano],resultado(_,data_prova(Dia1,_,Mes,Ano),Lista_resultados),L).

%::::: 14 ::::::::::::::::::Piloto com mais 1º lugares:::: v :::%


mostrar_piloto_1lugares:-findall(X,piloto(X,_,_,_,_,_,_,_,_),[]),!,fail.
mostrar_piloto_1lugares:-findall(X,piloto(X,_,_,_,_,_,_,_,_),L),calcular_piloto_primeiros(L,Li),maxlist_primeiros(Li,Max),nl,trata_max(Max),nl.

trata_max(lugares(X,C)):- write('O piloto com mais primeiros lugares e o piloto no '),write(X),write(' com '),write(C),write(' lugares.').

calcular_piloto_primeiros([],_).
calcular_piloto_primeiros([X|L],[lugares(X,C)|Li]):-calcular_piloto_primeiros(L,Li),calcular_numero_primeiros_lugares(X,C).




maxlist_primeiros([lugares(X,C)],lugares(X,C)).
maxlist_primeiros([lugares(X,C),lugares(X1,C1)|Rest],Max):-maxlist_primeiros([lugares(X1,C1)|Rest],MaxRest),max_primeiros(lugares(X,C),MaxRest,Max).

max_primeiros(lugares(X,C),lugares(_,C1),lugares(X,C)):- C>=C1.
max_primeiros(lugares(_,C),lugares(X1,C1),lugares(X1,C1)):- C<C1.


calcular_numero_primeiros_lugares(Id_Piloto,Contador):- aux_calcular_numero_primeiros_lugares(Id_Piloto,Contador).

aux_calcular_numero_primeiros_lugares(_,0):- findall(Lista_resultados,resultado(_,_,Lista_resultados),[]),!.
aux_calcular_numero_primeiros_lugares(Id_Piloto,Contador):- findall(Lista_resultados,resultado(_,_,Lista_resultados),L),
													trata_primeiros_lugares(Id_Piloto,L,Contador),nl,
													write('Piloto no: '),write(Id_Piloto),write(' tem '),write(Contador),write(' primeiros lugares.').

trata_primeiros_lugares(_,[],0):-!.
trata_primeiros_lugares(Id_Piloto,[X|L],Contador):- aux_trata_primeiros_lugares(Id_Piloto,X, Contador_cabeca),
													trata_primeiros_lugares(Id_Piloto,L,Contador_Cauda),
													Contador is Contador_cabeca+Contador_Cauda.
														
aux_trata_primeiros_lugares(_,[],0):-!.
aux_trata_primeiros_lugares(X,Lista_resultados,Contador):-posicao_lista(Lista_resultados,X,Posicao),!,trata_posicao(Posicao,Contador).
aux_trata_primeiros_lugares(_,_,0).


trata_posicao(1,Contador):- !,Contador is 1. 
trata_posicao(_,Contador):-  Contador is 0. 



%::::: 15 ::::::::::::::::::Mostrar piloto com mais titulos:::: v :::%

mostrar_piloto_mais_titulos:-findall(X,piloto(X,_,_,_,_,_,_,_,_),[]),!,fail.
mostrar_piloto_mais_titulos:- findall(X,piloto(X,_,_,_,_,_,_,_,_),L),
							  trata_mostrar_piloto_mais_titulos(L),
							  findall(num_titulos(X,N),num_titulos(X,N),Lnt),
							  quicksort_titulos(Lnt,Lnt_Sorted),mostra_Lnt(Lnt_Sorted).


mostra_Lnt([]):-!.
mostra_Lnt([num_titulos(X,N)|_]):- devolve_nome_piloto(X,Nome,Apelido),
write('--------------- Piloto com mais titulos ------------'),nl,
write('['),write(X),write('] '),write(Nome),write(' '),write(Apelido),write(' - '),write(N),write(' titulos').


trata_mostrar_piloto_mais_titulos([]):-!.
trata_mostrar_piloto_mais_titulos([X|L]):-piloto_num_titulos(X,N),
										  write('O piloto '),write(X),
										  write(' tem '),write(N),write(' titulos.'),nl,
										  assertz(num_titulos(X,N)),
										  trata_mostrar_piloto_mais_titulos(L).

piloto_num_titulos(X,N):-findall(ListaTitulos,piloto(X,_,_,_,_,_,_,ListaTitulos,_),L),achata(L,L_achatada),
contar_elementos_lista_mais(L_achatada,N).

contar_elementos_lista_mais([],0).
contar_elementos_lista_mais([titulo(_,_)|L],N):-contar_elementos_lista_mais(L,N1),N is N1+1.								


quicksort_titulos([],[]).
quicksort_titulos([X|Tail],Sorted) :-split_titulos(X,Tail,Small,Big),
									quicksort_titulos(Small,SortedSmall),
									quicksort_titulos(Big,SortedBig),
									conc_titulos(SortedSmall,[X|SortedBig],Sorted).

split_titulos(_,[],[],[]).
split_titulos(num_titulos(_,N),[num_titulos(X1,N1)|Tail],[num_titulos(X1,N1)|Small],Big):-
								maior_que_titulos(N,N1),!,
								split_titulos(num_titulos(_,N),Tail,Small,Big).

split_titulos(num_titulos(X,N),[num_titulos(X1,N1)|Tail],Small,[num_titulos(X1,N1)|Big]):-
						split_titulos(num_titulos(X,N),Tail,Small,Big).
conc_titulos([],L,L).
conc_titulos([X|L1],L2,[X|L3]):-conc_titulos(L1,L2,L3).

maior_que_titulos(X,Y):- X <Y. %devia ser X > Y mas como se pretende a ordem crescente (do piloto com mais pontos para o que tiver menos pontos usa-se o sinal de menor)

%::::: 16 ::::::::::::::::::Mostrar piloto mais velho a competir::::  :::%

mostrar_mais_velho:-findall(idd(Id_Piloto,Ano),piloto(Id_Piloto,_,_,_,_,data_nasc(_,_,Ano),_,_,_),L),
					tratar_mais_velho(L,Li),maxlist_idade(Li,Max),write('O piloto mais velho a competir e: '),nl,trata_max_idade(Max).

tratar_mais_velho([],_):-!.
tratar_mais_velho([idd(Id_Piloto,Ano)|L],[idade(Id_Piloto,Idade)|Li]):- tratar_mais_velho(L,Li),calcula_idade(Ano,2014,Idade).


trata_max_idade(idade(Id_Piloto,Idade)):-write(' Piloto no '),write(Id_Piloto),write(' Idade: '),write(Idade),nl.

maxlist_idade([idade(Id_Piloto,Idade)],idade(Id_Piloto,Idade)).
maxlist_idade([idade(Id_Piloto,Idade),idade(Id_Piloto1,Idade1)|Rest],Max):-maxlist_idade([idade(Id_Piloto1,Idade1)|Rest],MaxRest),
																			max_idade(idade(Id_Piloto,Idade),MaxRest,Max).

max_idade(idade(Id_Piloto,Idade),idade(_,Idade1),idade(Id_Piloto,Idade)):- Idade>=Idade1.
max_idade(idade(_,Idade),idade(Id_Piloto1,Idade1),idade(Id_Piloto1,Idade1)):- Idade<Idade1.

calcula_idade(Ano,Ano_atual,Idade):-Idade is Ano_atual - Ano.



%::::: 17 ::::::::::::::::::Guardar dados que estejam a ser manipulados em memória em ficheiro:::: v :::%
save_all	:-	save_pistas,save_pilotos,save_resultados.

save_pistas	:-	see('pistas.txt'),read(P),tell('copia_pistas.txt'),aux_save_pistas(P),seen,told.
aux_save_pistas(end_of_file)	:-	!.
aux_save_pistas(P)	:-	writeq(P),nl,save_pistas.
save_pilotos	:-	tell('copia_pilotos.pl'),listing(piloto),told.
save_resultados	:-	tell('copia_resultados.pl'),listing(resultado),told.

%::::: 18 :::::::::::::::::::::: v :::%
mostrar_pista_com_mais_resultados(X):-see('pistas.txt'),read(T),aux_mostrar_pista_com_mais_resultados(X,T),seen.
aux_mostrar_pista_com_mais_resultados(_,end_of_file):-!.
aux_mostrar_pista_com_mais_resultados(X,pista(X,_,_,_,Lista_resultados)):-contar_elementos_lista(Lista_resultados,N),
									write('A pista '),write(X),write(' tem '),write(N),write(' vencedores.').
aux_mostrar_pista_com_mais_resultados(X,_):-mostrar_pista_com_mais_resultados(X).



%::::: 19 :::::::::::::::::::::: v :::%
calcular_comprimento_volta(X):-see('pistas.txt'),read(T),aux_calcular_comprimento_volta(X,T),seen.

aux_calcular_comprimento_volta(_,end_of_file)	:-	!.
aux_calcular_comprimento_volta(X,pista(X,_,_,descricao(Voltas,Percurso,_),_)):- !, Total is Percurso / Voltas,
write('Cada volta da pista '),write(X),write(' possui '),nl,write(Total),write(' km.'),nl.
aux_calcular_comprimento_volta(X,_):- calcular_comprimento_volta(X).


%::::: 20 :::::::::::::::::::::: v :::%
verificar_classificacao_piloto(X,Dia1,Mes,Ano):- 
						 findall(Lista_resultados,
						 	resultado(_,data_prova(Dia1,_,Mes,Ano),Lista_resultados),L),
						 	achata(L,Lachatada),
						 	posicao_lista(Lachatada,X,_),write('O piloto ficou classificado na prova de '),write(Dia1),write('-'),write(Mes),write('-'),write(Ano).	


%Verificar se o piloto X ficou classificado na prova do dia X