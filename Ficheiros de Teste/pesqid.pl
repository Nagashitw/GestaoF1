pesquisar_campos:-seen,told,see(user),tell(user),

write('|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|'),nl,
write('|            Pesquisar Pistas por campos                   |'),nl,
write('|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|'),nl,
write('|      1 - ID da pista                                     |'),nl,
write('|      2 - Nome da pista                                   |'),nl,
write('|      3 - Pais                                            |'),nl,
write('|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|'),nl,
read(X),pesquisa_campos_pistas(X).


%PESQUISA PISTA PELO CRITERIO ID
pesquisa_campos_pistas(1):-nl,write('ID da Pista: '),read(IDPista),pesquisar_pista(IDPista).
pesquisar_pista_nome(IDPista):-seen,see('pistas.txt'),pesquisa_pista(IDPista),!.
pesquisar_pista_nome(IDPista):-write('Pista Encontrada com sucesso').
pesquisa_pista_nome(IDPista):-read(X),retorna_pista(IDPista,X).
retorna_pista_nome(IDPisra,end_of_file):-seen, inserir_pista(IDPista).
retorna_pista_nome(IDPista,pistas(ID_Pista,nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('nome: '),write(nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pesquisa_nome(IDPista,_):-pesquisa_pista(IDPista).

% PESQUISA PISTA PELO CRITERIO nome
pesquisa_campos_pistas(2):-nl,write('nome da Pista: '),read(nome),pesquisar_pista_nome(nome).
pesquisar_pista_nome(nome):-seen,see('pistas.txt'),pesquisa_pista_nome(nome),!.
pesquisar_pista_nome(nome):-write('Pista Encontrada com sucesso').
pesquisa_pista_nome(nome):-read(X),retorna_pista_nome(nome,X).
retorna_pista_nome(nome,end_of_file):-seen, inserir_pista(nome).
retorna_pista_nome(nome,pistas(ID_Pista,nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('nome: '),write(nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pesquisa_nome(nome,_):-pesquisa_pista_nome(nome).

%PESQUISA PISTA PELO CRITERIO PAIS
pesquisa_campos_pais(3):-nl,write('Pais : '),read(Pais),pesquisar_pista_pais(Pais).
pesquisar_pista_pais(Pais):-seen,see('pistas.txt'),pesquisa_pista_pais(Pais),!.
pesquisar_pista_pais(Pais):-write('Pista Encontrada com sucesso').
pesquisa_pista_pais(Pais):-read(X),retorna_pista_pais(Pais,X).
retorna_pista_pais(Pais,end_of_file):-seen, inserir_pista(Pais).
retorna_pista_pais(Pista,pistas(ID_Pista,pesquisa_pista_pais,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('Nome da pista: '),write(Pais),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pais(Pais,_):-pesquisa_pista_pais(Pais).