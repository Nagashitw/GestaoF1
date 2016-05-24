addresultado:-nl,consult('resultados.pl'),write('Numero da Pista: '),read(IDPista),verifica_resultados_pista_memoria(IDPista),!,inserir_resultados(IDPista).
addresultado:-write('Pista já existente').


verifica_resultados_pista_memoria(IDPista):-findall(IDPista,resultados(IDPista,_,_),[]),!.
verifica_resultados_pista_memoria(IDPista):-write('A Pista já tem resultados'),nl,fail.

inserir_resultados(IDPista):-seen,
write('Dia da Prova: '),read(Diap),
write('Mes da Prova '),read(Mesp),
write('Ano da Prova'),read(Anop),
write('Lista de Resultados: '),pede_lista_resultados(10,LP),
assertz(resultados(IDPista,dataprova(Diap,Mesp,Anop),LP)),
write('Resultados inseridos com sucesso ! '),nl,nl,nl,nl. 		

tratar_mostrar_lista_titulos([]):-write('Sem titulos a mostrar / Fim da lista!'),nl.
tratar_mostrar_lista_titulos([titulo(Ano,Competicao)|L]):- write(' '),write(Ano),write(' - '),write(Competicao),nl,tratar_mostrar_lista_titulos(L).

%pede_lista_resultados([],LS)
pede_lista_resultados(X,Lf):-verifica_resultados(X,Lf).
verifica_resultados(0,[]):-!.
verifica_resultados(X,[(Resultado)|Lf]):-write('Insira o Resultado '),read(Resultado),X1 is X-1, pede_lista_resultados(X1,Lf).