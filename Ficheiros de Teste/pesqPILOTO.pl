	pesquisar_verifica_piloto_memoria(N_piloto,ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),

									piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),[]),!,ListaPilotos=[].

	pesquisar_verifica_piloto_memoria(N_piloto,ListaPilotos):-findall(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),
									piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual),ListaPilotos).

	pesqpiloto:-nl,write('Numero do Piloto: '),read(N_piloto),pesquisar_verifica_piloto_memoria(N_piloto,ListaPilotos),pesquisar_mostrar_dados_piloto(ListaPilotos).


	pesquisar_mostrar_dados_piloto([]):-!.

	pesquisar_mostrar_dados_piloto([piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,NT,Pontuacao_atual)|Cauda]):-


	write('Equipa: '),write(Equipa),nl,

	write('Nome '),write(Proprio),write(' '),write(Apelido),nl,

	write('Naturalidade: '),write(Naturalidade),nl,

	write('Data de Nascimento '), write(Dia),write('-'), write(Mes),write('-'),write(Ano),nl,

	write('Morada : '),write(Morada),nl,

	write('Titulos Conquistados : '),pesquisar_f_auxiliar_lista_titulos(NT),nl,

	write('Pontuacao Atual : '), write(Pontuacao_atual),pesquisar_mostrar_dados_piloto(Cauda).





	pesquisar_f_auxiliar_lista_titulos([]):-write('Nao tem mais titulos').

	pesquisar_f_auxiliar_lista_titulos([titulo(Ano,Competicao)|Caudinha]):-nl,

	write(Ano),write(' - '),write(Competicao),nl,pesquisar_f_auxiliar_lista_titulos(Caudinha).
