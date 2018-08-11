package br.com.caelum.tarefas.jpa;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.caelum.tarefas.modelo.Tarefa;

public class CarregaTarefa {
	public static void main(String[] args) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factory.createEntityManager();
		
		Tarefa encontrada = manager.find(Tarefa.class, 1L);
		
		System.out.println("Descrição da tarefa: " + encontrada.getDescricao());
		manager.close();
	}
}
