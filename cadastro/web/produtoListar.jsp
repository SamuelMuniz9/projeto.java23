<%-- 
    Document   : produtoListar
    Created on : 23 de nov. de 2025, 12:37:23
    Author     : gta98
--%>

<%@page import="java.util.List"%>
<%@page import="model.DAO.ProdutosDAO"%>
<%@page import="model.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Produtos</title>
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
    <link href="resources/bootstrap.min.css" rel="stylesheet" /> 
    <meta name="theme-color" content="#712cf9" />
    <link href="resources/reset.css" rel="stylesheet" />
    <link href="resources/estoque.css" rel="stylesheet" />
   


    
</head>

<body>

<!----->

        <!-- barra lateral, retirado--->

        <!--fora barra lateral--->

        <header>
               <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="header-text">
                <h1>Lista de Produtos</h1>
                <p>Controle sobre os Produtos</p>
            </div>
        </div>



        <!-- Tabs -->
        <div class="tabs">
            <div class="tab-list">
                <button class="tab-button active btn-glow">Movimentações</button>
                <a href="produtoCadastrar.jsp"><button class="tab-button btn-glow ">Cadastrar Novo Produto</button></a>
                <a href="index.html"><button class="tab-button btn-glow btn-secondary">Voltar</button></a>

     
            </div>

            <!-- Movements Tab -->
            <div id="movements-tab" class="tab-content active">
                <div class="card">
                    <div class="card-title">
                        <div>
                            <h2>Movimentações</h2>
                            <p class="stat-label">Registros de Cada Produto Inserido</p>
                        </div>
                    </div>


            

                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                      <th>ID</th>
                                      <th>Nome</th>
                                      <th>Categoria</th>
                                      <th>Preço Venda</th>
                                      <th>Preço Custo</th>
                                      <th>Unidade</th>
                                      <th>Ações</th>
                                </tr>

                                    <%
                                        ProdutosDAO dao = new ProdutosDAO();
                                        List<Produtos> lista = dao.listar();

                                        for (Produtos p : lista) {
                                    %>

                                <tr>
                                    <td class='stat-label'><%= p.getId_produto() %></td>
                                    <td class='stat-label'><%= p.getNome() %></td>
                                    <td class='stat-label'><%= p.getCategoria() %></td>
                                    <td class='stat-label'>R$ <%= p.getPreco_venda() %></td>
                                    <td class='stat-label'>R$ <%= p.getPreco_custo() %></td>
                                    <td class='stat-label'><%= p.getUnidade_medida() %></td>

                                <td>
                                    <div class="action-buttons" style="margin: 0; padding: 0;">
                                      
                                    <a href="produtoEditar.jsp?id=<%= p.getId_produto() %>">
                                    <button class="btn btn-primary">
                                        <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                                        </svg>
                                     Editar
                                    </button>
                                    </a> 
                                    <button class="btn btn-secondary">
                                    <a href="produtoExcluir.jsp?id=<%= p.getId_produto() %>" onclick="return confirm('Tem certeza que deseja excluir?')">
                                    <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                                         </svg> 
                                        
                                     Excluir
                                    </button>
                                    </a>
                                    </div>
                                    </td>
                                </tr>
                                
                             <% } %>
                            <tbody id="movementsTable">
                            </tbody>
                        </table>
                    </div>
                </div>
             </div>
                                    
                                    
      </div>
    </div>

       
      </header>
      </thead>
                                
    

</body>
</html>
