atualizar_todos_pilotos:-findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
atualizar_todos_pilotos:-findall(X,piloto(X,_,_,_,_,_,_,_),LP), write(LP),aux_actualizar_pilotos(LP),nl,write('Todas as pontuacoes foram actualizadas com sucesso ! ').

aux_actualizar_pilotos([]):-!.
aux_actualizar_pilotos([C|Cauda]):-write(C),atualizar_piloto(C),aux_actualizar_pilotos(Cauda).

atualizar_piloto(N_piloto):-calcula_pontuacao_pilotos(N_piloto,PontuacaoCalculada),
piloto(N_piloto,Equipa,nome(Proprio,Apelido), Naturalidade, data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,_),nl,
retract(piloto(N_piloto,_,_,_,_,_,_,_)),
write('Piloto atualizado com sucesso'),nl,
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido), Naturalidade, data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,PontuacaoCalculada)).

calcula_pontuacao_pilotos(X,Pontuacao):-aux_calcula_pontuacao_pilotos(X,Pontuacao).

aux_calcula_pontuacao_pilotos(_,0):-findall(Lista_Resultados,resultados(_,_,Lista_Resultados),[]),!.
aux_calcula_pontuacao_pilotos(X,Pontuacao):-findall(Lista_Resultados,resultados(_,_,Lista_Resultados),LR),aux_lista_resultados_pontuacao(X,LR,Pontuacao).

%da_pontos(Classificacao, PontosAtribuidos)
%atribuidos segundo http://pt.wikipedia.org/wiki/Anexo:Sistema_de_pontua%C3%A7%C3%A3o_da_F%C3%B3rmula_1

da_pontos(1,25).
da_pontos(2,18).
da_pontos(3,15).
da_pontos(4,12).
da_pontos(5,10).
da_pontos(6,8).
da_pontos(7,6).
da_pontos(8,4).
da_pontos(9,2).
da_pontos(10,1).
da_pontos(_,0).

aux_lista_resultados_pontuacao(_,[],0).
aux_lista_resultados_pontuacao(X,[Lista_Resultados|Cauda],Pontuacao):-aux2_lista_resultados_pontuacoes(X,Lista_Resultados,PontuacaoCabeca),aux_lista_resultados_pontuacao(X,L,PontuacaoCauda),
Pontuacao is PontuacaoCauda + PontuacaoCabeca.

aux2_lista_resultados_pontuacoes(_,[],0):-!.
aux2_lista_resultados_pontuacoes(X,Lista_Resultados,Pontuacao):- posicao_lista(Lista_Resultados,X,Posicao),!,da_pontos(Posicao,Pontuacao).
aux2_lista_resultados_pontuacoes(_,_,0).



%posição na lista
posicao_lista(1,[C|_],C).
posicao_lista(N,[_|Cauda],C):-posicao(N1,Cauda,C), N is N1+1.

%piloto(n_piloto,equipa,nome(proprio,apelido), naturalidade, data_nasc(dia,mes,ano),morada,[titulo(ano,competicao)],pontuacao_atual).