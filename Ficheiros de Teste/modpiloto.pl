
modpiloto:-write('Introduza o numero do piloto que pretende modificar '),nl,read(N_piloto),nl,modificar_piloto(N_Piloto).
modificar_piloto(N_piloto):- aux_existe_piloto(N_piloto),!,opcoes_modificar_piloto(N_piloto).
modificar_piloto(_):- write('O piloto selecionado nao existe!'),nl.


opcoes_modificar_piloto(N_piloto):-write('Que dados do piloto quer modificar? Seleccione a opcao correspondente. '),nl,
write(' 1	Equipa'),nl,
write(' 2	Morada'),nl,
write(' 3	Naturalidade'),nl,
write(' 4	Pontuacao'),nl,
write(' Pedimos desculpa mas nao e possivel modificar os campos de ID, nome , data de nascimento e Lista de Titulos'),nl,nl,
write('Opcao: '),
read(Op),nl,submenu_modificar_piloto_criterio_OP(N_piloto,Op).

%Entram os parâmetros ID e opcao correspondente.
submenu_modificar_piloto_criterio_OP(N_piloto,1)	:-	write('Nova Equipa: '),read(Equipa),nl,
piloto(N_piloto,_,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Equipa do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,2)	:-	write('Nova Morada: '),read(Morada),nl,
piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),_,LT,Pontuacao_atual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Morada do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,3)	:-	write('Nova Naturalidade: '),read(Naturalidade),nl,
piloto(N_piloto,Equipa,nome(Proprio,Apelido),_,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Naturalidade do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,4)	:-	write('Nova Pontuacao: '),read(Pontuacao_atual),nl,
piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,_),
assertz(piloto(N_piloto,Equipa,nome(Proprio,Apelido),Naturalidade,data_nasc(Dia,Mes,Ano),Morada,LT,Pontuacao_atual)),
retract(piloto(N_piloto,_,_,_,_,_,_,_)),nl,!,write('Pontuacao do piloto modificada com sucesso'),nl,listing(piloto).

submenu_modificar_piloto_criterio_OP(N_piloto,_)	:-	write('Opcao seleccionada errada.'),nl.

aux_existe_piloto(N_piloto):- findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),[]),!,fail.
aux_existe_piloto(N_piloto):- findall(N_piloto,piloto(N_piloto,_,_,_,_,_,_,_),_),write('O piloto existe, pode fazer modificacoes. '),nl.