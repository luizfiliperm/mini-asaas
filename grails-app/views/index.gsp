<!doctype html>
<html>
<head>
    <title>Registro de Cliente</title>
    <style>
        #form{
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #b2c3f3;
            text-align: center;
            width: 90%;
        }

        input{
            margin: 5px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 95%;
        }

        input#button {
            background-color: #b4d88d;
            color: white;
            width: auto;
            border-radius: 5px;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        input#button:hover{
            background-color: #a3c77f;
        }

        @media only screen and (min-width: 650px) {
            #form {
                width: 70%;
            }

            input {
                width: 400px;
            }
        }
    </style>
</head>
<body>
    <div id="form">
        <h1>Registro de Cliente</h1>
        <form action="${createLink(controller: 'index', action: 'processForm')}" method="POST">
            <h2>Informações</h2>
            <label><input type="text" name="name" placeholder="Nome" autocomplete="off" required></label><br>
            <label><input type="text" name="cpf" id="cpf" placeholder="CPF" maxlength="14" autocomplete="off" required></label><br>
            <label><input type="text" name="cellphone" id="cellphone" placeholder="Telefone" maxlength="15" autocomplete="off" required></label><br>
            <h2>Endereço</h2>
            <label><input type="text" name="cep" id="cep" placeholder="CEP" maxlength="10" autocomplete="off" required></label><br>
            <label><input type="text" name="state" placeholder="Estado" autocomplete="off" required></label><br>
            <label><input type="text" name="city" placeholder="Cidade" autocomplete="off" required></label><br>
            <label><input type="text" name="district" placeholder="Bairro" autocomplete="off" required></label><br>
            <label><input type="text" name="street" placeholder="Rua" autocomplete="off" required></label><br>
            <label><input type="text" name="number" placeholder="Número" autocomplete="off" required></label><br>
            <label><input type="text" name="complement" placeholder="Complemento" autocomplete="off"></label><br>
            <label><input type="submit" id="button" value="Enviar"></label>
        </form>

        <g:if test="${params.message}">
            <h2>${params.message}</h2>
        </g:if>
    </div>
    <script>
        const cpfInput = document.getElementById('cpf')
        const cellphoneInput = document.getElementById('cellphone')
        const cepInput = document.getElementById('cep')

        cpfInput.addEventListener('keypress', () => {
            let inputLength = cpfInput.value.length

            if(inputLength === 3 || inputLength === 7) {
                cpfInput.value += '.'
            }

            if(inputLength === 11) {
                cpfInput.value += '-'
            }
        })

        cellphoneInput.addEventListener('keypress', () =>{
            let inputLength = cellphoneInput.value.length

            if(inputLength === 0) {
                cellphoneInput.value += '('
            }

            if(inputLength === 3) {
                cellphoneInput.value += ') '
            }

            if(inputLength === 9) {
                cellphoneInput.value += '-'
            }
        })

        cepInput.addEventListener('keypress', ()=>{
            let inputLength = cepInput.value.length

            if(inputLength === 2) {
                cepInput.value += '.'
            }

            if(inputLength === 6) {
                cepInput.value += '-'
            }

        })

        cepInput.addEventListener('blur', () => {
            let cep = cepInput.value.replace(/\D/g, '')

            if(cep.length !== 8){
                alert("CEP Inválido")
                return
            }

            fillCepInfo(cep)
        })

        function fillCepInfo(cep){
            const url = 'https://viacep.com.br/ws/' + cep + "/json/"

            fetch(url)
                .then(response =>{
                    return response.json()
                })
                .then(data => {
                    if(data.erro){
                        alert("CEP Inválido")
                        return
                    }
                    document.querySelector('input[name=state]').value = data.uf
                    document.querySelector('input[name=city]').value = data.localidade
                    document.querySelector('input[name=district]').value = data.bairro
                    document.querySelector('input[name=street]').value = data.logradouro
                })
        }
    </script>
</body>
</html>
