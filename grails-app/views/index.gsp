<!doctype html>
<html>
<head>
    <title>Registro de Cliente</title>
</head>
<body>
    <form action="${createLink(controller: 'index', action: 'processForm')}" method="POST">
        <h3>Informação</h3>
        <label><input type="text" name="name" placeholder="Nome"></label><br>
        <label><input type="text" name="cpf" placeholder="CPF"></label><br>
        <label><input type="text" name="cellphone" placeholder="Telefone"></label><br>
        <h3>Endereço</h3>
        <label><input type="text" name="cep" placeholder="CEP"></label><br>
        <label><input type="text" name="state" placeholder="Estado"></label><br>
        <label><input type="text" name="city" placeholder="Cidade"></label><br>
        <label><input type="text" name="district" placeholder="Bairro"></label><br>
        <label><input type="text" name="street" placeholder="Rua"></label><br>
        <label><input type="text" name="number" placeholder="Número"></label><br>
        <label><input type="text" name="complement" placeholder="Complemento"></label><br>
        <label><input type="submit" value="Enviar"></label>
    </form>
</body>
</html>
