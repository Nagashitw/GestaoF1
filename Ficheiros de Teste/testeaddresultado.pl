addresultado:-nl,write('Identificacao da Pista: '),read(IDPista),verifica_lista_resultados_pista_memoria(IDPista),!,inserir_resultados_memoria(IDPista).
addresultado:-write('Pista já existente').


verifica_lista_resultados_pista_memoria(IDPista):-findall(IDPista,resultados(IDPista,_,_),[]),!.
verifica_lista_resultados_pista_memoria(IDPista):-write('A Pista já tem resultados'),nl,fail.

inserir_resultados_memoria(IDPista):-seen,
write('Dia da Prova: '),read(Diap),
write('Mes da Prova: '),read(Mesp),
write('Ano da Prova: '),read(Anop),
write('Lista de Resultados: '),nl,write('Quantos resultados pertende inserir?'),read(Nr),nl,pede_lista_resultados(Nr,LP),
assertz(resultados(IDPista,dataprova(Diap,Mesp,Anop),LP)),
write('Resultados inseridos com sucesso ! '),nl,nl,nl,nl. 		

%pede_lista_resultados([],LS)
pede_lista_resultados(X,Lf):-verifica_lista_resultados(X,Lf).
verifica_lista_resultados(0,[]):-!.
verifica_lista_resultados(X,[(Resultado)|Lf]):-write('Insira o Resultado '),read(Resultado),X1 is X-1, pede_lista_resultados(X1,Lf).