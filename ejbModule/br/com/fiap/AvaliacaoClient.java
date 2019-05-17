package br.com.fiap;

import javax.naming.InitialContext;

public class AvaliacaoClient {
	public static void main(String[] args) throws Exception{
		InitialContext context = new InitialContext();
		Avaliacao avaliacao = (Avaliacao) context.lookup("AvaliacaoBean/remote");
		
		avaliacao.obterQuestoes(1);
	}
}
