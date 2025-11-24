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
    <link href="resources/bootstrap.min.css" rel="stylesheet" /> <!<!-- nao linkado -->
    <meta name="theme-color" content="#712cf9" />
    <link href="resources/reset.css" rel="stylesheet" />
    <link href="resources/estoque.css" rel="stylesheet" />
   


    
</head>

<body>
<!-- BOTAO MODO DARK< LIGHT--->
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path
          d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"
        ></path>
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path
          d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"
        ></path>
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
          d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"
        ></path>
        <path
          d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"
        ></path>
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
          d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"
        ></path>
      </symbol>
    </svg>
    <div
      class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle"
    >
      <button
        class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
        id="bd-theme"
        type="button"
        aria-expanded="false"
        data-bs-toggle="dropdown"
        aria-label="Toggle theme (auto)"
      >
        <svg class="bi my-1 theme-icon-active" aria-hidden="true">
          <use href="#circle-half"></use>
        </svg>
        <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
      </button>
      <ul
        class="dropdown-menu dropdown-menu-end shadow"
        aria-labelledby="bd-theme-text"
      >
        <li>
          <button
            type="button"
            class="dropdown-item d-flex align-items-center"
            data-bs-theme-value="light"
            aria-pressed="false"
          >
            <svg class="bi me-2 opacity-50" aria-hidden="true">
              <use href="#sun-fill"></use>
            </svg>
            Light
            <svg class="bi ms-auto d-none" aria-hidden="true">
              <use href="#check2"></use>
            </svg>
          </button>
        </li>
        <li>
          <button
            type="button"
            class="dropdown-item d-flex align-items-center"
            data-bs-theme-value="dark"
            aria-pressed="false"
          >
            <svg class="bi me-2 opacity-50" aria-hidden="true">
              <use href="#moon-stars-fill"></use>
            </svg>
            Dark
            <svg class="bi ms-auto d-none" aria-hidden="true">
              <use href="#check2"></use>
            </svg>
          </button>
        </li>
        <li>
          <button
            type="button"
            class="dropdown-item d-flex align-items-center active"
            data-bs-theme-value="auto"
            aria-pressed="true"
          >
            <svg class="bi me-2 opacity-50" aria-hidden="true">
              <use href="#circle-half"></use>
            </svg>
            Auto
            <svg class="bi ms-auto d-none" aria-hidden="true">
              <use href="#check2"></use>
            </svg>
          </button>
        </li>
      </ul>
    </div>
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
                <a href="produtoCadastrar.jsp"><button class="tab-button btn-glow">Cadastrar Novo Produto</button></a>

     
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
                                
    
<!----->

    <script
        src="JS/bootstrap.bundle.min.js"
      class="astro-vvvwv3sm"
    ></script>
    <script src="/js/sidebar.js" class="astro-vvvwv3sm"></script>

</body>
</html>
