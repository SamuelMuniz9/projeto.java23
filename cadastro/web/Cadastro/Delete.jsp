<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Deletar Cliente</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
        
        
    <!<!-- Link para funcionamento do frontend-->
    
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
    
    
    
</head>
<body>
    <div class="container">
        <!-- Título -->
        <h2>Deletar Cliente</h2>

        <!-- Formulário -->
        <form method="post" class="form-atualizar">
            <div class="form-group">
                <label for="id">ID do Cliente a deletar:</label>
                <input type="number" id="id" name="id" placeholder="Digite o ID do cliente" required>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-danger">Deletar</button>
                <a href="../"><p class="btn btn-secondary" >Retornar</p></a>

            </div>
        </form>

        <!-- Mensagem de status -->
        <div class="status-message">
            <%
                String paramId = request.getParameter("id");
                if (paramId != null) {
                    try {
                        int id = Integer.parseInt(paramId);
                        ClienteDAO dao = new ClienteDAO();
                        if (dao.deletar(id)) {
                            out.println("<p class='fs-5 card-title text-uppercase'>✅ Cliente deletado com sucesso!</p>");
                        } else {
                            out.println("<p class='fs-5 card-title text-uppercase'>❌ Nenhum cliente encontrado com esse ID.</p>");
                        }
                    } catch (NumberFormatException e) {
                        out.println("<p class='error'>⚠️ ID inválido.</p>");
                    } catch (Exception e) {
                        out.println("<p class='error'>Erro: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
