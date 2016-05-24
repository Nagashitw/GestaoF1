pesq_pista_nome:-nl,write('Nome da Pista: '),read(Nome),pesquisar_pista_nome(Nome).
pesquisar_pista_nome(Nome):-seen,see('pistas.txt'),pesquisa_pista_nome(Nome),!.
pesquisar_pista_nome(Nome):-write('Pista Encontrada com sucesso').


pesquisa_pista_nome(Nome):-read(X),retorna_pista_nome(Nome,X).

retorna_pista_nome(Nome,end_of_file):-seen, inserir_pista(Nome).
retorna_pista_nome(Nome,pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('Nome: '),write(Nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_nome(Nome,_):-pesquisa_pista_nome(Nome).