%::::: 12 ::::::::::::::::::Listar classificação média de determinado piloto nas provas já realizadas:::: v :::%
listar_classificacao_media_piloto:-consult('piloto.pl'),consult('resultados.pl'),write('Qual o Numero do Piloto: '),
									nl,read(X),listar_classificacao_media_piloto2(X).

listar_classificacao_media_piloto2(X):- findall(ListaResultados,resultados(_,_,ListaResultados),L),
										  aux_classificacoes_media(X,L,Li),media(Resultado,Li),
										  write('Numero de Piloto: '),write(X),nl, write('Media de Classificacao: '),
										  write(Resultado),nl.


aux_classificacoes_media(_,[],[]):-!.
aux_classificacoes_media(Id_Piloto,[X|Cauda],[Posicao|Li]):-aux_classificacoes_media(Id_Piloto,Cauda,Li),
													 posicao_lista(X,Id_Piloto,Posicao).

listar_verifica_piloto_memoria(X):- findall(X,piloto(X,_,_,_,_,_,_,_),[]),!,fail.
listar_verifica_piloto_memoria(X):- findall(X,piloto(X,_,_,_,_,_,_,_),_),nl.

posicao_lista([X|_],X, 0):-!.
posicao_lista([_|Cauda],X,N):-posicao_lista(Cauda,X,N1),!,N is N1+1.

%soma todos os elementos da lista
somatorio(0,[]):-!.
somatorio(X,[C|Cauda]):-somatorio(Y,Cauda),X is Y+C.

%conta o numero de elementos de uma lista.
contar_elementos_lista([],0).
contar_elementos_lista([_|Cauda],N):-contar_elementos_lista(Cauda,N1),N is N1+1.

%invoca as funcoes de somatorio para somar todos os elementos da lista, e conta os elementos para depois os dividir
media(X,L):-somatorio(S,L),contar_elementos_lista(L,N),X is S/N.