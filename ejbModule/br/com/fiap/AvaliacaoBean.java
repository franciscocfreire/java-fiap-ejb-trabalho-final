package br.com.fiap;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import br.com.fiap.common.Questao;

@Stateless
@Remote
public class AvaliacaoBean implements Avaliacao{

	@PersistenceContext(unitName = "jdbc/fiap")
	private EntityManager entityManager;
	
	@Override
	public List obterQuestoes(int codigoAvaliacao) {
		TypedQuery<Questao> query = entityManager.createQuery("SELECT q FROM Questao q", Questao.class);
		
		for(Questao q : query.getResultList()) {
			System.out.println(q.getDescricao());
		}
		return query.getResultList();
	}

	@Override
	public void removerEJB() {
		// TODO Auto-generated method stub
		
	}

}
