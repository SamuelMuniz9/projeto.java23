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
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);


    ProdutosDAO dao = new ProdutosDAO();
    Produtos p = dao.buscarPorId(id);
%>

<h1>Editar Produto</h1>

<form class="row g-3 "action="produtoEditar.jsp?id=<%= id %>" method="post">
                                  <div class="col-md-6">
                                    <label  class="form-label">Nome</label>
                                    <input type="text" class="form-control" name="nome" value="<%= p.getNome() %>" required>
                                  </div>

                                  <div class="col-md-6">
                                    <label  class="form-label">Categoria</label>
                                    <input type="text" class="form-control" name="categoria"  value="<%= p.getCategoria() %>"required>
                                  </div>


                                  <div class="col-12">
                                    <label class="form-label">Preço de venda</label>
                                    <input type="number" step="0.01" name="preco_venda" class="form-control" placeholder="R$" value="<%= p.getPreco_venda() %>" required>
                                  </div>

                                  <div class="col-12">
                                    <label  class="form-label">Preço de Custo</label>
                                    <input type="number" class="form-control" placeholder="R$" name="preco_custo" value="<%= p.getPreco_custo() %>" required>
                                  </div>

                                  <div class="col-md-6">
                                    <label class="form-label">Unidade de Medida</label>
                                    <input type="text" class="form-control" name="unidade_medida" value="<%= p.getUnidade_medida() %>" required>
                                  </div>

                              
                                  <div class="col-12">
                                    <input type="submit" class="btn btn-primary"  value="Salvar Alterações">
                                    <a class="btn btn-primary" href="produtoListar.jsp">Voltar</a>
                                  </div>
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




</body>
</html>
