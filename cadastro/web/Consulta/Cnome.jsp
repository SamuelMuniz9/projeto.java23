<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Consulta por Nome</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="" />
        
        
        <!<!-- Link para funcionamento do frontend -->

        <link rel="stylesheet" href="../resources/styles.css">
        <link rel="stylesheet" href="../resources/reset.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link
          rel="canonical"
          href="https://getbootstrap.com/docs/5.3/examples/sidebars/"
        />
        <script src="../JS/color-modes.js"></script>
        <link href="../resources/bootstrap.min.css" rel="stylesheet" /> 
        <meta name="theme-color" content="#712cf9" />
        <link href="../resources/reset.css" rel="stylesheet" />
        <link href="../resources/estoque.css" rel="stylesheet" />
        
        
                <!<!-- sidebar -->
        <link rel="stylesheet" href="../resources/sidebars.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
          rel="stylesheet"
        />
        <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,0"
        />
        <link
          href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
          rel="stylesheet"
        />
        <script src="https://unpkg.com/akar-icons-fonts"></script>
        
        
        
    </head>
    <body>
        <!--sidebar-->
    
        <aside class="sidebar">
          <div class="left">
           <br>
            <button>
              <i class=" ai-home-alt1"></i>
            </button>


            <button>
              <a href="../"><i class="ai-link-out"></i></a>
            </button>

          </div>
          <div class="right">
            <h1>📋 Consulta</h1>
            <nav class="buttons">
              <button>
                 <a href="ConsultaGeral.jsp" class="fs-2 btn card-title"><i class="ai-dashboard"></i></a>
                <span>Geral</span>
              </button>

            </nav>
            <h2>🔎 Consulta Por: </h2>
            <nav class="buttons">
              <button>
                <a href="Cnome.jsp" class=" fs-2 btn card-title"><i class="ai-people-multiple"></i></a>
                <span>Nome</span>
              </button>
              <button>
                <a href="Cid.jsp" class="fs-2 btn card-title"><i class="ai-statistic-up"></i></a>
                <span>Id</span>
              </button>
            </nav>
          </div>
        </aside>
        <div style="margin-left:150px">
        <h2>Consulta de Cliente por Nome</h2>

        <form method="post">
            <label class="fs-2 card-title">Nome do Cliente:</label>
            <input type="text" name="nome" required>
            <br>
            <button type="submit" class="btn btn-primary">Consultar</button>
            <a href="ConsultaGeral.jsp" class="card-title btn btn-light">Retornar</a
        </form>

        <%
          String paramNome = request.getParameter("nome");

if (paramNome != null && paramNome.trim().length() > 0) {

    ClienteDAO dao = new ClienteDAO();
    List<Cliente> lista = dao.consultaPorNome(paramNome);

    if (!lista.isEmpty()) {
        out.println("<br><b>Clientes encontrados:</b><br>");

        for (Cliente cli : lista) {
            out.println("<hr>");
            out.println("ID: " + cli.getId() + "<br>");
            out.println("Nome: " + cli.getNome() + " " + cli.getSobrenome() + "<br>");
            out.println("Email: " + cli.getEmailComercial() + "<br>");
            out.println("Telefone: " + cli.getTelefoneComercial() + "<br>");
            out.println("Função/Cargo: " + cli.getFuncaoCargo() + "<br>");
            out.println("Departamento: " + cli.getAreaFuncionalDepartamento() + "<br>");
            out.println("Organização: " + cli.getNomeDeSuaOrganizacao() + "<br>");
            out.println("País: " + cli.getPaisRegiao() + "<br>");
            out.println("CEP: " + cli.getCepCodigoPostal() + "<br>");
            out.println("Interesse: " + cli.getInteressePrincipalProduto() + "<br>");
            
            
        }

    } else {
        out.println("<br>Nenhum cliente encontrado com esse nome.");
    }
}

        %>
        
        </div>

    </body>
</html>