%---- REMOVER PILOTO -------
% Falta verificar melhor as condições de paragem, mas funciona para já.

%Função usada para verificar se o piloto existe em memória, pedindo o numero de piloto.
verifica_piloto_memoria(N_piloto):-findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),[]),!,write('O Piloto nao existe'),nl,fail.
verifica_piloto_memoria(N_piloto):- true.

%Funcao principal para remover um piloto, pede o numero de piloto, se existir um piloto com o esse número é removido, caso contrário não.
rempiloto:-nl,write('Numero do Piloto: '),read(N_piloto),verifica_piloto_memoria(N_piloto),!,remover_piloto_memoria(N_piloto).
rempiloto:-write('Nao removeu piloto').

%Funcao usada para remover os dados do da memória.
remover_piloto_memoria(N_piloto):-retract(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_anual)),
write('Piloto removido com sucesso ! '),nl,nl,nl,nl.
