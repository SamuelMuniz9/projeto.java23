<%-- 
    Document   : produtoExcluir
    Created on : 23 de nov. de 2025, 13:03:40
    Author     : gta98
--%>

<%@ page import="model.DAO.ProdutosDAO" %>
<%@ page import="model.Produtos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Excluir Produto</title>
    <meta charset="UTF-8">
</head>
<body>
<%
    String idParam = request.getParameter("id");
    String mensagem = "";

    if (idParam != null) {
        try {
            int id = Integer.parseInt(idParam);
            ProdutosDAO dao = new ProdutosDAO();
            boolean sucesso = dao.excluir(id);

            if (sucesso) {
                mensagem = "Produto excluído com sucesso!";
            } else {
                mensagem = "Falha ao excluir o produto.";
            }
        } catch (Exception e) {
            mensagem = "Erro: " + e.getMessage();
        }
    } else {
        mensagem = "ID do produto não fornecido.";
    }
%>

<h2><%= mensagem %></h2>

<a href="produtoListar.jsp">Voltar para lista de produtos</a>

</body>
</html>