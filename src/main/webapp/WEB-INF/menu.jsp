
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Menu - Sistema de Jogos</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #0f172a;
            color: white;
        }

        header {
            background: #1e293b;
            padding: 25px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 30px;
        }

        header p {
            color: #cbd5e1;
        }

        main {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
        }

        .titulo {
            text-align: center;
            margin-bottom: 35px;
        }

        .titulo h2 {
            font-size: 28px;
        }

        .menu {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .opcao {
            background: #1e293b;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            transition: 0.3s;
        }

        .opcao:hover {
            background: #334155;
            transform: translateY(-5px);
        }

        .opcao h3 {
            margin-top: 0;
            font-size: 22px;
        }

        .opcao p {
            color: #cbd5e1;
            min-height: 40px;
        }

        .botao {
            display: inline-block;
            padding: 12px 25px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            margin-top: 10px;
        }

        .botao:hover {
            background: #1d4ed8;
        }

        .sair {
            background: #dc2626;
        }

        .sair:hover {
            background: #b91c1c;
        }

        footer {
            text-align: center;
            color: #94a3b8;
            padding: 25px;
        }

        @media (max-width: 600px) {
            .menu {
                grid-template-columns: 1fr;
            }
        }
    </style>

</head>

<body>

<header>
    <h1>🎮 Sistema de Jogos</h1>
    <p>Registro e gerenciamento de jogos</p>
</header>

<main>

    <div class="titulo">
        <h2>Menu Principal</h2>
        <p>Escolha uma opção para continuar</p>
    </div>

    <div class="menu">

        <div class="opcao">
            <h3>🎮 Cadastrar Jogo</h3>
            <p>Adicione um novo jogo ao sistema.</p>

            <a href="cadastro.jsp" class="botao">
                Cadastrar
            </a>
        </div>

        <div class="opcao">
            <h3>📋 Listar Jogos</h3>
            <p>Visualize todos os jogos cadastrados.</p>

            <a href="listagem.jsp" class="botao">
                Listar
            </a>
        </div>

        <div class="opcao">
            <h3>🔎 Pesquisar Jogo</h3>
            <p>Encontre um jogo pelo nome.</p>

            <a href="pesquisar.jsp" class="botao">
                Pesquisar
            </a>
        </div>

        <div class="opcao">
            <h3>✏️ Atualizar Jogo</h3>
            <p>Altere os dados de um jogo cadastrado.</p>

            <a href="atualizar.jsp" class="botao">
                Atualizar
            </a>
        </div>

        <div class="opcao">
            <h3>🗑️ Excluir Jogo</h3>
            <p>Remova um jogo do sistema.</p>

            <a href="excluir.jsp" class="botao">
                Excluir
            </a>
        </div>

        <div class="opcao">
            <h3>🚪 Sair</h3>
            <p>Volte para a página inicial.</p>

            <a href="index.jsp" class="botao sair">
                Sair
            </a>
        </div>

    </div>

</main>

<footer>
    Sistema de Jogos - Java JSP
</footer>

</body>
</html>
