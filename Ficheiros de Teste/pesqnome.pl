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


