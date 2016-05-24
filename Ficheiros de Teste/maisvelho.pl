listar_piloto_mais_velho:-consult('piloto.pl'),consult('resultados.pl'),findall(idade(Id_Piloto,Ano),piloto(Id_Piloto,_,_,_,data_nasc(_,_,Ano),_,_,_),L),
					listar_tratar_mais_Velho(L,Li),listar_tratar_max_lista_idades(Li,Max),write('O piloto mais velho a competir e: '),nl,listar_tratar_max_idade(Max).

listar_tratar_mais_Velho([],_):-!.
listar_tratar_mais_Velho([idade(Id_Piloto,Ano)|L],[idade(Id_Piloto,Idade)|Li]):- listar_tratar_mais_Velho(L,Li),get_idade(Ano,2014,Idade).


listar_tratar_max_idade(idade(Id_Piloto,Idade)):-
get_nome_piloto(ID_Piloto,Proprio,Apelido),write(Proprio), write(' '),write(Apelido),
write(' com '),write(Idade),write(' anos'),nl.

listar_tratar_max_lista_idades([idade(Id_Piloto,Idade)],idade(Id_Piloto,Idade)).
listar_tratar_max_lista_idades([idade(Id_Piloto,Idade),idade(Id_Piloto1,Idade1)|Rest],Max):-listar_tratar_max_lista_idades([idade(Id_Piloto1,Idade1)|Rest],MaxRest),
																			listar_comparar_idades(idade(Id_Piloto,Idade),MaxRest,Max).

listar_comparar_idades(idade(Id_Piloto,Idade),idade(_,Idade1),idade(Id_Piloto,Idade)):- Idade>=Idade1.
listar_comparar_idades(idade(_,Idade),idade(Id_Piloto1,Idade1),idade(Id_Piloto1,Idade1)):- Idade<Idade1.

get_idade(Ano,Ano_atual,Idade):-Idade is Ano_atual - Ano.

get_nome_piloto(X,Proprio,Apelido):-setof(X,piloto(X,_,nome(Proprio,Apelido),_,_,_,_,_),_).