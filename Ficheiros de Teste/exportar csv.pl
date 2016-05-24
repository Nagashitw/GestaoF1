exportarhtml:-see('pistas.txt') , tell('pistas.html'),write('<table border="1">') ,listarPistas, write('</table>'),told, seen,!.

listarPistas:- read(Pista), exportar_html(Pista).
exportar_html(end_of_file):-!.
exportar_html(pistas(ID_Pista,Nome,Pais,descricao(Voltas,Metros),Historico)):- 
								write('<tr><td>Id da Pista: '), write(ID_Pista), 
								write('</td><td>Nome da Pista: '), write(Nome),
								write('</td><td>Pais: '), write(Pais),
								write('</td><td>Voltas: '), write(Voltas),
								write('</td><td>Metros: '), write(Metros),
								write('</td><td> Historico: '), write(Historico),
								write('</td>'),listarPistas.
								%Qpistas(1,'Albert Park','Australia',descricao(58,5303),[historico('Damon Hill',1996)]).exportarhtml:-see('BD_pilotos.txt') , tell('pilotos.html'), write('<table border="2">'), listarpilotos, write('</table>'), told, seen,!.

								exportarhtml:-see('BD_pilotos.txt') , tell('pilotos.html'), write('<table border="2">'), listarpilotos, write('</table>'), told, seen,!.

listarpilotos:- read(Piloto), printhtml(Piloto).
printhtml(end_of_file):-!.
printhtml(piloto(Numero, Equipa, nome(PNome,UNome),Naturalidade, Nacionalidade,datanascimento(Dia, Mes, Ano), morada(Cidade, CP, Pais),_,Npontos)):- 
								write('<tr><td>'), write(Numero), 
								write('</td><td>'), write(Equipa),
								write('</td><td>'), write(PNome), write(' '), write(UNome),
								write('</td><td>'), write(Naturalidade),
								write('</td><td>'), write(Nacionalidade),
								write('</td><td>'), write(Dia), write('-'), write(Mes), write('-'), write(Ano),
								write('</td><td>'), write(Cidade), write(','), write(CP), write(','), write(Pais),
								write('</td><td>'), write(Npontos),
								write('</td>'),listarpilotos,menuprincipal.