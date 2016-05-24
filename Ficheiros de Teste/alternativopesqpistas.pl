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