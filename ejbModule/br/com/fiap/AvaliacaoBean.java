package br.com.fiap;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import br.com.fiap.common.Questao;
import br.com.fiap.common.Resposta;

@Stateless
@Remote
@WebService
public class AvaliacaoBean implements Avaliacao{

	@PersistenceContext(unitName = "jdbc/fiap")
	private EntityManager entityManager;
	
	@Override
	@WebMethod
	public List obterQuestoes(@WebParam(name="codigoAvaliacao")int codigoAvaliacao) {
		Integer numberQuestao = 1;
		Integer numberResposta = 1;
		StringBuilder sb = new StringBuilder();
		TypedQuery<Questao> query = entityManager.createQuery("SELECT q FROM Questao q WHERE codigo = :codigo", Questao.class);
		query.setParameter("codigo", codigoAvaliacao);
		for(Questao q : query.getResultList()) {
			System.out.println(q.getDescricao());
			sb.append(numberQuestao.toString())
			.append(" - ").append(q.getDescricao());
			
			sb.append("\n");
			
			numberQuestao++;
			List<Resposta> respostas = obterAlternativas(codigoAvaliacao);
			
			for(Resposta r : respostas) {
				sb.append("\t")
				.append(numberResposta.toString())
				.append(" - ").append(r.getDescricao());
				
				sb.append("\n");
				numberResposta++;
			}
		}
		
		List<String> resposta = new ArrayList<>();
		resposta.add(sb.toString());
		return resposta;
	}
	
	private List obterAlternativas(int codigoAvaliacao) {

		TypedQuery<Resposta> query = entityManager.createQuery("SELECT r FROM Resposta r WHERE codigoquestao = :codigoquestao", Resposta.class);
		
		query.setParameter("codigoquestao", codigoAvaliacao);
		for(Resposta r : query.getResultList()) {
			System.out.println(r.getDescricao());
		}
		return query.getResultList();

	}

	@Override
	public void removerEJB() {
		// TODO Auto-generated method stub
		
	}

}
