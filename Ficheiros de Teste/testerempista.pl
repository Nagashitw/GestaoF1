modpista:-seen,told,see(user),tell(user),nl,
	write('Introduza o ID da pista '),read(ID_Pista),nl,
	modificar_verifica_pista(ID_Pista),seen,told,tell(user).
	
modificar_verifica_pista(ID_Pista):-see('pistas.txt'),modificar_verifica_pista1(ID_Pista).
modificar_verifica_pista1(ID_Pista):- read(X),modificar_verifica_pista2(X,ID_Pista).
modificar_verifica_pista2(end_of_file,_):-!,write('Pista nao encontrada!').
modificar_verifica_pista2(pistas(ID_Pista,Nome_Pista,Pais,descricao(Voltas,M), LH),ID_Pista):-
write('	Dados Atuais da Pista: '),nl,nl,
modificar_mostrar_pista(pistas(ID_Pista,Nome_Pista,Pais,descricao(Voltas,M),LH)),nl,nl,!,modificar_dados_pista(ID_Pista).
modificar_verifica_pista2(_,ID_Pista):-modificar_verifica_pista1(ID_Pista).


modificar_dados_pista(ID_Pista):-nl,seen,see(user),tell(user),
	write('	Introduza os Novos dados da Pista'),nl,nl,
	write('Nome da Pista: '),read(Nome_Pista),nl,
	write('Pais: '),read(Pais),nl,
	write('Descricao: '),nl,nl,
	write('Voltas: '),read(Voltas),nl,
	write('Metros por volta: '),read(M),nl,
	write('Introduza o Historico'),nl,pede_lista_historico([],LH),
	modificar_dados_pista1(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH),seen,tell(user).
	 
modificar_dados_pista1(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH):-
	seen,told,see('pistas.txt'),tell('pistas2.txt'),
	modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH),seen,told,see(user),tell(user),
	copiaficheiro('pistas2.txt','pistas.txt'),tell('piastas2.txt'),told,nl,
	write('Informacao da pista actualizada com sucesso '),nl.
	
modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH):-
	read(Dados),modificar_dados_pista3(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH,Dados).
	
modificar_dados_pista3(_,_,_,_,_,end_of_file):-!.
modificar_dados_pista3(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH,pistas(ID_Pista,_,_,_,_)):-!,
			writeq(pistas(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH)),
	write('.'),nl,modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH).
modificar_dados_pista3(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M),LH,Dados):-
	writeq(Dados),write('.'),nl,
	modificar_dados_pista2(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH).

modificar_mostrar_pista(pistas(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH)):-!,
	write('	Introduza os Novos dados da Pista'),nl,nl,
	write('Nome da Pista: '),write(Nome_Pista),nl,
	write('Pais: '),write(Pais),nl,
	write('Descricao: '),nl,nl,
	write('Voltas: '),write(Voltas),nl,
	write('Metros por volta: '),write(M),nl,
	write('Historico da pista: '),nl,write(LH),nl.
modificar_mostrar_pista(_):-!.

%pede_lista_historico([],LH)
pede_lista_historico(Li,Lf):-write('Inserir novo? (s/n)'),read(X),verifica(X,Li,Lf).
verifica('s',Li,[historico(Piloto,Ano)|Lf]):-!, write('Piloto? '),read(Piloto), write('Ano? '),read(Ano), pede_lista_historico(Li,Lf).
verifica(_,Li,Li).

%pistas(ID_Pista,Nome_Pista, Pais, descricao(Voltas,M), LH)
%pistas(IDPista, Nome_pista, Pais, descricao(Voltas, M), [historico(Piloto, Ano)]).

%copiar ficheiro
copiaficheiro(A,B):-seen,told,see(A),tell(B),copiaf,seen,told.
copiaf:-read(Item),copia(Item).
copia(end_of_file):-!.
copia(Item):-writeq(Item),write('.'),nl,copiaf.