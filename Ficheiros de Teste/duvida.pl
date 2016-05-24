%Entra n_piloto e sai a ListaPilotos , é usada para ir buscar o piloto à lista dos pilotos segundo o critério N_piloto
mostrar_verifica_piloto_memoria(Equipa,ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),

								piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),[]),!,ListaPilotos=[].

mostrar_verifica_piloto_memoria(Equipa,ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),
								piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),ListaPilotos).

mostrapiloto:-nl,write('Numero do Piloto: '),read(N_piloto),mostrar_verifica_piloto_memoria(N_piloto,ListaPilotos),mostrar_dados_piloto(ListaPilotos).


mostrar_dados_piloto([]):-!.

mostrar_dados_piloto([piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual)|Cauda]):-

write('Numero de Piloto: '),write(N_piloto),nl,
write('Equipa: '),write(Equipa),nl,

write('Nome '),write(Proprio),write(' '),write(Apelido),nl,

write('Naturalidade: '),write(Naturalidade),nl,

write('Data de Nascimento '), write(Dia),write('-'), write(Mes),write('-'),write(Ano),nl,

write('Morada : '),write(Morada),nl,

write('Titulos Conquistados : '),mostrar_f_auxiliar_lista_titulos(NT),nl,

write('Pontuacao Atual : '), write(Pontuacao_atual),mostrar_dados_piloto(Cauda).





mostrar_f_auxiliar_lista_titulos([]):-write('Nao tem mais titulos').

mostrar_f_auxiliar_lista_titulos([titulo(Ano,Competicao)|Caudinha]):-nl,

write(Ano),write(' - '),write(Competicao),nl,mostrar_f_auxiliar_lista_titulos(Caudinha).

