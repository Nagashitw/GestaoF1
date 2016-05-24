verifica_resultado_memoria(Id_pista):-findall(Id_pista,resultados(Id_pista,_,_)),!,write('O resultado nao existe'),nl,fail.	
verifica_resultado_memoria(Id_pista):- true.

%Funcao principal para remover um resultado, pede o numero de resultado, se existir um resultado com o esse número é removido, caso contrário não.
remresultado:-nl,write('Numero da Pista: '),read(Id_pista),verifica_resultado_memoria(Id_pista),remover_resultado_memoria(Id_pista).
remresultado:-write('Nao removeu resultado').

%Funcao usada para remover os dados do da memória.
remover_resultado_memoria(Id_pista):-retract(resultados(Id_pista,_,_)),
write('resultado removido com sucesso ! '),nl,nl,nl,nl.