<%-- 
    Document   : produtoCadastrar
    Created on : 23 de nov. de 2025, 12:29:06
    Author     : gta98
--%>

<%@page import="model.DAO.ProdutosDAO"%>
<%@page import="model.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Produto</title>
    <meta charset="UTF-8">
</head>

<body>

    <h1>Cadastrar Produto</h1>

    <form action="produtoCadastrar.jsp" method="post">

        Nome:<br>
        <input type="text" name="nome" required><br><br>

        Categoria:<br>
        <input type="text" name="categoria"><br><br>

        Preço de Venda:<br>
        <input type="number" step="0.01" name="preco_venda" required><br><br>

        Preço de Custo:<br>
        <input type="number" step="0.01" name="preco_custo"><br><br>

        Unidade de Medida:<br>
        <input type="text" name="unidade_medida"><br><br>

        <input type="submit" value="Cadastrar">

    </form>

<%
        String nome = request.getParameter("nome");
        String categoria = request.getParameter("categoria");
        String precoVenda = request.getParameter("preco_venda");
        String precoCusto = request.getParameter("preco_custo");
        String unidade = request.getParameter("unidade_medida");

        if (nome != null) {

            Produtos p = new Produtos();
            p.setNome(nome);
            p.setCategoria(categoria);
            p.setPreco_venda(Double.parseDouble(precoVenda));
            p.setPreco_custo(Double.parseDouble(precoCusto));
            p.setUnidade_medida(unidade);

            ProdutosDAO dao = new ProdutosDAO();

            if (dao.inserir(p)) {
                out.print("<p style='color:green'>Produto cadastrado com sucesso!</p>");
            } else {
                out.print("<p style='color:red'>Erro ao cadastrar produto.</p>");
            }
        }
    %>

    <br><br>
    <a href="produtoListar.jsp">Listar Produtos</a>

</body>
</html>
