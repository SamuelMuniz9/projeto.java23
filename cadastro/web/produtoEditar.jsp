<%-- 
    Document   : produtoEditar
    Created on : 23 de nov. de 2025, 12:55:43
    Author     : gta98
--%>

<%@page import="model.DAO.ProdutosDAO"%>
<%@page import="model.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Produto</title>
    <meta charset="UTF-8">
</head>

<body>

<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);


    ProdutosDAO dao = new ProdutosDAO();
    Produtos p = dao.buscarPorId(id);
%>

<h1>Editar Produto</h1>

<form action="produtoEditar.jsp?id=<%= id %>" method="post">

    Nome:<br>
    <input type="text" name="nome" value="<%= p.getNome() %>" required><br><br>

    Categoria:<br>
    <input type="text" name="categoria" value="<%= p.getCategoria() %>"><br><br>

    Preço de Venda:<br>
    <input type="number" step="0.01" name="preco_venda" value="<%= p.getPreco_venda() %>" required><br><br>

    Preço de Custo:<br>
    <input type="number" step="0.01" name="preco_custo" value="<%= p.getPreco_custo() %>"><br><br>

    Unidade de Medida:<br>
    <input type="text" name="unidade_medida" value="<%= p.getUnidade_medida() %>"><br><br>

    <input type="submit" value="Salvar Alterações">

</form>

<%

    String nome = request.getParameter("nome");

    if (nome != null) {

        p.setNome(request.getParameter("nome"));
        p.setCategoria(request.getParameter("categoria"));
        p.setPreco_venda(Double.parseDouble(request.getParameter("preco_venda")));
        p.setPreco_custo(Double.parseDouble(request.getParameter("preco_custo")));
        p.setUnidade_medida(request.getParameter("unidade_medida"));

        if (dao.atualizar(p)) {
            out.print("<p style='color:green'>Produto atualizado com sucesso!</p>");
        } else {
            out.print("<p style='color:red'>Erro ao atualizar produto.</p>");
        }
    }
%>

<br>
<a href="produtoListar.jsp">Voltar</a>

</body>
</html>
