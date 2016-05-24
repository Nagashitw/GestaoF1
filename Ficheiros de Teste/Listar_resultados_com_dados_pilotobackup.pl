listar_aux_lista_resultados([]):-write('Nao tem mais resultados a mostrar'),nl.
listar_aux_lista_resultados([C|Cauda]):-write('Numero Piloto: '),write(C),write(' - '),listar_aux_lista_pilotos(C,Proprio,Apelido),write(Proprio),write(' '),write(Apelido),nl, listar_aux_lista_resultados(Cauda).
listar_aux_lista_pilotos(C,Proprio,Apelido):-setof(C,piloto(C,_,nome(Proprio,Apelido),_,_,_,_,_),_).




listresultadosdados:-consult('resultados.pl'),consult('piloto.pl'),
									 write('Digite a data da prova: '),nl,
									 write('Dia: '),read(Dia),nl,
									 write('Mes: '),read(Mes),nl,
									 write('Ano: '),read(Ano),nl,
				findall(resultados(Id_pista,dataprova(Dia,Mes,Ano),LR),
						resultados(Id_pista,dataprova(Dia,Mes,Ano),LR),L),mostrar_resultados_dados_piloto(L).
mostrar_resultados_dados_piloto([]):-!,write('Nao existem resultados ').
mostrar_resultados_dados_piloto([resultados(Id_pista,dataprova(Dia,Mes,Ano),LR)|Cauda]):-
write('  ID Pista: '),write(Id_pista),nl,
write('  Data da prova:  '),write(Dia),write('-'),write(Mes),write('-'),write(Ano),nl,
write('  Lista de Resultados por ordem crescente:  '),nl,listar_aux_lista_resultados(LR),nl,mostrar_resultados_dados_piloto(Cauda),nl.