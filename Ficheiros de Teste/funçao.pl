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
pesquisa_campos_pistas(1):-nl,write('ID da Pista: '),read(IDPista),pesquisar_pista_id(IDPista).
pesquisar_pista_id(IDPista):-seen,see('pistas.txt'),pesquisa_pista_id(IDPista),!.
pesquisar_pista_id(IDPista):-write('Pista Encontrada com sucesso').
pesquisa_pista_id(IDPista):-read(X),retorna_pista_pesquisa_id(IDPista,X).
retorna_pista_id(IDPisra,end_of_file):-seen.
retorna_pista_id(IDPista,pistas(ID_Pista,nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('nome: '),write(nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pesquisa_id(IDPista,_):-pesquisa_pista_id(IDPista).

% PESQUISA PISTA PELO CRITERIO nome
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