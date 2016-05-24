%---- REMOVER RESULTADOS-------
% Falta verificar melhor as condições de paragem, mas funciona para já.

%Função usada para verificar se o Resultado existe em memória, pedindo o numero da Pista.
verifica_resultado_memoria(ID_Pista):-findall(ID_Pista,resultados(ID_Pista,_,_),[]),!,write('O Resultado nao existe'),nl,fail.
verifica_resultado_memoria(ID_Pista):-true.

%Funcao principal para remover um Resultado, pede o numero de Resultado, se existir um Resultado com o esse número é removido, caso contrário não.
remresultado:-nl,write('Numero da Pista: '),read(ID_Pista),verifica_resultado_memoria(ID_Pista),!,remover_resultado_memoria(ID_Pista).
remresultado:-write('Nao removeu Resultado').

%Funcao usada para remover os dados do da memória.
remover_resultado_memoria(ID_Pista):-retract(resultados(ID_Pista,dataprova(Dia,Mes,Ano),L)),
write('Resultado removido com sucesso ! '),nl,nl,nl,nl.
