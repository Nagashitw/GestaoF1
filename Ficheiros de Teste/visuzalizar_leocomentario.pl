visualizar_pista:-write('Insira o ID da pista: '),read(IDPista),nl,pesquisa_pista_visualizar(IDPista).

%Pesquisa o pista inserido pelo utilizador 

pesquisa_pista_visualizar(IDPista):-seen,see('pistas.txt'),pesquisar_pista_visualizar(IDPista).
pesquisar_pista_visualizar(IDPista):-read(X),write(X),retorna_pista_visualizar(IDPista,X).

retorna_pista_visualizar(_,end_of_file):-!,write('Pista nao existente!'),nl.
retorna_pista_visualizar(IDPista,pistas(IDPista,Nome_Pista,Pais,descricao(Voltas,M),H)):-!,mostrar_pista_visualizar(pistas(IDPista,Nome_Pista,Pais,descricao(Voltas, M),H)).

retorna_pista_visualizar(IDPista,_):-pesquisar_pista_visualizar(IDPista).

%---------------------------------------------
%            Mostrar pista
%---------------------------------------------
mostrar_pista_visualizar(pistas(IDPista,Nome_Pista,Pais,descricao(Voltas, M),H)):- 
write('Nome da pista:'),write(Nome_Pista),nl,
write('Pais:'),write(Pais),nl,
write('Descricao:'),nl,
write('Voltas'),write(Voltas), nl,
write('Metros:'),write(M),nl,
write('Historico:'),write(H),nl.