pesquisa_campos_pistas(2):-pesq_pista_id.
pesq_pista_id:-nl,write('Identificacao da Pista: '),read(ID_Pista),nl,pesquisar_pista_id(ID_Pista).
pesquisar_pista_id(ID_Pista):-seen,see('pistas.txt'),pesquisa_pista_id(ID_Pista),!.
pesquisar_pista_id(ID_Pista):-nl,write('Pista Encontrada com sucesso').
pesquisa_pista_id(ID_Pista):-read(X),retorna_pista_id(ID_Pista,X).
retorna_pista_id(ID_Pista,end_of_file):-seen,fail.
retorna_pista_id(ID_Pista,pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Hist)):-!,seen,
write('ID da Pista: '),write(ID_Pista),nl,
write('Nome: '),write(Nome),nl,
write('Pais: '),write(Pais),nl,
write('Descricao'),nl,
write('Voltas: '),write(Voltas),nl,
write('Metros: '),write(Metros),nl,fail,
write('Historico: '),write(Hist),nl.
retorna_pista_pesquisa_id(ID_Pista,_):-pesquisa_pista_id(ID_Pista).