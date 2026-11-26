
package br.com.sistemajogos.view;

import br.com.sistemajogos.dao.JogoDAO;
import br.com.sistemajogos.model.Jogo;

import java.time.LocalDate;
import java.util.Scanner;

public class Menu {

    private Scanner scanner = new Scanner(System.in);
    private JogoDAO dao = new JogoDAO();

    public void exibirMenu() {

        int opcao;

        do {
            System.out.println("\n====== REGISTRO DE JOGOS ======");
            System.out.println("1 - Cadastrar jogo");
            System.out.println("2 - Listar jogos");
            System.out.println("3 - Pesquisar jogo");
            System.out.println("4 - Excluir jogo");
            System.out.println("5 - Atualizar jogo");
            System.out.println("6 - Sair");
            System.out.println("===============================");

            System.out.print("Escolha uma opção: ");
            opcao = scanner.nextInt();
            scanner.nextLine();

            switch (opcao) {

                case 1:
                    cadastrarJogo();
                    break;

                case 2:
                    dao.listar();
                    break;

                case 3:
                    pesquisarJogo();
                    break;

                case 4:
                    excluirJogo();
                    break;


                case 5:
                    atualizarJogo();
                    break;

                case 6:
                    System.out.println("Encerrando o sistema...");
                    break;


                default:
                    System.out.println("Opção inválida!");
            }

        }  while (opcao != 6);
    }


    private void atualizarJogo() {

        System.out.print("Digite o nome atual do jogo: ");
        String nome = scanner.nextLine();

        System.out.print("Digite o novo nome: ");
        String novoNome = scanner.nextLine();

        System.out.print("Nova data de lançamento (AAAA-MM-DD): ");
        LocalDate novaData;

        try {
            novaData = LocalDate.parse(scanner.nextLine());
        } catch (Exception e) {
            System.out.println("Data inválida!");
            return;
        }

        System.out.print("Novo gênero: ");
        String novoGenero = scanner.nextLine();

        dao.atualizar(nome, novoNome, novaData, novoGenero);
    }



    private void cadastrarJogo() {

        System.out.print("Nome do jogo: ");
        String nome = scanner.nextLine();

        if (nome.trim().isEmpty()) {
            System.out.println("O nome não pode ficar vazio!");
            return;
        }

        System.out.print("Data de lançamento (AAAA-MM-DD): ");
        String dataTexto = scanner.nextLine();

        LocalDate data;

        try {
            data = LocalDate.parse(dataTexto);
        } catch (Exception e) {
            System.out.println("Data inválida! Use o formato AAAA-MM-DD.");
            return;
        }

        System.out.print("Gênero: ");
        String genero = scanner.nextLine();

        if (genero.trim().isEmpty()) {
            System.out.println("O gênero não pode ficar vazio!");
            return;
        }

        Jogo jogo = new Jogo(nome, data, genero);

        dao.cadastrar(jogo);

        System.out.println("Jogo cadastrado com sucesso!");
    }

    private void pesquisarJogo() {

        System.out.print("Digite o nome do jogo: ");
        String nome = scanner.nextLine();

        dao.pesquisar(nome);
    }

    private void excluirJogo() {

        System.out.print("Digite o nome do jogo que deseja excluir: ");
        String nome = scanner.nextLine();

        dao.excluir(nome);
    }
}
