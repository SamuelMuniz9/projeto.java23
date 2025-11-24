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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    
    
      <!<!-- Link para funcionamento do frontend -->
    
    <link rel="stylesheet" href="resources/styles.css">
    <link rel="stylesheet" href="resources/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link
      rel="canonical"
      href="https://getbootstrap.com/docs/5.3/examples/sidebars/"
    />
    <script src="JS/color-modes.js"></script>
    <link href="resources/bootstrap.min.css" rel="stylesheet" /> <!<!-- nao linkado -->
    <meta name="theme-color" content="#712cf9" />
    <link href="resources/reset.css" rel="stylesheet" />
    <link href="resources/estoque.css" rel="stylesheet" />
    
    
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