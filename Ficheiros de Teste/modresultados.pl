modresultado:-write('Introduza a identificacao da pista do resultado: '),nl,read(ID_Pista),nl,modificar_resultado(ID_Pista).
modificar_resultado(ID_Pista):- aux_existe_resultado(ID_Pista),!,opcoes_modificar_resultados(ID_Pista).
modificar_resultado(_):- write('A pista selecionada nao existe!'),nl.


opcoes_modificar_resultados(ID_Pista):-write('Que dados do resultado quer modificar? Seleccione a opcao correspondente. '),nl,
write(' 1	Data da Prova'),nl,
write(' 2	Lista de Resultados'),nl,
write('Opcao: '),
read(Op),nl,submenu_modificar_resultado_criterio_OP(ID_Pista,Op).

%Entram os parâmetros ID e opcao correspondente.
submenu_modificar_resultado_criterio_OP(ID_Pista,1)	:-	write('Nova data de prova: '),nl,
write('Dia: '),read(Dia),nl,
write('Mes: '),read(Mes),nl,
write('Ano: '),read(Ano),nl,
resultados(ID_Pista,_,LR),
assertz(resultados(ID_Pista,dataprova(Dia,Mes,Ano),LR)),
retract(resultados(ID_Pista,_,_)),nl,!,write('Data da prova modificada com sucesso'),nl,listing(resultados).

submenu_modificar_resultado_criterio_OP(ID_Pista,2):- write('Insira a nova lista de resultados, por ordem decrescente (do primeiro lugar, para o ultimo)'),nl,nl,nl,
pede_lista_resultados(10,LR),
resultados(ID_Pista,dataprova(Dia,Mes,Ano),_),
assertz(resultados(ID_Pista,dataprova(Dia,Mes,Ano),LR)),
retract(resultados(ID_Pista,_,_)),nl,!,write('Lista de Resultados modificada com sucesso.'),nl,listing(resultados).


submenu_modificar_resultado_criterio_OP(ID_Pista,_)	:-	write('Opcao seleccionada errada.'),nl.

aux_existe_resultado(ID_Pista):- findall(ID_Pista,resultados(ID_Pista,_,_),[]),!,fail.
aux_existe_resultado(ID_Pista):- findall(ID_Pista,resultados(ID_Pista,_,_),_),write('A pista existe, pode fazer modificacoes nos campos dos resultados. '),nl,nl.

pede_lista_resultados(X,Lf):-verifica_lista_resultados(X,Lf).
verifica_lista_resultados(0,[]):-!.
verifica_lista_resultados(X,[(Resultado)|Lf]):-write('Insira o Resultado '),read(Resultado),X1 is X-1, pede_lista_resultados(X1,Lf).

%resultados(ID_Pista, dataprova(dia,mes,ano),[ListaResultados]).