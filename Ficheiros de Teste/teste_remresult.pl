consult('resultados.pl').

verifica_resultado_memoria(Id_pista):-findall(Id_pista,resultados(Id_pista,_,_)[]),write('antes do cut'),!,write('depois do cut'),write('O resultado nao existe'),nl,fail.	
verifica_resultado_memoria(Id_pista):- true.

%Funcao principal para remover um resultado, pede o numero de resultado, se existir um resultado com o esse número é removido, caso contrário não.
remresultado:-nl,write('Numero da Pista: '),read(Id_pista),write('lixo'),verifica_resultado_memoria(Id_pista),write('lixo2'),
remover_resultado_memoria(Id_pista).
remresultado:-write('Nao removeu resultado').

%Funcao usada para remover os dados do da memória.
remover_resultado_memoria(Id_pista):-write('retract faz'),retract(resultados(Id_pista,_,_)),
write('resultado removido com sucesso ! '),nl,nl,nl,nl.

%retract(resultado(Id_pista,data_prova(Dia1,Dia2,Mes,Ano),_))
%resultados(Id_pista, dataprova(dia,mes,ano),[ListaResultados]).

%Função usada para verificar se o piloto existe em memória, pedindo o numero de piloto.
%verifica_piloto_memoria(N_piloto):-findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),[]),!,write('O Piloto nao existe'),nl,fail.
%verifica_piloto_memoria(N_piloto):- true.

%Funcao principal para remover um piloto, pede o numero de piloto, se existir um piloto com o esse número é removido, caso contrário não.
%rempiloto:-nl,write('Numero do Piloto: '),read(N_piloto),verifica_piloto_memoria(N_piloto),!,remover_piloto_memoria(N_piloto).
%rempiloto:-write('Nao removeu piloto').

%Funcao usada para remover os dados do da memória.
%remover_piloto_memoria(N_piloto):-retract(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_anual)),
%write('Piloto removido com sucesso ! '),nl,nl,nl,nl.