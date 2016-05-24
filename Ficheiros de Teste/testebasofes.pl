%Função usada para verificar se o piloto existe em memória, pedindo o numero de piloto.
mostrar_verifica_piloto_memoria(N_piloto):-findall([N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual],piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),ListaPilotos),mostrar_dados_piloto(ListaPilotos).
mostrar_verifica_piloto_memoria(N_piloto):-findall([N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual],piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),[]),!.


%Funcao principal para adicionar um piloto, pede o numero de piloto, se existir um piloto com o esse número sai, caso contrário insere um piloto novo.
mostrapiloto:-nl,write('Numero do Piloto: '),read(N_piloto),mostrar_verifica_piloto_memoria(N_piloto).
mostrapiloto:-write('').

%Funcao usada para pedir os dados do piloto ao utilizador.
mostrar_dados_piloto([]):-!.
mostrar_dados_piloto([piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual)|Cauda]):-
write('Numero do Piloto: '),write(N_piloto),nl,
write('Equipa: '),write(Equipa),nl,
write('Nome Proprio '),write(Proprio),write(' '),
write('Apelido '),write(Apelido),nl,
write('Naturalidade: '),write(Naturalidade),nl,
write('Data de Nascimento '), write(Dia),write('-'), write(Mes),write('-'),write(Ano),nl,
write('Morada : '),write(Morada),nl,
write('Titulos Conquistados : '),mostrar_f_auxiliar_lista_titulos(NT),nl,
write('Pontuação Anual : '), write(Pontuacao_anual),nl,mostrar_dados_piloto(Cauda).


mostrar_f_auxiliar_lista_titulos([]):-write('Não tem mais titulos'),nl.
mostrar_f_auxiliar_lista_titulos([titulo(Ano,Competicao)|Caudinha]):-nl,
write(Ano),write(' - '),write(Competicao),nl,mostrar_f_auxiliar_lista_titulos(Caudinha).

%piloto(n_piloto,equipa,nome(proprio,apelido), naturalidade, data_nasc(dia,mes,ano),morada,[titulo(ano,competicao)],pontuacao_atual).

listar_pilotos:-nl,findall(piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   L),mostrar_L(L).

visualizarpista :- nl, write('###################################################'),nl, write('# Visualizar Pista #'),nl, write('# #'),nl,
 write('#-------------------------------------------------#'),nl, write('# #'),nl, visualizapista. 
 visualizapista :- findall([I,N,P,D,LE], pista(I,N,P,D,LE), L), escrevelistadelista(L),menuprincipal.