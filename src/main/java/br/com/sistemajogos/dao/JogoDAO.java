
package br.com.sistemajogos.dao;

import br.com.sistemajogos.model.Jogo;
import java.util.ArrayList;

public class JogoDAO {

    // Lista que armazena os jogos
    private ArrayList<Jogo> jogos = new ArrayList<>();

    public void cadastrar(Jogo jogo) {
        jogos.add(jogo);
    }


    public void listar() {

        if (jogos.isEmpty()) {
            System.out.println("Nenhum jogo cadastrado!");
            return;
        }

        System.out.println("\n===== JOGOS CADASTRADOS =====");

        for (Jogo jogo : jogos) {

            System.out.println("Nome: " + jogo.getNome());

            System.out.println("Data de lançamento: "
                    + jogo.getDataLancamento());

            System.out.println("Gênero: " + jogo.getGenero());

            System.out.println("-----------------------------");
        }
    }


    public void pesquisar(String nome) {

        for (Jogo jogo : jogos) {

            if (jogo.getNome().equalsIgnoreCase(nome)) {

                System.out.println("\n===== JOGO ENCONTRADO =====");
                System.out.println("Nome: " + jogo.getNome());
                System.out.println("Data de lançamento: " + jogo.getDataLancamento());
                System.out.println("Gênero: " + jogo.getGenero());

                return;
            }
        }

        System.out.println("Jogo não encontrado!");
    }


    public void excluir(String nome) {

        for (int i = 0; i < jogos.size(); i++) {

            if (jogos.get(i).getNome().equalsIgnoreCase(nome)) {

                jogos.remove(i);

                System.out.println("Jogo excluído com sucesso!");
                return;
            }
        }

        System.out.println("Jogo não encontrado!");
    }


    public void atualizar(String nome, String novoNome,
                          java.time.LocalDate novaData,
                          String novoGenero) {

        for (Jogo jogo : jogos) {

            if (jogo.getNome().equalsIgnoreCase(nome)) {

                jogo.setNome(novoNome);
                jogo.setDataLancamento(novaData);
                jogo.setGenero(novoGenero);

                System.out.println("Jogo atualizado com sucesso!");
                return;
            }
        }

        System.out.println("Jogo não encontrado!");
    }
    public ArrayList<Jogo> getJogos() {
        return jogos;
    }
}







