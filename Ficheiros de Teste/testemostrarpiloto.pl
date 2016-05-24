%Função usada para verificar se o piloto existe em memória, pedindo o numero de piloto.
mostrar_verifica_piloto_memoria(N_piloto):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,Dia,Mes,Ano,Morada,NT,Pontuacao_atual),piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),ListaPilotos).
mostrar_verifica_piloto_memoria(N_piloto):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,Dia,Mes,Ano,Morada,NT,Pontuacao_atual),piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),[]),!,fail.

%Funcao principal para adicionar um piloto, pede o numero de piloto, se existir um piloto com o esse número sai, caso contrário insere um piloto novo.
mostrapiloto:-nl,write('Numero do Piloto: '),read(N_piloto),mostrar_verifica_piloto_memoria(N_piloto),!,mostrar_dados_piloto(ListaPilotos).
mostrapiloto:-write('').

%Funcao usada para pedir os dados do piloto ao utilizador.
mostrar_dados_piloto([piloto(N_Piloto,Equipa,Nom|Cauda]):-
write('Numero do Piloto: '),write(N_piloto),nl,
write('Equipa: '),write(Equipa),nl,
write('Nome Proprio '),write(Proprio),write(' '),
write('Apelido '),write(Apelido),nl,
write('Naturalidade: '),write(Naturalidade),nl,
write('Dia: '), write(Dia),write('-'),
write('Mes: '), write(Mes),write('-'),
write('Ano: '), write(Ano),nl,
write('Morada : '),write(Morada),nl,
write('Titulos Conquistados : '),mostrar_f_auxiliar_lista_titulos(NT),nl,
write('Pontuação Anual : '), write(Pontuacao_anual),nl.

listar_pilotos:-nl,findall(piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual),
						   ListarPilotos),mostrar_dados_piloto(ListaPilotos).

mostrar_dad1os_piloto([]):-!.
mostrar_da1dos_piloto([piloto(Numero,Equipa,nome_piloto(Proprio,Apelido),Naturalidade,Nacionalidade,data_nasc(Dia,Mes,Ano),Morada,ListaTitulos,Pontuacao_atual)|Cauda]):-
write('||=============================================================================================|'),nl,
write('|| Piloto:  ['),write(Numero),write('] '),write(Proprio),write(' '),write(Apelido),nl,
write('Equipa: '),write(Equipa),nl,
write('Naturalidade: '),write(Naturalidade),nl,
write('Data de Nascimento: '),write(Dia),write('-'),write(Mes),write('-'),write(Ano),nl,
write('Morada: '),write(Morada),nl,
write('Pontuacao: '),write(Pontuacao_atual),nl,
write(' Títulos Conquistados:  '),nl,
tab(1),write(' '),mostrar_f_auxiliar_lista_titulos(ListaTitulos),mostrar_dados_piloto(Cauda),nl.

mostrar_f_auxiliar_lista_titulos([]):-write('Sem titulos a mostrar / Fim da lista!'),nl.
mostrar_f_auxiliar_lista_titulos([titulo(Ano,Competicao)|L]):- write(' '),write(Ano),write(' - '),write(Competicao),nl,mostrar_f_auxiliar_lista_titulos(L).