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

write('Resultados : '),nl,nl,pesquisar_f_auxiliar_lista_resultados(ListaResultados),pesquisar_dados_resultado(Cauda),nl.


pesquisar_f_auxiliar_lista_resultados([]):-write('Nao tem mais resultados a mostrar'),nl.
pesquisar_f_auxiliar_lista_resultados([C|Cauda]):-write(C),write(' - '),mostrar_f_auxiliar_mostra_nome_piloto(C,Proprio,Apelido),write(Proprio),write(' '),write(Apelido),nl, pesquisar_f_auxiliar_lista_resultados(Cauda).

mostrar_f_auxiliar_mostra_nome_piloto(C,Proprio,Apelido):-setof(C,piloto(C,_,nome(Proprio,Apelido),_,_,_,_,_),_),nl.
