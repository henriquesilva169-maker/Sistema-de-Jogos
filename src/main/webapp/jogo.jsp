
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.sistemajogos.dao.JogoDAO" %>
<%@ page import="br.com.sistemajogos.model.Jogo" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.ArrayList" %>

<%
    JogoDAO dao = (JogoDAO) application.getAttribute("dao");

    if (dao == null) {
        dao = new JogoDAO();
        application.setAttribute("dao", dao);
    }

    ArrayList<Jogo> jogos = dao.getJogos();

    String mensagem = "";

    String acao = request.getParameter("acao");

    if (acao != null) {

        String nome = request.getParameter("nome");

        if ("cadastrar".equals(acao)) {

            String data = request.getParameter("dataLancamento");
            String genero = request.getParameter("genero");

            if (nome != null && !nome.trim().isEmpty()
                    && data != null && !data.isEmpty()
                    && genero != null && !genero.isEmpty()) {

                Jogo jogo = new Jogo(
                    nome,
                    LocalDate.parse(data),
                    genero
                );

                dao.cadastrar(jogo);
                mensagem = "Jogo cadastrado com sucesso!";
            }

        } else if ("excluir".equals(acao)) {

            dao.excluir(nome);
            mensagem = "Jogo excluído!";

        } else if ("atualizar".equals(acao)) {

            String novoNome = request.getParameter("novoNome");
            String novaData = request.getParameter("novaData");
            String novoGenero = request.getParameter("novoGenero");

            dao.atualizar(
                nome,
                novoNome,
                LocalDate.parse(novaData),
                novoGenero
            );

            mensagem = "Jogo atualizado!";
        }

        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Sistema de Jogos</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
            color: #1e293b;
        }

        header {
            background: #1e293b;
            color: white;
            text-align: center;
            padding: 25px;
        }

        main {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 4px 10px #00000010;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px;
            border: 1px solid #cbd5e1;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background: #2563eb;
            color: white;
        }

        button:hover {
            background: #1d4ed8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #e2e8f0;
            text-align: left;
        }

        th {
            background: #e2e8f0;
        }

        .excluir {
            background: #dc2626;
        }

        .excluir:hover {
            background: #b91c1c;
        }

        .mensagem {
            background: #dcfce7;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<header>
    <h1>🎮 Sistema de Jogos</h1>
    <p>Cadastro e gerenciamento de jogos</p>
</header>

<main>

    <div class="card">
        <h2>Cadastrar jogo</h2>

        <form action="index.jsp" method="post">

            <input type="hidden" name="acao" value="cadastrar">

            <label>Nome do jogo:</label>
            <input type="text" name="nome" required>

            <label>Data de lançamento:</label>
            <input type="date" name="dataLancamento" required>

            <label>Gênero:</label>
            <select name="genero" required>
                <option value="">Selecione</option>
                <option value="Ação">Ação</option>
                <option value="Aventura">Aventura</option>
                <option value="RPG">RPG</option>
                <option value="Terror">Terror</option>
                <option value="Esporte">Esporte</option>
                <option value="Corrida">Corrida</option>
                <option value="Estratégia">Estratégia</option>
                <option value="Outro">Outro</option>
            </select>

            <button type="submit">Cadastrar jogo</button>
        </form>
    </div>

    <div class="card">
        <h2>Jogos cadastrados</h2>

        <table>
            <tr>
                <th>Nome</th>
                <th>Data de lançamento</th>
                <th>Gênero</th>
                <th>Ação</th>
            </tr>

            <% for (Jogo jogo : jogos) { %>

            <tr>
                <td><%= jogo.getNome() %></td>
                <td><%= jogo.getDataLancamento() %></td>
                <td><%= jogo.getGenero() %></td>

                <td>
                    <form action="index.jsp" method="post">
                        <input type="hidden" name="acao" value="excluir">
                        <input type="hidden" name="nome"
                               value="<%= jogo.getNome() %>">

                        <button class="excluir" type="submit">
                            Excluir
                        </button>
                    </form>
                </td>
            </tr>

            <% } %>

        </table>
    </div>

</main>

</body>
</html>

