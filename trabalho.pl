%Funcoes auxiliares

%limpa ecra
cls:- put(27),put(91),put(50),put(74).

%Tempo de espera 10 segundos
espera:- sleep(10).

%Algumas funcoes uteis retiradas da internet
	% An empty list is a set.
set([], []).

% Put the head in the result,
% remove all occurrences of the head from the tail,
% make a set out of that.
set([H|T],[H|T1]):-remove_elemento(H,T,T2),set(T2,T1).
% Removing anything from an empty list yields an empty list.
remove_elemento(_,[],[]).

% If the head is the element we want to remove,
% do not keep the head and
% remove the element from the tail to get the new list.
remove_elemento(X,[X|T],T1) :- remove_elemento(X,T,T1).

% If the head is NOT the element we want to remove,
% keep the head and
% remove the element from the tail to get the new tail.
remove_elemento(X,[H|T],[H|T1]) :-X \= H,remove_elemento(X, T, T1).

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

%Funcao utilizada para achatar uma lista, saindo a Lista Achatada
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

%devolve o nome do piloto segundo o ID.

get_nome_piloto(X,Proprio,Apelido):-setof(X,piloto(X,_,nome(Proprio,Apelido),_,_,_,_,_),_).

%devolve a Idade segundo o Ano da data_nasc, e segundo o ano actual
get_idade(Ano,Ano_atual,Idade):-Idade is Ano_atual - Ano.

%copiar ficheiro
copiaficheiro(A,B):-seen,told,see(A),tell(B),copiaf,seen,told.
copiaf:-read(Item),copia(Item).
copia(end_of_file):-!.
copia(Item):-writeq(Item),write('.'),nl,copiaf.

%pede_lista_historico([],LH)
pede_lista_historico(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica(X,Li,Lf).
verifica('s',Li,[historico(Piloto,Ano)|Lf]):-!, write('Piloto? '),read(Piloto), write('Ano? '),read(Ano), pede_lista_historico(Li,Lf).
verifica(_,Li,Li). 

%Algoritmos de Ordenacao
%Algoritmos baseados na implementacao encontrada em: http://rosettacode.org/wiki/Quicksort#Prolog

%QUICKSORT Pilotos

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

%QUICKSORT equipas

% 1 e para decresccente
% 2 e para crescente
listar_quicksort_equipas([],[]).
listar_quicksort_equipas([X|Tail],Sorted) :-aux_quicksort_split_equipas(X,Tail,Small,Big),
									listar_quicksort_equipas(Small,SortedSmall),
									listar_quicksort_equipas(Big,SortedBig),
									concatenar_sublistas_equipas(SortedSmall,[X|SortedBig],Sorted).

listar_quicksort_equipas2([],[]).
listar_quicksort_equipas2([X|Tail],Sorted) :-aux_quicksort_split_equipas2(X,Tail,Small,Big),
									listar_quicksort_equipas2(Small,SortedSmall),
									listar_quicksort_equipas2(Big,SortedBig),
									concatenar_sublistas_equipas(SortedSmall,[X|SortedBig],Sorted).

aux_quicksort_split_equipas(_,[],[],[]).
aux_quicksort_split_equipas(pontuacao(_,Pontos),[pontuacao(X1,Pontos1)|Tail],[pontuacao(X1,Pontos1)|Small],Big):-aux_comparar_2equipas_decrescente(Pontos,Pontos1),!,aux_quicksort_split_equipas(pontuacao(_,Pontos),Tail,Small,Big).
aux_quicksort_split_equipas(pontuacao(_,_),[pontuacao(X1,Pontos1)|Tail],Small,[pontuacao(X1,Pontos1)|Big]):-aux_quicksort_split_equipas(pontuacao(X1,Pontos1),Tail,Small,Big).

aux_quicksort_split_equipas2(_,[],[],[]).
aux_quicksort_split_equipas2(pontuacao(_,Pontos),[pontuacao(X1,Pontos1)|Tail],[pontuacao(X1,Pontos1)|Small],Big):-aux_comparar_2equipas_crescente(Pontos,Pontos1),!,aux_quicksort_split_equipas2(pontuacao(_,Pontos),Tail,Small,Big).
aux_quicksort_split_equipas2(pontuacao(_,_),[pontuacao(X1,Pontos1)|Tail],Small,[pontuacao(X1,Pontos1)|Big]):-aux_quicksort_split_equipas2(pontuacao(X1,Pontos1),Tail,Small,Big).
concatenar_sublistas_equipas([],L,L).

concatenar_sublistas_equipas([X|L1],L2,[X|L3]):-concatenar_sublistas_equipas(L1,L2,L3).

aux_comparar_2equipas_decrescente(X,Y):- X <Y.
aux_comparar_2equipas_crescente(X,Y):- X >Y.


%QUICKSORT pontuacoes

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

%QUICKSORT Titulos.

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




%projecto:- menuprincipal.
%---------------------------------------------------------------------------------------------
%			Adicionar
%---------------------------------------------------------------------------------------------
%---------------------------------------------------------------------------------------------
%			Adicionar piloto 1
%---------------------------------------------------------------------------------------------
%pede_lista_titulos([],LT)
pede_lista_titulos(Li,Lf):-write('Inserir novo? (s/n) '),read(X),verifica_lista_titulos(X,Li,Lf).
verifica_lista_titulos('s',Li,[titulo(Ano,Competicao)|Lf]):-!, write('Ano: '),read(Ano), write('Competicao: '),read(Competicao), pede_lista_titulos(Li,Lf).
verifica_lista_titulos(_,Li,Li). 

%Função usada para verificar se o piloto existe em memória, pedindo o numero de piloto.
adicionar_verifica_piloto_memoria(N_piloto):-findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),[]),!.
adicionar_verifica_piloto_memoria(N_piloto):-write('O Piloto Existe, por favor tente outro piloto'),nl,fail.

%Funcao principal para adicionar um piloto, pede o numero de piloto, se existir um piloto com o esse número sai, caso contrário insere um piloto novo.
addpiloto:-consult('piloto.pl'),nl,write('Numero do Piloto: '),read(N_piloto),!,adicionar_verifica_piloto_memoria(N_piloto),!,inserir_dados_piloto(N_piloto),!.

%Funcao usada para pedir os dados do piloto ao utilizador.
inserir_dados_piloto(N_piloto):-
write('Equipa: '),read(Equipa),
write('Nome Proprio '),read(Proprio),
write('Apelido '),read(Apelido),
write('Naturalidade: '),read(Naturalidade),
write('Dia: '), read(Dia),
write('Mes: '), read(Mes),
write('Ano: '), read(Ano),
write('Morada : '),read(Morada),
write('Titulos Conquistados : '),pede_lista_titulos([],LT),
write('Pontuacao Anual : '), read(Pontuacao_anual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_anual)),
write('Piloto inserido com sucesso ! '),nl,nl,!,listing(piloto),nl,nl. 
%---------------------------------------------------------------------------------------------
%			Adicionar Pistas 2
%---------------------------------------------------------------------------------------------
addpista:-nl,write('IDPista: '),read(IDPista),pesquisar_pista_add(IDPista).

%Pesquisa a Pista 

pesquisar_pista_add(IDPista):-seen,see('pistas.txt'),pesquisa_pista_add(IDPista),!,copiaficheiro('pistas2.txt','pistas.txt').
pesquisar_pista_add(IDPista):-addpista.


pesquisa_pista_add(IDPista):-read(X),retorna_pista_add(IDPista,X).

retorna_pista_add(IDPista,end_of_file):-seen, inserir_pista(IDPista).
retorna_pista_add(IDPista,pistas(IDPista,_,_,_,_)):-!,seen , write('Pista já existe!'),nl,nl,nl,fail.
retorna_pista_add(IDPista,_):-pesquisa_pista_add(IDPista).


inserir_pista(IDPista):-
write('Nome da pista: '),read(IDPistaome_pista),
write('Pais: '),read(Pais),
write('Descricao: '),nl,
write('	Numero de voltas: '),read(Voltas),
write('	Metros: '),read(M),
write('Historico:'),nl,pede_lista_historico([],LH),!,
tell('pistas2.txt'), see('pistas.txt'),copiaf,writeq(pistas(IDPista, IDPistaome_pista, Pais, descricao(Voltas,M),LH)),write('.'),nl,told, seen.


%copiar ficheiro
copiaficheiro(A,B):-seen,told,see(A),tell(B),copiaf,seen,told.
copiaf:-read(Item),copia(Item).
copia(end_of_file):-!.
copia(Item):-writeq(Item),write('.'),nl,copiaf.

%pede_lista_historico([],LH)
pede_lista_historico(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica(X,Li,Lf).
verifica('s',Li,[historico(Piloto,Ano)|Lf]):-!, write('Piloto? '),read(Piloto), write('Ano? '),read(Ano), pede_lista_historico(Li,Lf).
verifica(_,Li,Li). 
%---------------------------------------------------------------------------------------------
%			Adicionar Resultados 3
%---------------------------------------------------------------------------------------------
addresultado:-nl,write('Identificacao da Pista: '),read(IDPista),verifica_lista_resultados_pista_memoria(IDPista),!,inserir_resultados_memoria(IDPista).
addresultado:-write('Pista já existente').


verifica_lista_resultados_pista_memoria(IDPista):-!,findall(IDPista,resultados(IDPista,_,_),[]),!.
verifica_lista_resultados_pista_memoria(IDPista):-write('A Pista já tem resultados'),nl,fail.

inserir_resultados_memoria(IDPista):-seen,
write('Dia da Prova: '),read(Diap),
write('Mes da Prova: '),read(Mesp),
write('Ano da Prova: '),read(Anop),
write('Lista de Resultados: '),nl,write('Quantos resultados pertende inserir?'),read(Nr),nl,pede_lista_resultados(Nr,LP),
assertz(resultados(IDPista,dataprova(Diap,Mesp,Anop),LP)),
write('Resultados inseridos com sucesso ! '),listing(resultados),nl,nl,nl,nl. 		

%pede_lista_resultados([],LS)
pede_lista_resultados(X,Lf):-verifica_lista_resultados(X,Lf).
verifica_lista_resultados(0,[]):-!.
verifica_lista_resultados(X,[(Resultado)|Lf]):-write('Insira o Resultado '),read(Resultado),X1 is X-1, pede_lista_resultados(X1,Lf).
%----------------------------------------------------------------------------------------------
%			Remover 
%----------------------------------------------------------------------------------------------
%----------------------------------------------------------------------------------------------
%			Remover Piloto 4
%----------------------------------------------------------------------------------------------
%Função usada para verificar se o piloto existe em memória, pedindo o numero de piloto.
remover_verifica_piloto_memoria(N_piloto):-!,findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),[]),!,write('O Piloto nao existe'),nl,fail.
remover_verifica_piloto_memoria(N_piloto):- true.

%Funcao principal para remover um piloto, pede o numero de piloto, se existir um piloto com o esse número é removido, caso contrário não.
rempiloto:-nl,consult('piloto.pl'),write('Numero do Piloto: '),read(N_piloto),remover_verifica_piloto_memoria(N_piloto),!,remover_piloto_memoria(N_piloto).
rempiloto:-write('Nao removeu piloto').

%Funcao usada para remover os dados do da memória.
remover_piloto_memoria(N_piloto):-retract(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_anual)),
write('Piloto removido com sucesso ! '),nl,listing(piloto),nl,nl,nl.

%----------------------------------------------------------------------------------------------
%			Remover Pistas 5
%----------------------------------------------------------------------------------------------
rempista	:-	write('Remover uma pista através do ID'),nl,
		write(' Identificacao da Pista '),read(ID_Pista),nl,
		rem_verifica_ficheiro_pista(ID_Pista), copiaficheiro('pistas2.txt','pistas.txt').
		
	
rem_verifica_ficheiro_pista(ID_Pista)	:-	see('pistas.txt'),tell('pistas2.txt'),rem_ler_ficheiro_pista(ID_Pista),seen,told.
rem_ler_ficheiro_pista(ID_Pista)	:-	read(X),rem_verifica_pista(ID_Pista,X).

% Verifica-se se esse aluno existe na lista

rem_verifica_pista(_,end_of_file)		:-!.
rem_verifica_pista(ID_Pista,pistas(ID_Pista,_,_,_,_))	:-	!,rem_ler_ficheiro_pista(ID_Pista).
rem_verifica_pista(ID_Pista,A)	:-	writeq(A),write('.'),nl,rem_ler_ficheiro_pista(ID_Pista).

%-----------------------------------------------------------------------------------------------
%			Remover Resultados 6
%-----------------------------------------------------------------------------------------------
remover_verifica_resultado_memoria(Id_pista):-findall(Id_pista,resultados(Id_pista,_,_),[]),!,write('O resultado nao existe'),nl,fail.	
remover_verifica_resultado_memoria(Id_pista):- true.

%Funcao principal para remover um resultado, pede o numero de resultado, se existir um resultado com o esse número é removido, caso contrário não.
remresultado:-nl,consult('resultados.pl'),write('Numero da Pista: '),read(Id_pista),remover_verifica_resultado_memoria(Id_pista),
remover_resultado_memoria(Id_pista).
remresultado:-write('Nao removeu resultado').

%Funcao usada para remover os dados do da memória.
remover_resultado_memoria(Id_pista):-retract(resultados(Id_pista,_,_)),
write('resultado removido com sucesso ! '),nl,nl,nl,nl.
%-----------------------------------------------------------------------------------------------
%			Modificar
%-----------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------------
%			Dados dos pilotos 7

modpiloto:-consult('piloto.pl'),write('Introduza o numero do piloto que pretende modificar '),nl,read(N_piloto),nl,modificar_piloto(N_Piloto).
modificar_piloto(N_piloto):- aux_existe_piloto(N_piloto),!,opcoes_modificar_piloto(N_piloto).
modificar_piloto(_):- write('O piloto selecionado nao existe!'),nl.


opcoes_modificar_piloto(N_piloto):-write('Que dados do piloto quer modificar? Seleccione a opcao correspondente. '),nl,
write(' 1	Equipa'),nl,
write(' 2	Morada'),nl,
write(' 3	Naturalidade'),nl,
write(' 4	Pontuacao'),nl,
write(' Pedimos desculpa mas nao e possivel modificar os campos de ID, nome , data de nascimento e Lista de Titulos'),nl,nl,
write('Opcao: '),
read(Op),nl,submenu_modificar_piloto_criterio_OP(N_piloto,Op).

%Entram os parâmetros ID e opcao correspondente.
submenu_modificar_piloto_criterio_OP(N_piloto,1)	:-	write('Nova Equipa: '),read(Equipa),nl,
piloto(N_piloto,_,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Equipa do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,2)	:-	write('Nova Morada: '),read(Morada),nl,
piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),_,LT,Pontuacao_atual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Morada do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,3)	:-	write('Nova Naturalidade: '),read(Naturalidade),nl,
piloto(N_piloto,Equipa,nome(Proprio,Apelido),_,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Naturalidade do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,4)	:-	write('Nova Pontuacao: '),read(Pontuacao_atual),nl,
piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,_),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Pontuacao do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,_)	:-	write('Opcao seleccionada errada.'),nl.

aux_existe_piloto(N_piloto):- findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),[]),!,fail.
aux_existe_piloto(N_piloto):- findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),_),write('O piloto existe, pode fazer modificacoes. '),nl.
%-----------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------------
%			Dados das Pistas 8
%-----------------------------------------------------------------------------------------------
modpista:-seen,told,see(user),tell(user),nl,
	write('Introduza o ID da pista '),read(ID_Pista),nl,
	modificar_verifica_pista(ID_Pista),seen,told,tell(user).
	
modificar_verifica_pista(ID_Pista):-see('pistas.txt'),modificar_verifica_pista1(ID_Pista).
modificar_verifica_pista1(ID_Pista):- read(X),modificar_verifica_pista2(X,ID_Pista).
modificar_verifica_pista2(end_of_file,_):-!,write('Pista nao encontrada!').
modificar_verifica_pista2(pistas(ID_Pista,Nome_Pista,Pais,descricao(Voltas,M), LH),ID_Pista):-
write('	Dados Atuais da Pista: '),nl,nl,
modificar_mostrar_pista(pistas(ID_Pista,Nome_Pista,Pais,descricao(Voltas,M),LH)),nl,nl,!,modificar_dados_pista(ID_Pista).
modificar_verifica_pista2(_,ID_Pista):-modificar_verifica_pista1(ID_Pista).


modificar_dados_pista(ID_Pista):-nl,seen,see(user),tell(user),
	write('	Introduza os Novos dados da Pista'),nl,nl,
	write('Nome da Pista: '),read(Nome_Pista),nl,
	write('Pais: '),read(Pais),nl,
	write('Descricao: '),nl,nl,
	write('Voltas: '),read(Voltas),nl,
	write('Metros por volta: '),read(M),nl,
	write('Introduza o Historico'),nl,pede_lista_historico([],LH),
	modificar_dados_pista1(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH),seen,tell(user).
	 
modificar_dados_pista1(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH):-
	seen,told,see('pistas.txt'),tell('pistas2.txt'),
	modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH),seen,told,see(user),tell(user),
	copiaficheiro('pistas2.txt','pistas.txt'),tell('pistas2.txt'),told,nl,
	write('Informacao da pista actualizada com sucesso '),nl.
	
modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH):-
	read(Dados),modificar_dados_pista3(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH,Dados).
	
modificar_dados_pista3(_,_,_,_,_,end_of_file):-!.
modificar_dados_pista3(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH,pistas(ID_Pista,_,_,_,_)):-!,
			writeq(pistas(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH)),
	write('.'),nl,modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH).
modificar_dados_pista3(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M),LH,Dados):-
	writeq(Dados),write('.'),nl,
	modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH).

modificar_mostrar_pista(pistas(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH)):-!,
	write('	Introduza os Novos dados da Pista'),nl,nl,
	write('Nome da Pista: '),write(Nome_Pista),nl,
	write('Pais: '),write(Pais),nl,
	write('Descricao: '),nl,nl,
	write('Voltas: '),write(Voltas),nl,
	write('Metros por volta: '),write(M),nl,
	write('Historico da pista: '),nl,write(LH),nl.
modificar_mostrar_pista(_):-!.
%-----------------------------------------------------------------------------------------------
%			Dados dos Resultados 9
%-----------------------------------------------------------------------------------------------
modresultado:-consult('resultados.pl'),write('Introduza a identificacao da pista do resultado: '),nl,read(ID_Pista),nl,modificar_resultado(ID_Pista).
modificar_resultado(ID_Pista):- aux_existe_resultado(ID_Pista),!,opcoes_modificar_resultados(ID_Pista).
modificar_resultado(_):- write('A pista selecionada nao existe!'),nl.


opcoes_modificar_resultados(ID_Pista):-write('Que dados do resultado quer modificar? Seleccione a opcao correspondente. '),nl,
write(' 1	Data da Prova'),nl,
write(' 2	Lista de Resultados'),nl,
write('Opcao: '),
read(Op),nl,submenu_modificar_resultado_criterio_OP(ID_Pista,Op).

%Entram os parâmetros ID e opcao correspondente.
submenu_modificar_resultado_criterio_OP(ID_Pista,1)	:-	write('Nova data de prova: '),nl,
write('Dia: '),read(Dia),nl,
write('Mes: '),read(Mes),nl,
write('Ano: '),read(Ano),nl,
resultados(ID_Pista,_,LR),
assertz(resultados(ID_Pista,dataprova(Dia,Mes,Ano),LR)),
retract(resultados(ID_Pista,_,_)),nl,!,write('Data da prova modificada com sucesso'),nl,listing(resultados).

submenu_modificar_resultado_criterio_OP(ID_Pista,2):- write('Insira a nova lista de resultados, por ordem decrescente (do primeiro lugar, para o ultimo)'),nl,nl,nl,
pede_lista_resultados(10,LR),
resultados(ID_Pista,dataprova(Dia,Mes,Ano),_),
assertz(resultados(ID_Pista,dataprova(Dia,Mes,Ano),LR)),
retract(resultados(ID_Pista,_,_)),nl,!,write('Lista de Resultados modificada com sucesso.'),nl,listing(resultados).


submenu_modificar_resultado_criterio_OP(ID_Pista,_)	:-	write('Opcao seleccionada errada.'),nl.

aux_existe_resultado(ID_Pista):- findall(ID_Pista,resultados(ID_Pista,_,_),[]),!,fail.
aux_existe_resultado(ID_Pista):- findall(ID_Pista,resultados(ID_Pista,_,_),_),write('A pista existe, pode fazer modificacoes nos campos dos resultados. '),nl,nl.

pede_lista_resultados(X,Lf):-verifica_lista_resultados(X,Lf).
verifica_lista_resultados(0,[]):-!.
verifica_lista_resultados(X,[(Resultado)|Lf]):-write('Insira o Resultado '),read(Resultado),X1 is X-1, pede_lista_resultados(X1,Lf).
%-----------------------------------------------------------------------------------------------
%			Visualizar
%-----------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------------
%			Piloto 10
%-----------------------------------------------------------------------------------------------
%Entra n_piloto e sai a ListaPilotos , é usada para ir buscar o piloto à lista dos pilotos segundo o critério N_piloto
				mostrar_verifica_piloto_memoria(ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),

								piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),[]),!,ListaPilotos=[].

mostrar_verifica_piloto_memoria(ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),
								piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),ListaPilotos).

mostratodospilotos:-consult('piloto.pl'),nl,write('Dados Completos: '),mostrar_verifica_piloto_memoria(ListaPilotos),nl,nl,mostrar_dados_piloto(ListaPilotos),nl,nl.


mostrar_dados_piloto([]):-!,write('Nao existem mais pilotos '),nl,fail.

mostrar_dados_piloto([piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual)|Cauda]):-

write('Numero de Piloto: '),write(N_piloto),nl,

write('Equipa: '),write(Equipa),nl,

write('Nome '),write(Proprio),write(' '),write(Apelido),nl,

write('Naturalidade: '),write(Naturalidade),nl,

write('Data de Nascimento '), write(Dia),write('-'), write(Mes),write('-'),write(Ano),nl,

write('Morada : '),write(Morada),nl,

write('Titulos Conquistados : '),mostrar_f_auxiliar_lista_titulos(NT),nl,

write('Pontuacao Atual : '), write(Pontuacao_atual),nl,nl,nl,mostrar_dados_piloto(Cauda).





mostrar_f_auxiliar_lista_titulos([]):-write('Nao tem mais titulos').

mostrar_f_auxiliar_lista_titulos([titulo(Ano,Competicao)|Caudinha]):-nl,

write(Ano),write(' - '),write(Competicao),nl,mostrar_f_auxiliar_lista_titulos(Caudinha).

%-----------------------------------------------------------------------------------------------
%		    Pistas 11
%-----------------------------------------------------------------------------------------------
mostratodaspistas:-seen,see('pistas.txt'),visualizar_ler_pistas,seen.

visualizar_ler_pistas:-read(Dados),visualizar_listar_pistas(Dados),seen.

visualizar_listar_pistas(end_of_file):-!,seen.
visualizar_listar_pistas(Dados):-visualizar_pistas(Dados),visualizar_ler_pistas.


visualizar_pistas(pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Hist)):-nl,
write('Dados da Pista'),nl,nl,
write('ID da Pista: '),write(ID_Pista),nl,
write('Nome: '),write(Nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,
write('Historico: '),nl,mostrar_f_auxiliar_historico_pistas(Hist).
%-----------------------------------------------------------------------------------------------
%			Resultados 12 
%-----------------------------------------------------------------------------------------------
mostratodosresultados:-nl,consult('piloto.pl'),consult('resultados.pl'),mostrar_todos_resultados_verificador_memoria(ListaResultados).
																	%mostrar_pesq_dados_resultado(ListaResultados).



	mostrar_todos_resultados_verificador_memoria(ListaResultados):-findall(
																		resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),
																		resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),	
																		[]),
																!,fail.

mostrar_todos_resultados_verificador_memoria(ListaResultados):-findall(resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),
																	   resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),
																	   ListaResultados),mostrar_pesq_dados_resultado(ListaResultados).


mostrar_pesq_dados_resultado([]):-!.
mostrar_pesq_dados_resultado([resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados)|Cauda]):-


write('ID da Pista: '),write(ID_Pista),nl,nl,

write('Data da Prova '), write(Dia),write('-'), write(Mes),write('-'),write(Ano),nl,nl,

write('Resultados : '),nl,nl,pesquisar_f_auxiliar_lista_resultados(ListaResultados),mostrar_pesq_dados_resultado(Cauda),nl. 

%-----------------------------------------------------------------------------------------------
%			Pesquisar por campos
%-----------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------------
%			Piloto 13
%-----------------------------------------------------------------------------------------------
pesquisar_verifica_piloto_memoria(N_piloto,ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),

								piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),[]),!,ListaPilotos=[].

pesquisar_verifica_piloto_memoria(N_piloto,ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),
								piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),ListaPilotos).

pesqpiloto:-nl,consult('piloto.pl'),write('Numero do Piloto: '),read(N_piloto),pesquisar_verifica_piloto_memoria(N_piloto,ListaPilotos),pesquisar_mostrar_dados_piloto(ListaPilotos).


pesquisar_mostrar_dados_piloto([]):-!.

pesquisar_mostrar_dados_piloto([piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual)|Cauda]):-


write('Equipa: '),write(Equipa),nl,

write('Nome '),write(Proprio),write(' '),write(Apelido),nl,

write('Naturalidade: '),write(Naturalidade),nl,

write('Data de Nascimento '), write(Dia),write('-'), write(Mes),write('-'),write(Ano),nl,

write('Morada : '),write(Morada),nl,

write('Titulos Conquistados : '),pesquisar_f_auxiliar_lista_titulos(NT),nl,

write('Pontuacao Atual : '), write(Pontuacao_atual),pesquisar_mostrar_dados_piloto(Cauda).





pesquisar_f_auxiliar_lista_titulos([]):-write('Nao tem mais titulos').

pesquisar_f_auxiliar_lista_titulos([titulo(Ano,Competicao)|Caudinha]):-nl,

write(Ano),write(' - '),write(Competicao),nl,pesquisar_f_auxiliar_lista_titulos(Caudinha).

%-----------------------------------------------------------------------------------------------
%			Pistas 14
%-----------------------------------------------------------------------------------------------

pesquisar_campos:-seen,told,see(user),tell(user),

write('|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|'),nl,
write('|            Pesquisar Pistas por campos                   |'),nl,
write('|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|'),nl,
write('|      1 - ID da pista                                     |'),nl,
write('|      2 - Nome da pista                                   |'),nl,
write('|      3 - Pais sem Historico                              |'),nl,
write('|      4 - Pais com Historico                              |'),nl,

write('|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|'),nl,
read(X),pesquisa_campos_pistas(X).

%PESQUISA PISTA PELO CRITERIO ID
pesquisa_campos_pistas(1):-pesq_pista_id.
pesq_pista_id:-nl,write('Identificacao da Pista: '),read(ID_Pista),nl,pesquisar_pista_id(ID_Pista).
pesquisar_pista_id(ID_Pista):-seen,see('pistas.txt'),pesquisa_pista_id(ID_Pista),!.
pesquisar_pista_id(ID_Pista):-nl,write('Pista Encontrada com sucesso').
pesquisa_pista_id(ID_Pista):-read(X),retorna_pista_id(ID_Pista,X).
retorna_pista_id(ID_Pista,end_of_file):-seen.
retorna_pista_id(ID_Pista,pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('Nome: '),write(Nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pesquisa_id(ID_Pista,_):-pesquisa_pista_id(ID_Pista).

% PESQUISA PISTA PELO CRITERIO NOME
pesquisa_campos_pistas(2):-pesq_pista_nome.
pesq_pista_nome:-nl,write('Nome da Pista: '),read(Nome),pesquisar_pista_nome(Nome).
pesquisar_pista_nome(Nome):-seen,see('pistas.txt'),pesquisa_pista_nome(Nome),!.
pesquisar_pista_nome(Nome):-nl,write('Pista Encontrada com sucesso').
pesquisa_pista_nome(Nome):-read(X),retorna_pista_nome(Nome,X).
retorna_pista_nome(Nome,end_of_file):-seen.
retorna_pista_nome(Nome,pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('Nome: '),write(Nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pesquisa_nome(Nome,_):-pesquisa_pista_nome(Nome).

%PESQUISA PISTA PELO CRITERIO PAIS

pesquisa_campos_pistas(3):-pesq_pista_pais.
pesq_pista_pais:-nl,write('Pais : '),read(Pais),pesquisar_pista_pais(Pais).
pesquisar_pista_pais(Pais):-seen,see('pistas.txt'),pesquisa_pista_pais(Pais),!.
pesquisar_pista_pais(Pais):-nl,write('Pista Encontrada com sucesso').
pesquisa_pista_pais(Pais):-read(X),retorna_pista_pais(Pais,X).
retorna_pista_pais(Pais,end_of_file):-seen.
retorna_pista_pais(Pais,pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('Nome da pista: '),write(Nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pais(Pais,_):-pesquisa_pista_pais(Pais).

pesquisa_campos_pistas(4):-pesquisa_pistas_pais_alternativo.

pesquisa_pistas_pais_alternativo:-write('Qual o Pais da pista que deseja pesquisar? '),read(Pais),nl,pesquisa_pistas_pais_alternativo_mostrar(Pais).

pesquisa_pistas_pais_alternativo_mostrar(Pais):-seen,see('pistas.txt'),pesquisa_pistas_pais_alternativo_aux(Pais),seen,see('pistas.txt').
pesquisa_pistas_pais_alternativo_aux(Pais):-read(X),pesquisa_pistas_pais_alternativo_verifica_pistas_ficheiro(Pais,X).

pesquisa_pistas_pais_alternativo_verifica_pistas_ficheiro(_,end_of_file):-!,write('Não existem pistas nesse Pais! '),nl.
pesquisa_pistas_pais_alternativo_verifica_pistas_ficheiro(Pais,pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), LH)):-!, pesquisa_pistas_pais_alternativo_mostra_dados(pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), LH)),nl.
pesquisa_pistas_pais_alternativo_verifica_pistas_ficheiro(Pais,_):-pesquisa_pistas_pais_alternativo_aux(Pais).


pesquisa_pistas_pais_alternativo_mostra_dados(pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), LH)):-!,
write('Identificacao da pista: '),write(IDPista),nl,
write('Nome da Pista: '), write(Nome_pista),nl,
write('Pais: '),write(Pais),nl,
write('Descricao da Pista :'),nl,
write('Numero de Voltas: '),write(Voltas),nl,nl,
write('Numero de Metros de uma Volta '),write(M),nl,
write('Historico da Pista: '), mostrar_f_auxiliar_historico_pistas(LH).
pesquisa_pistas_pais_alternativo_mostra_dados(_):-!.

mostrar_f_auxiliar_historico_pistas([]):-nl,write('Nao existem mais dados no historico'),nl.
mostrar_f_auxiliar_historico_pistas([historico(Piloto,Ano)|Caudita]):-nl,
write('O Piloto '),write(Piloto),write(' ganhou em '),write(Ano),nl,mostrar_f_auxiliar_historico_pistas(Caudita).

pesquisa_campos_pistas(_):-pesquisar_campos.

%PESQUISA PISTA PELO CRITERIO Pais
%-----------------------------------------------------------------------------------------------
%			Actualizar
%-----------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------------
%			Pontuacao dos pilotos 15
%-----------------------------------------------------------------------------------------------
atualizar_todos_pilotos:-consult('piloto.pl'),findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
atualizar_todos_pilotos:-consult('piloto.pl'),findall(X,piloto(X,_,_,_,_,_,_,_),LP),aux_actualizar_pilotos(LP),nl,write('Todas as pontuacoes foram actualizadas com sucesso ! ').

aux_actualizar_pilotos([]):-!.
aux_actualizar_pilotos([C|Cauda]):-write(C),nl,atualizar_piloto(C),nl,aux_actualizar_pilotos(Cauda).

atualizar_piloto(N_piloto):-calcula_pontuacao_pilotos(N_piloto,PontuacaoCalculada),
piloto(N_piloto,Equipa,nome(Proprio,Apelido), Naturalidade, data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,_),nl,
retract(piloto(N_piloto,_,_,_,_,_,_,_)),
write('Piloto atualizado com sucesso'),nl,
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido), Naturalidade, data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,PontuacaoCalculada)).

calcula_pontuacao_pilotos(X,Pontuacao):-aux_calcula_pontuacao_pilotos(X,Pontuacao).

aux_calcula_pontuacao_pilotos(_,0):-findall(Lista_Resultados,resultados(_,_,Lista_Resultados),[]),!.
aux_calcula_pontuacao_pilotos(X,Pontuacao):-findall(Lista_Resultados,resultados(_,_,Lista_Resultados),LR),aux_lista_resultados_pontuacao(X,LR,Pontuacao).

%da_pontos(Classificacao, PontosAtribuidos)
%atribuidos segundo http://pt.wikipedia.org/wiki/Anexo:Sistema_de_pontua%C3%A7%C3%A3o_da_F%C3%B3rmula_1

da_pontos(1,25).
da_pontos(2,18).
da_pontos(3,15).
da_pontos(4,12).
da_pontos(5,10).
da_pontos(6,8).
da_pontos(7,6).
da_pontos(8,4).
da_pontos(9,2).
da_pontos(10,1).
da_pontos(_,0).

aux_lista_resultados_pontuacao(_,[],0).
aux_lista_resultados_pontuacao(X,[Lista_Resultados|Cauda],Pontuacao):-aux2_lista_resultados_pontuacoes(X,Lista_Resultados,PontuacaoCabeca),aux_lista_resultados_pontuacao(X,L,PontuacaoCauda),
Pontuacao is PontuacaoCauda + PontuacaoCabeca.

aux2_lista_resultados_pontuacoes(_,[],0):-!.
aux2_lista_resultados_pontuacoes(X,Lista_Resultados,Pontuacao):- posicao_lista(Lista_Resultados,X,Posicao),!,da_pontos(Posicao,Pontuacao).
aux2_lista_resultados_pontuacoes(_,_,0).

%posição na lista
posicao_lista(1,[C|_],C).
posicao_lista(N,[_|Cauda],C):-posicao(N1,Cauda,C), N is N1+1.
%-----------------------------------------------------------------------------------------------
%			Listar ou Mostar
%-----------------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------------
%			Listar Classificao actual de pilotos no campeonato por ordem crescente 16
%-----------------------------------------------------------------------------------------------
submenu_class_pilotos:-write('Qual a ordem de ordenacao dos pilotos: '),nl,
write(' 1- Ordem Crescente'),nl,
write(' 2- Ordem Descrescente'),nl,
write('Opcao: '),read(Op),nl,listar_classificacao_pilotos(Op).

listar_classificacao_pilotos(1):-consult('piloto.pl'),findall(piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),
		     						  piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),L),
									  quicksort_pilotos(L,Lordenada),nl,
									  write('Listagem de classificacoes do campeonato por ordem crescente:'),nl,
									  listar_mostra_listar_ordenada(Lordenada),!.

listar_classificacao_pilotos(2):-consult('piloto.pl'),findall(piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),
		     						  piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao),L),
									  quicksort_pilotos2(L,Lordenada),nl,
									  write('Listagem de classificacoes do campeonato por ordem decrescente:'),nl,
									  listar_mostra_listar_ordenada(Lordenada),!.



listar_mostra_listar_ordenada([]):-!.
listar_mostra_listar_ordenada([piloto(X,_,nome(Nome,Proprio),_,_,_,_,Pontuacao)|L]):-nl,
	write('Numero de Piloto: '),write(X),nl,
	write('Nome do Piloto: '),write(Nome),write(' '),write(Proprio),nl,
	write('Pontuacao Atual: '),write(Pontuacao),nl, listar_mostra_listar_ordenada(L).

%-----------------------------------------------------------------------------------------------
%			Listar Classificacao actual das equipas campeonato por ordem  17
%-----------------------------------------------------------------------------------------------

submenu_class_equipas:-write('Qual a ordem de ordenacao das equipas'),nl,
write(' 1- Ordem Crescente'),nl,
write(' 2- Ordem Descrescente'),nl,
write('Opcao: '),read(Op),nl,listar_classificacao_equipas(Op).

%Crescente
listar_classificacao_equipas(1):-consult('piloto.pl'),findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_),[]),!,fail.
listar_classificacao_equipas(1):-consult('piloto.pl'),findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_),L),
								%eliminar duplicados na lista
								set(L, Lequipas),listar_calculo_pontos_equipas(Lequipas,Li),listar_quicksort_equipas2(Li,ListaOrdenada),listar_mostra_lista_ordenada(ListaOrdenada).

listar_mostra_lista_ordenada([]):-!.
listar_mostra_lista_ordenada([pontuacao(X,Pontos)|L]):-
write(' Equipa: '),write(X),write(' - '),
write(' Pontos: '),write(Pontos),
nl,listar_mostra_lista_ordenada(L).
%criar lista com pontuacao de cada equipa
listar_calculo_pontos_equipas([],_):-!.
listar_calculo_pontos_equipas([X|L],[pontuacao(X,Pontos)|Li]):-listar_calculo_pontos_equipas(L,Li),listar_soma_pontos_pilotos(X,Pontos).

%somar pontos dos pilotos da mesma equipa
listar_soma_pontos_pilotos(Equipa,Contador):- findall(pilotos_da_equipa(X,Pontuacao),piloto(X,Equipa,_,_,_,_,_,Pontuacao),L),
									listar_aux_pilotos_equipa(L,Contador).

listar_aux_pilotos_equipa([],0):-!.
listar_aux_pilotos_equipa([pilotos_da_equipa(_,Pontuacao)|L],Contador1):- listar_aux_pilotos_equipa(L,Contador), 
																		Contador1 is Contador + Pontuacao.  

%DECRESCENTE



listar_classificacao_equipas(2):-consult('piloto.pl'),findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_),[]),!,fail.
listar_classificacao_equipas(2):-consult('piloto.pl'),findall(Equipa,piloto(_,Equipa,_,_,_,_,_,_),L),
								%eliminar duplicados na lista
								set(L, Lequipas),listar_calculo_pontos_equipas(Lequipas,Li),listar_quicksort_equipas(Li,ListaOrdenada),listar_mostra_lista_ordenada(ListaOrdenada).

listar_mostra_lista_ordenada([]):-!.
listar_mostra_lista_ordenada([pontuacao(X,Pontos)|L]):-
write(' Equipa: '),write(X),write(' - '),
write(' Pontos: '),write(Pontos),
nl,listar_mostra_lista_ordenada(L).
%criar lista com pontuacao de cada equipa
listar_calculo_pontos_equipas([],_):-!.
listar_calculo_pontos_equipas([X|L],[pontuacao(X,Pontos)|Li]):-listar_calculo_pontos_equipas(L,Li),listar_soma_pontos_pilotos(X,Pontos).

%somar pontos dos pilotos da mesma equipa
listar_soma_pontos_pilotos(Equipa,Contador):- findall(pilotos_da_equipa(X,Pontuacao),piloto(X,Equipa,_,_,_,_,_,Pontuacao),L),
									listar_aux_pilotos_equipa(L,Contador).

listar_aux_pilotos_equipa([],0):-!.
listar_aux_pilotos_equipa([pilotos_da_equipa(_,Pontuacao)|L],Contador1):- listar_aux_pilotos_equipa(L,Contador), 
																		Contador1 is Contador + Pontuacao.  


%-----------------------------------------------------------------------------------------------
%			Listar Resultados de uma prova com identificacao de um dos pilotos 18
%-----------------------------------------------------------------------------------------------
	
listar_aux_lista_resultados([]):-write('Nao tem mais resultados a mostrar'),nl.
listar_aux_lista_resultados([C|Cauda]):-write('Numero Piloto: '),write(C),write(' - '),listar_aux_lista_pilotos(C,Proprio,Apelido),write(Proprio),write(' '),write(Apelido),nl, listar_aux_lista_resultados(Cauda).
listar_aux_lista_pilotos(C,Proprio,Apelido):-setof(C,piloto(C,_,nome(Proprio,Apelido),_,_,_,_,_),_).


listresultadosdados:-consult('resultados.pl'),consult('piloto.pl'),
									 write('Digite a data da prova: '),nl,
									 write('Dia: '),read(Dia),nl,
									 write('Mes: '),read(Mes),nl,
									 write('Ano: '),read(Ano),nl,
				findall(resultados(Id_pista,dataprova(Dia,Mes,Ano),LR),
						resultados(Id_pista,dataprova(Dia,Mes,Ano),LR),L),mostrar_resultados_dados_piloto(L).
mostrar_resultados_dados_piloto([]):-!,write('Nao existem resultados ').
mostrar_resultados_dados_piloto([resultados(Id_pista,dataprova(Dia,Mes,Ano),LR)|Cauda]):-
write('  ID Pista: '),write(Id_pista),nl,
write('  Data da prova:  '),write(Dia),write('-'),write(Mes),write('-'),write(Ano),nl,
write('  Lista de Resultados por ordem decrescente: (do primeiro para o ultimo)  '),nl,listar_aux_lista_resultados(LR),nl,mostrar_resultados_dados_piloto(Cauda),nl.
%-----------------------------------------------------------------------------------------------
%			Mostrar a posicao actual de um piloto no campeonato 19
%-----------------------------------------------------------------------------------------------
listar_posicao_atual_piloto_no_campeonato:- consult('piloto.pl'),write('Npiloto'),read(X),nl,
								findall(piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),
		     						  piloto(N_Piloto,_,nome(Proprio,Apelido),_,_,_,_,Pontuacao_atual),L),
									  aux_quicksort_pilotos(L,Lordenada),
									  posicao_lista(Lordenada,piloto(X,_,nome(Proprio,Apelido),_,_,_,_,_),Posicao),Posicao_Verdadeira is Posicao +1,
									  write('Numero de Piloto: '),write(X),nl,
									  write('Nome do Piloto: '),write(Proprio),write(' '),write(Apelido),nl,
									  write('Posicao Actual no Campeopnato: '),write(Posicao_Verdadeira),!.

%-----------------------------------------------------------------------------------------------
%			Listar Classificao media de um determindado piloto  20
%-----------------------------------------------------------------------------------------------
listar_classificacao_media_piloto:-consult('piloto.pl'),consult('resultados.pl'),write('Qual o Numero do Piloto: '),
									nl,read(X),listar_classificacao_media_piloto2(X).

listar_classificacao_media_piloto2(X):- findall(ListaResultados,resultados(_,_,ListaResultados),L),
										  aux_classificacoes_media(X,L,Li),media(Resultado,Li),
										  write('Numero de Piloto: '),write(X),nl,get_nome_piloto(X,Proprio,Apelido),
										  write('Nome do Piloto: '),write(Proprio),write(' '),write(Apelido),nl,
										  write('Media de Classificacao: '),
										  write(Resultado),nl.


aux_classificacoes_media(_,[],[]):-!.
aux_classificacoes_media(Id_Piloto,[X|Cauda],[Posicao|Li]):-aux_classificacoes_media(Id_Piloto,Cauda,Li),
													 posicao_lista(X,Id_Piloto,Posicao).

listar_verifica_piloto_memoria(X):- findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
listar_verifica_piloto_memoria(X):- findall(X,piloto(X,_,_,_,_,_,_,_),_),nl.

%-----------------------------------------------------------------------------------------------
%			Listar as classificacoes de um piloto por ordem crescente de posição  21
%-----------------------------------------------------------------------------------------------
%Nao mostra a data da prova.
listar_resultados_ordem_crescente:-consult('resultados.pl'),consult('piloto.pl'),write('ID Piloto: '),read(X),nl,listar_classificacoes_piloto(X).	

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
												write('Lista de Pontuacoes: '),nl,imprime_lista(Lista_Achatada),nl,nl,
												listar_mostrar_lista_ordenada(N_Piloto,Cauda),!.

listar_get_pontuacoes(L):-	findall(ListaResultados,resultados(_,_,ListaResultados),L).

%-----------------------------------------------------------------------------------------------
%			Piloto com mais 1º lugares 22
%-----------------------------------------------------------------------------------------------
listar_piloto_mais_vitorioso:-consult('piloto.pl'),consult('resultados.pl'),findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
listar_piloto_mais_vitorioso:-consult('piloto.pl'),consult('resultados.pl'),findall(X,piloto(X,_,_,_,_,_,_,_),L),calcular_piloto_primeiros(L,Li),maximo_lista_primeiros(Li,Max),nl,listar_mostra_max(Max),nl.

listar_mostra_max(lugares(X,C)):- nl,write('O piloto com mais primeiros lugares e:  '),nl,get_nome_piloto(N_Piloto,Proprio,Apelido),nl,
				                     write(Proprio), write(' '),write(Apelido),write(' com '),write(C),write(' primeiros lugares.').

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
													write('Numero do Piloto: '),write(N_Piloto),get_nome_piloto(N_Piloto,Proprio,Apelido),nl,
													write('Nome: '),write(Proprio), write(' '),write(Apelido),nl,write('Numero de Primeiros Lugares: '),write(Contador),nl.

listar_trata_primeiros_lugares(_,[],0):-!.
listar_trata_primeiros_lugares(N_Piloto,[X|L],Contador):- listar_aux_trata_primeiros_lugares(N_Piloto,X, Contador_cabeca),
													listar_trata_primeiros_lugares(N_Piloto,L,Contador_Cauda),
													Contador is Contador_cabeca+Contador_Cauda.
														
listar_aux_trata_primeiros_lugares(_,[],0):-!.
listar_aux_trata_primeiros_lugares(X,Lista_resultados,Contador):-posicao_lista(Lista_resultados,X,Posicao),!,conta_posicoes(Posicao,Contador).
listar_aux_trata_primeiros_lugares(_,_,0).

%-----------------------------------------------------------------------------------------------
%			Mostrar piloto com mais títulos 23
%-----------------------------------------------------------------------------------------------
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

%-----------------------------------------------------------------------------------------------
%			Mostrar piloto mais velho a competir 24
%-----------------------------------------------------------------------------------------------
listar_piloto_mais_velho:-consult('piloto.pl'),consult('resultados.pl'),findall(idade(Id_Piloto,Ano),piloto(Id_Piloto,_,_,_,data_nasc(_,_,Ano),_,_,_),L),
					listar_tratar_mais_Velho(L,Li),listar_tratar_max_lista_idades(Li,Max),write('O piloto mais velho a competir e '),listar_tratar_max_idade(Max).

listar_tratar_mais_Velho([],_):-!.
listar_tratar_mais_Velho([idade(Id_Piloto,Ano)|L],[idade(Id_Piloto,Idade)|Li]):- listar_tratar_mais_Velho(L,Li),get_idade(Ano,2014,Idade).


listar_tratar_max_idade(idade(Id_Piloto,Idade)):-
get_nome_piloto(ID_Piloto,Proprio,Apelido),write(Proprio), write(' '),write(Apelido),
write(' com '),write(Idade),write(' anos'),nl.

listar_tratar_max_lista_idades([idade(Id_Piloto,Idade)],idade(Id_Piloto,Idade)).
listar_tratar_max_lista_idades([idade(Id_Piloto,Idade),idade(Id_Piloto1,Idade1)|Rest],Max):-listar_tratar_max_lista_idades([idade(Id_Piloto1,Idade1)|Rest],MaxRest),
																			listar_comparar_idades(idade(Id_Piloto,Idade),MaxRest,Max).

listar_comparar_idades(idade(Id_Piloto,Idade),idade(_,Idade1),idade(Id_Piloto,Idade)):- Idade>=Idade1.
listar_comparar_idades(idade(_,Idade),idade(Id_Piloto1,Idade1),idade(Id_Piloto1,Idade1)):- Idade<Idade1.
%-----------------------------------------------------------------------------------------------
%			Guardar dados que estejam a ser  manipulados em memória em ficheiro 25
%-----------------------------------------------------------------------------------------------
exportar_resultados:- tell('export_resultados.txt'),listing(resultados), told, write('Resultados exportados com sucesso ').
exportar_pilotos:- tell('export_pilotos.txt'),listing(piloto), told, write('Pilotos exportados com sucesso ').
%-----------------------------------------------------------------------------------------------
%			Extras
%----------------------------------------------------------------------------------------------

%-----------------------------------------------------------------------------------------------
%			Extra- Pesquisar Por Resultado.
%----------------------------------------------------------------------------------------------
pesqresultado:-nl,consult('piloto.pl'),consult('resultados.pl'),write('Numero de identificacao da pista: '),read(ID_Pista),mostrar_verifica_resultado_memoria(ID_Pista,ListaResultados).
																	%pesquisar_dados_resultado(ListaResultados).



	mostrar_verifica_resultado_memoria(ID_Pista,ListaResultados):-findall(
																		resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),
																		resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),	
																		[]),
																!,fail.

mostrar_verifica_resultado_memoria(ID_Pista,ListaResultados):-findall(resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados),ListaResultados),pesquisar_dados_resultado(ListaResultados).


pesquisar_dados_resultado([]):-!.
pesquisar_dados_resultado([resultados(ID_Pista,dataprova(Dia,Mes,Ano),ListaResultados)|Cauda]):-


write('ID da Pista: '),write(ID_Pista),nl,

write('Data da Prova '), write(Dia),write('-'), write(Mes),write('-'),write(Ano),nl,

write('Resultados : '),nl,nl,pesquisar_f_auxiliar_lista_resultados(ListaResultados),pesquisar_dados_resultado(Cauda).


pesquisar_f_auxiliar_lista_resultados([]):-write('Nao tem mais resultados a mostrar'),nl.
pesquisar_f_auxiliar_lista_resultados([C|Cauda]):-write(C),write(' - '),mostrar_f_auxiliar_mostra_nome_piloto(C,Proprio,Apelido),write(Proprio),write(' '),write(Apelido),nl, pesquisar_f_auxiliar_lista_resultados(Cauda).

mostrar_f_auxiliar_mostra_nome_piloto(C,Proprio,Apelido):-setof(C,piloto(C,_,nome(Proprio,Apelido),_,_,_,_,_),_).

%-----------------------------------------------------------------------------------------------
%			Extra- Calcular a distancia total da pista
%----------------------------------------------------------------------------------------------
calcular_percurso_pista:-consult('pistas.txt'),write('Introduza a Identificacao da pista: '),read(X),calcular_get_pistas(X).


calcular_get_pistas(X):-setof(X,pistas(X,_,_,_,_),_),fazcontas(X).

fazcontas(X):-get_info_pistas(X,Nome,Pais,Voltas,Metros),
Percurso is Voltas*Metros, KM is Percurso/1000,
write('Informacao da Pista: '),nl,nl,
write('Identificacao da Pista : '),write(X),nl,
write('Nome da Pista: '),write(Nome),nl,
write('Pais da Pista: '),write(Pais),nl,
write('Percurso em Metros: '),write(Percurso),nl,
write('Percurso em Kilometros: '),write(KM),nl.
get_info_pistas(X,Nome,Pais,Voltas,Metros):-setof(X,pistas(X,Nome,Pais,descricao(Voltas,Metros),_),_).

%-----------------------------------------------------------------------------------------------
%			Extra- Efectuar Backups dos ficheiros de pilotos, pistas e resultados.
%----------------------------------------------------------------------------------------------
menu_backups:-write('Escolha a Opcao: '),nl,
write('1- Exportar Ficheiros para Backup '),nl,
write('2- Importar Ficheiros de Backup '),nl,
read(Opcao),nl,backup(Opcao).

backup(1):- copiaficheiro('piloto.pl','backups/piloto_backup.pl'),
	copiaficheiro('pistas.txt','backups/pistas_backup.txt'),
	copiaficheiro('resultados.pl','backups/resultados_backup.pl').

backup(2):- copiaficheiro('backups/piloto_backup.pl','piloto.pl'),
	copiaficheiro('backups/pistas_backup.txt','pistas.txt'),
	copiaficheiro('backups/resultados_backup.pl','resultados.pl').

	%-----------------------------------------------------------------------------------------------
%			Extra- Exportar HTML
%----------------------------------------------------------------------------------------------

exportarhtml:-see('pistas.txt') , tell('pistas.html'),write('<table border="1">') ,listarPistas, write('</table>'),told, seen,!.

listarPistas:- read(Pista), exportar_html(Pista).
exportar_html(end_of_file):-!.
exportar_html(pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Historico)):- 
								write('<tr><td>Id da Pista: '), write(ID_Pista), 
								write('</td><td>Nome da Pista: '), write(Nome),
								write('</td><td>Pais: '), write(Pais),
								write('</td><td>Voltas: '), write(Voltas),
								write('</td><td>Metros: '), write(Metros),
								write('</td><td> Historico: '), write(Historico),
								write('</td>'),listarPistas.
								%Qpistas(1,'Albert Park','Australia',descricao(58,5303),[historico('Damon Hill',1996)]).exportarhtml:-see('BD_pilotos.txt') , tell('pilotos.html'), write('<table border="2">'), listarpilotos, write('</table>'), told, seen,!.

								exportarhtml:-see('BD_pilotos.txt') , tell('pilotos.html'), write('<table border="2">'), listarpilotos, write('</table>'), told, seen,!.

%-----------------------------------------------------------------------------------------------
%			Menu de Opcoes
%-----------------------------------------------------------------------------------------------
menuprincipal:-seen,told,see(user),tell(user),
cls,
write('#----------------------------------------------------------------------------------#'),nl,
write('|---                       Projecto                                             ---|'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                           Adicionar                                              |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|      1 - Piloto                                                                  |'),nl,
write('|      2 - Pistas                                                                  |'),nl,
write('|      3 - Resultados                                                              |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                          Remover                                                 |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|     4 - Pioloto                                                                  |'),nl,
write('|     5 - Pistas                                                                   |'),nl,
write('|     6 - Resultados                                                               |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                         Modificar                                                |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|      7 - Dados de Piloto                                                         |'),nl,
write('|      8 - Dados de Pistas                                                         |'),nl,
write('|      9 - Dados de Resultados                                                     |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                         Mostrar                                                  |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|      10 -  Piloto                                                                |'),nl,
write('|      11 -  Pista                                                                 |'),nl,
write('|      12 -  Resultados                                                            |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                         Pesquisar por campos                                     |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|      13 -  Piloto                                                                |'),nl,
write('|      14 -  Pista                                                                 |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                         Actualizar                                               |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|      15 -Pontuacao dos pilotos                                                   |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                        Listar/Mostrar                                            |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|      16 - Listar Classificao actual de pilotos no campeonato por ordem crescente |'),nl,
write('|      17 - Listar Classificacao actual das equipas campeonato por ordem           |'),nl,
write('|      18 - Listar Resultados de uma prova com identificacao de um dos pilotos     |'),nl,
write('|      19 - Mostrar a posicao actual de um piloto no campeonato                    |'),nl,
write('|      20-  Listar Classificao media de um determinado piloto                      |'),nl,
write('|      21 - Listar as classificacoes de um piloto por ordem crescente de posicaoo  |'),nl,
write('|      22 - Piloto com mais 1os lugares                                            |'),nl,
write('|      23 - Mostrar piloto com mais titulos                                        |'),nl,
write('|      24 - Mostrar piloto mais velho a competir                                   |'),nl,
write('|      25 - Guardar dados que estejam a ser manipulados em memória em ficheiro     |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                         EXtras                                                   |'),nl,
write('#----------------------------------------------------------------------------------#'),nl,
write('|      26 - Pesquisar o resultado por criterio                                     |'),nl,
write('|      27 - Calcular Percurso da Pista em KM e Metros                              |'),nl,
write('|      28 - Backups dos ficheiros da base de dados                                 |'),nl,
write('|      29 - Expotar HTML                                                           |'),nl,
write('|----------------------------------------------------------------------------------|'),nl,
write('|                          0 - SAIR                                                |'),nl,
write('#----------------------------------------------------------------------------------#'),nl,
write('                                                                                    '),nl,
write('Introduza a opcao seguida de ponto "." e  ENTER!'),nl,nl,
read(X),
write(X),
opcao(X).

opcao(0):-!.
opcao(1):-!,addpiloto, espera, menuprincipal.
opcao(2):-!,addpista, espera,  menuprincipal. 
opcao(3):-!,addresultado, espera,  menuprincipal.
opcao(4):-!,rempiloto, espera,  menuprincipal.
opcao(5):-!,rempista,espera,menuprincipal.
opcao(6):-!,remresultado,espera,menuprincipal.
opcao(7):-!,modpiloto,espera,menuprincipal.
opcao(8):-!,modpista, espera,  menuprincipal.
opcao(9):-!,modpresultado, espera,  menuprincipal.
opcao(10):-!,mostratodospilotos, espera,  menuprincipal.
opcao(11):-!,mostratodaspistas,espera,menuprincipal.
opcao(12):-!,mostratodosresultados,espera,menuprincipal.
opcao(13):-!,pesqpiloto,espera,menuprincipal.
opcao(14):-!,pesquisar_campos, espera,  menuprincipal.
opcao(15):-!,atualizar_todos_pilotos, espera,  menuprincipal.
opcao(16):-!,submenu_class_pilotos, espera,  menuprincipal.
opcao(17):-!,submenu_class_equipas,espera,menuprincipal.
opcao(18):-!,listresultadosdados,espera,menuprincipal.
opcao(19):-!,listar_posicao_atual_piloto_no_campeonato,espera,menuprincipal.
opcao(20):-!,listar_classificacao_media_piloto,espera,menuprincipal.
opcao(21):-!,listar_resultados_ordem_crescente,espera,menuprincipal.
opcao(22):-!,listar_piloto_mais_vitorioso,menuprincipal.
opcao(23):-!,listar_piloto_mais_titulos,espera,menuprincipal.
opcao(24):-!,listar_piloto_mais_velho,espera,menuprincipal.
opcao(25):-!, exportar_resultados, espera, exportar_pilotos, espera,  menuprincipal.
%%EXTRAS
opcao(26):-!,pesqresultado,espera,menuprincipal.
opcao(27):-!,calcular_percurso_pista,espera,menuprincipal.
opcao(28):-!,menu_backups,espera,menuprincipal.
opcao(29):-!,exportarhtml,espera,menuprincipal.
opcao(_):-!,menuprincipal.