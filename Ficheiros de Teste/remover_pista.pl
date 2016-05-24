%esta função faz uma copia dos dados para o pistas2.txt e apaga do original os dados , acho que o objectivo estava comprido, logo metia no trabalho :)

remover_pista	:-	write('Remover Pista atraves do Id'),nl,
		write(' ID da pista: '),read(IDPista),nl,
		verficheiro_pista(IDPista), copiaficheiro('pistas2.txt','pistas.txt').
		
	
verficheiro_pista(IDPista)	:-	see('pistas.txt'),tell('pistas2.txt'),lerficheiro_pista(IDPista),seen,told.
lerficheiro_pista(IDPista)	:-	read(X),remover_verifica_pista(IDPista,X).

% Verifica-se se essa pista existe na lista

remover_verifica_pista(_,end_of_file)		:-	!.
remover_verifica_pista(IDPista,pista(IDPista,_,_,_,_))	:-	!,lerficheiro_pista(IDPista).
remover_verifica_pista(IDPista,A):-	writeq(A),write('.'),nl,lerficheiro_pista(IDPista), 



%copiar ficheiro
copiaficheiro(A,B):-seen,told,see(A),tell(B),copiaf,seen,told.
copiaf:-read(Item),copia(Item).
copia(end_of_file):-!.
copia(Item):-writeq(Item),write('.'),nl,copiaf.