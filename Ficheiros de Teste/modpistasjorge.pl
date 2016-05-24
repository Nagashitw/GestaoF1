modpista:-seen,told,see(pistas),tell(pistas'),nl,
	write('Introduza a identificacao da pista: '),read(IDPista),nl,
	modificar_modpista_verifica_pista(IDPista),seen,told,tell(pistas).
	
modificar_modpista_verifica_pista(IDPista):-see('pistas.txt'),modificar_modpista_verifica_pistas(IDPista).
modificar_modpista_verifica_pistas(IDPista):- read(X),modificar_modpista_verifica_pista2(X,IDPista).
modificar_modpista_verifica_pista2(end_of_file,_):-!,write('Pista nao existente na base de dados! '),nl.
modificar_modpista_verifica_pistas2(pistas(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH)):-write('Informacao da pista: '),nl,nl,mostrar_pistas(pistas(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH)),nl,nl,modificar_dados_pistas(IDPista).
modificar_modpista_verifica_pista2(_,IDPista):-modificar_modpista_verifica_pistas(IDPista).


modificar_dados_pistas(IDPista):-nl,seen,see('pistas.txt'),tell('pistas.txt'),
	write('	Introduza os novos dados da Pista: '),nl,nl,
	write('Novo NBome da Pista '),read(Nome_pista),
	write('Novo Pais: '),read(Pais),
	write('Novo Numero de Voltas '),read(CURSO),
	write('Distancia de uma volta (em metros): '),read(SEXO),
	write('Lista de Histórico:  '),nl,modpista_pede_lista_historico([],LH),
	editar_dados_pista1(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH),seen,tell('pistas.txt').
	 
editar_dados_pista1(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH):-
	seen,told,see('pistas.txt'),tell('pistas2.txt'),
	editar_dados_pista2(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH),seen,told,see('pistas.txt'),tell('pistas.txt'),
	copiaficheiro('pistas2.txt','pistas.txt'),tell('pistas2.txt'),told,nl,
	write('Dados do aluno alterados com sucesso!!!').
	
editar_dados_pista2(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH):-
	read(Dados),editar_dados_pista3(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH,Dados).
	
editar_dados_pista3(_,_,_,_,_,end_of_file):-!.
editar_dados_pista3(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH,pistas(IDPista,_,_,_,_)):-!,
			writeq(pistas(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH)),
	write('.'),nl,editar_dados_pista2(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH).
editar_dados_pista3(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH,Dados):-
	writeq(Dados),write('.'),nl,
	editar_dados_pista2(IDPista,Nome_pista,Pais,descricao(Voltas,M),LH).

	modpista_pede_lista_historico(Li,Lf):-write('Inserir novo? (s/n)'),read(X),modpista_verifica(X,Li,Lf).
	modpista_verifica('s',Li,[historico(Piloto,Ano)|Lf]):-!, write('Piloto? '),read(Piloto), write('Ano? '),read(Ano), modpista_pede_lista_historico(Li,Lf).
	modpista_verifica(_,Li,Li). 

	%pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), [historico(Piloto, Ano)]).