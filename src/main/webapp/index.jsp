
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="br.com.sistemajogos.model.Jogo" %>

<%
    // Lista de jogos armazenada na sessão
    ArrayList<Jogo> jogos =
        (ArrayList<Jogo>) session.getAttribute("jogos");

    if (jogos == null) {
        jogos = new ArrayList<>();
        session.setAttribute("jogos", jogos);
    }

    // Cadastro de jogo
    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String nome = request.getParameter("nome");
        String data = request.getParameter("dataLancamento");
        String genero = request.getParameter("genero");

        if (nome != null && !nome.trim().isEmpty()
                && data != null && !data.isEmpty()
                && genero != null && !genero.trim().isEmpty()) {

            LocalDate dataLancamento = LocalDate.parse(data);

            Jogo jogo = new Jogo(
                nome.trim(),
                dataLancamento,
                genero
            );

            jogos.add(jogo);
        }

        response.sendRedirect("index.jsp");
        return;
    }

    // Pesquisa de jogos
    String busca = request.getParameter("busca");

    if (busca == null) {
        busca = "";
    }

    busca = busca.trim();

    // Contar jogos encontrados
    int quantidadeEncontrada = 0;

    for (Jogo jogo : jogos) {

        if (jogo.getNome().toLowerCase()
                .contains(busca.toLowerCase())) {

            quantidadeEncontrada++;
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Sistema de Jogos</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 0;
            color: #1e293b;
        }

        /* Cabeçalho */

        header {
            background: #1e293b;
            color: white;
            padding: 25px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 32px;
        }

        header p {
            margin-bottom: 0;
        }

        /* Conteúdo principal */

        main {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }

        /* Cartões */

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 4px 10px #00000010;
        }

        h2 {
            margin-top: 0;
            color: #334155;
        }

        /* Formulários */

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 12px;
            margin-top: 7px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 15px;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 0 3px #2563eb20;
        }

        /* Botão procurar e cadastrar */

        button {
            margin-top: 20px;
            padding: 12px 20px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        button:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        /* Botão limpar pesquisa */

        .limpar {
            display: inline-block;
            margin-left: 10px;
            padding: 12px 20px;
            background: #e2e8f0;
            color: #334155;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.3s;
        }

        .limpar:hover {
            background: #cbd5e1;
            color: #1e293b;
            transform: translateY(-2px);
        }

        /* Resultado da pesquisa */

        .resultado {
            color: #64748b;
            margin-top: 20px;
            font-size: 14px;
        }

        /* Tabela */

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th,
        td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        th {
            background: #e2e8f0;
            color: #1e293b;
        }

        tr:hover {
            background: #f8fafc;
        }

        /* Mensagem quando não há jogos */

        .vazio {
            text-align: center;
            color: #64748b;
            padding: 20px;
        }

        /* Rodapé */

        footer {
            text-align: center;
            padding: 20px;
            color: #64748b;
        }

        /* Ajuste para celular */

        @media (max-width: 600px) {

            main {
                padding: 12px;
            }

            .card {
                padding: 18px;
            }

            table {
                font-size: 13px;
            }

            th,
            td {
                padding: 8px;
            }

            .limpar {
                margin-left: 0;
                margin-top: 10px;
            }
        }

    </style>

</head>

<body>

<header>

    <h1>🎮 Sistema de Jogos</h1>

    <p>Cadastre e organize seus jogos</p>

</header>

<main>

    <!-- Cadastro de jogos -->

    <div class="card">

        <h2>Cadastrar jogo</h2>

        <form action="index.jsp" method="post">

            <label for="nome">
                Nome do jogo:
            </label>

            <input type="text"
                   id="nome"
                   name="nome"
                   required>

            <label for="dataLancamento">
                Data de lançamento:
            </label>

            <input type="date"
                   id="dataLancamento"
                   name="dataLancamento"
                   required>

            <label for="genero">
                Gênero:
            </label>

            <select id="genero"
                    name="genero"
                    required>

                <option value="">
                    Selecione um gênero
                </option>

                <option value="Ação">Ação</option>
                <option value="Aventura">Aventura</option>
                <option value="RPG">RPG</option>
                <option value="Esporte">Esporte</option>
                <option value="Terror">Terror</option>
                <option value="Corrida">Corrida</option>
                <option value="Estratégia">Estratégia</option>
                <option value="Outro">Outro</option>

            </select>

            <button type="submit">
                Cadastrar jogo
            </button>

        </form>

    </div>

    <!-- Listagem e pesquisa -->

    <div class="card">

        <h2>Jogos cadastrados</h2>

        <!-- Pesquisa -->

        <form action="index.jsp" method="get">

            <label for="busca">
                Pesquisar jogo:
            </label>

            <input type="text"
                   id="busca"
                   name="busca"
                   placeholder="Digite o nome do jogo..."
                   value="<%= busca %>">

            <button type="submit">
                🔎 Procurar
            </button>

            <a href="index.jsp" class="limpar">
                ✖ Limpar pesquisa
            </a>

        </form>

        <!-- Quantidade encontrada -->

        <p class="resultado">
            Jogos encontrados: <%= quantidadeEncontrada %>
        </p>

        <!-- Tabela -->

        <table>

            <thead>

                <tr>
                    <th>Nome</th>
                    <th>Data de lançamento</th>
                    <th>Gênero</th>
                </tr>

            </thead>

            <tbody>

            <%
                if (quantidadeEncontrada == 0) {
            %>

                <tr>

                    <td colspan="3" class="vazio">

                        <% if (jogos.isEmpty()) { %>

                            Nenhum jogo cadastrado.

                        <% } else { %>

                            Nenhum jogo encontrado.

                        <% } %>

                    </td>

                </tr>

            <%
                } else {

                    for (Jogo jogo : jogos) {

                        if (jogo.getNome().toLowerCase()
                                .contains(busca.toLowerCase())) {
            %>

                <tr>

                    <td><%= jogo.getNome() %></td>

                    <td><%= jogo.getDataLancamento() %></td>

                    <td><%= jogo.getGenero() %></td>

                </tr>

            <%
                        }
                    }
                }
            %>

            </tbody>

        </table>

    </div>

</main>

<footer>

    Sistema de Jogos - Java JSP

</footer>

</body>
</html>
