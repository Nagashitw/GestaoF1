pesquisapistas:-write('Qual o Pais da pista que deseja pesquisar? '),read(Pais),nl,pesquisa_pistas(Pais).

pesquisa_pistas(Pais):-seen,see('pistas.txt'),pesquisar_pistas_aux(Pais),seen,see('pistas.txt').
pesquisar_pistas_aux(Pais):-read(X),retorna_pista(Pais,X).

retorna_pista(_,end_of_file):-!,write('Não existem pistas nesse Pais! '),nl.
retorna_pista(Pais,pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), LH)):-!, mostrar_pista(pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), LH)),nl.
retorna_pista(Pais,_):-pesquisar_pistas_aux(Pais).


mostrar_pista(pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), LH)):-!,
write('Identificacao da pista: '),write(IDPista),nl,
write('Nome da Pista: '), write(Nome_pista),nl,
write('Pais: '),write(Pais),nl,
write('Descricao da Pista :'),nl,
write('Numero de Voltas: '),write(Voltas),nl,nl,
write('Numero de Metros de uma Volta '),write(M),nl,
write('Historico da Pista: '), mostrar_f_auxiliar_historico_pistas(LH).
mostrar_pista(_):-!.

mostrar_f_auxiliar_historico_pistas([]):-nl,write('Nao existem mais dados no historico'),nl.
mostrar_f_auxiliar_historico_pistas([historico(Piloto,Ano)|Caudita]):-nl,
write('O Piloto '),write(Piloto),write(' ganhou em '),write(Ano),nl,mostrar_f_auxiliar_historico_pistas(Caudita).

%pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), [historico(Piloto, Ano)]).