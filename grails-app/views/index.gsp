<!doctype html>
<html>
<head>
    <title>Registro de Cliente</title>
</head>
<body>
    <form action="${createLink(controller: 'index', action: 'processForm')}" method="POST">
        <h3>Informação</h3>
        <label><input type="text" name="name" placeholder="Nome"></label><br>
        <label><input type="text" name="cpf" id="cpf" placeholder="CPF" maxlength="15" autocomplete="off"></label><br>
        <label><input type="text" name="cellphone" id="cellphone" placeholder="Telefone" maxlength="15" autocomplete="off"></label><br>
        <h3>Endereço</h3>
        <label><input type="text" name="cep" id="cep" placeholder="CEP" maxlength="10" autocomplete="off"></label><br>
        <label><input type="text" name="state" placeholder="Estado"></label><br>
        <label><input type="text" name="city" placeholder="Cidade"></label><br>
        <label><input type="text" name="district" placeholder="Bairro"></label><br>
        <label><input type="text" name="street" placeholder="Rua"></label><br>
        <label><input type="text" name="number" placeholder="Número"></label><br>
        <label><input type="text" name="complement" placeholder="Complemento"></label><br>
        <label><input type="submit" value="Enviar"></label>
    </form>

    <g:if test="${params.message}">
        <h2>${params.message}</h2>
    </g:if>

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
