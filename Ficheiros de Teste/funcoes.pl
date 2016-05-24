%Consults

consult('piloto.pl').
teste:-consult('resultados.pl').

%inserirfim(X,L,LX).
%inserirfim(X,[],[X]).
%inserirfim(X,[C|Cauda],[C|CaudaX]) :- inserirfim(X,Cauda,CaudaX).


%---- ADICIONAR PILOTO -------
%pede_lista_titulos([],LT)
pede_lista_titulos(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica_lista_titulos(X,Li,Lf).
verifica_lista_titulos('s',Li,[titulo(Ano,Competicao)|Lf]):-!, write('Ano?'),read(Ano), write('Competicao?'),read(Competicao), pede_lista_titulos(Li,Lf).
verifica_lista_titulos(_,Li,Li). 

%Função usada para verificar se o piloto existe em memória, pedindo o numero de piloto.
verifica_piloto_memoria(N_piloto):-findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),[]),!.
verifica_piloto_memoria(N_piloto):-write('O Piloto Existe, por favor tente outro piloto'),nl,fail,.

%Funcao principal para adicionar um piloto, pede o numero de piloto, se existir um piloto com o esse número sai, caso contrário insere um piloto novo.
addpiloto:-nl,consult('piloto.pl'),write('Numero do Piloto: '),read(N_piloto),verifica_piloto_memoria(N_piloto),!,inserir_dados_piloto(N_piloto).
addpiloto:-write('').

%Funcao usada para pedir os dados do piloto ao utilizador.
inserir_dados_piloto(N_piloto):-seen,
write('Equipa: '),read(Equipa),
write('Nome Proprio '),read(Proprio),
write('Apelido '),read(Apelido),
write('Naturalidade: '),read(Naturalidade),
write('Dia: '), read(Dia),
write('Mes: '), read(Mes),
write('Ano: '), read(Ano),
write('Morada : '),read(Morada),
write('Titulos Conquistados : '),pede_lista_titulos([],LT),
write('Pontuação Anual : '), read(Pontuacao_anual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_anual)),
write('Piloto inserido com sucesso ! '),nl,nl,nl,nl. 	


%---- ADICIONAR RESULTADO -------
addresultado:-nl,consult('resultados.pl'),write('Numero da Pista: '),read(IDPista),verifica_resultados_pista_memoria(IDPista),!,inserir_resultados(IDPista).
addresultado:-write('Pista já existente').


verifica_resultados_pista_memoria(IDPista):-findall(IDPista,resultados(IDPista,_,_),[]),!.
verifica_resultados_pista_memoria(IDPista):-write('A Pista já tem resultados'),nl,fail.

inserir_resultados(IDPista):-seen,
write('Dia da Prova: '),read(Diap),
write('Mes da Prova '),read(Mesp),
write('Ano da Prova'),read(Anop),
write('Lista de Resultados: '),pede_lista_resultados(10,LP),
assertz(resultados(IDPista,dataprova(Diap,Mesp,Anop),LP)),
write('Resultados inseridos com sucesso ! '),nl,nl,nl,nl. 		

%pede_lista_resultados([],LS)
pede_lista_resultados(X,Lf):-verifica_resultados(X,Lf).
verifica_resultados(0,[]):-!.
verifica_resultados(X,[(Resultado)|Lf]):-write('Insira o Resultado '),read(Resultado),X1 is X-1, pede_lista_resultados(X1,Lf).

%-----ADICIONAR PISTAS (EM FICHEIRO) ------

addpista:-nl,write('IDPista: '),read(IDPista),pesquisar_pista_add(IDPista).

%Pesquisa a Pista 

pesquisar_pista_add(IDPista):-seen,see('pistas.txt'),pesquisa_pista_add(IDPista),!,copiaficheiro('pistascopias.txt','pistas.txt').
pesquisar_pista_add(IDPista):-addpista.


pesquisa_pista_add(IDPista):-read(X),retorna_pista_add(IDPista,X).

retorna_pista_add(IDPista,end_of_file):-seen, inserir_pista(IDPista).
retorna_pista_add(IDPista,pistas(IDPista,_,_,_,_)):-!,seen , write('Pista já existe!'),nl,nl,nl,fail.
retorna_pista_add(IDPista,_):-pesquisa_pista_add(IDPista).


inserir_pista(IDPista):-
write('Nome da pista: '),read(Nome_pista),
write('Pais: '),read(Pais),
write('Descricao: '),nl,
write('	Numero de voltas: '),read(Voltas),
write('	Metros: '),read(M),
write('Historico:'),nl,pede_lista_historico([],LH),
tell('pistascopias.txt'), see('pistas.txt'),copiaf,writeq(pistas(IDPista, Nome_pista, Pais, descricao(Voltas,M),LH)),write('.'),nl,told, seen.


%copiar ficheiro
copiaficheiro(A,B):-seen,told,see(A),tell(B),copiaf,seen,told.
copiaf:-read(Item),copia(Item).
copia(end_of_file):-!.
copia(Item):-writeq(Item),write('.'),nl,copiaf.

%pede_lista_historico([],LH)
pede_lista_historico(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica_lista_historico(X,Li,Lf).
verifica_lista_historico('s',Li,[historico(Piloto,Ano)|Lf]):-!, write('Piloto? '),read(Piloto), write('Ano? '),read(Ano), pede_lista_historico(Li,Lf).
verifica_lista_historico(_,Li,Li). 