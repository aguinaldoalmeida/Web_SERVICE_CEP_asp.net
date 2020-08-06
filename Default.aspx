<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Busca de Cep:</title>
    
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
 
    
    <script>
    
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('rua').value=("");
            document.getElementById('bairro').value=("");
            document.getElementById('cidade').value=("");
            document.getElementById('uf').value=("");
            document.getElementById('ibge').value=("");
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('rua').value=(conteudo.logradouro);
            document.getElementById('bairro').value=(conteudo.bairro);
            document.getElementById('cidade').value=(conteudo.localidade);
            document.getElementById('uf').value=(conteudo.uf);
            document.getElementById('ibge').value=(conteudo.ibge);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
        }
    }
        
    function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('rua').value="...";
                document.getElementById('bairro').value="...";
                document.getElementById('cidade').value="...";
                document.getElementById('uf').value="...";
                document.getElementById('ibge').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    };

    </script>
   
</head>
<body>
    <form id="form1" runat="server" method="get" action="."  >
       





             <div class="jumbotron">
    <div class="input-group input-group-lg">
  <div class="input-group-prepend">

    <span class="input-group-text" id="inputGroup-sizing-lg">Digite o Cep:</span>
  </div>
  <input type="text" class="form-control" name="cep" id="cep" value=""  aria-describedby="inputGroup-sizing-lg" onblur="pesquisacep(this.value);"/>
</div>
                 <br />
                                
         
                 <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Rua</span>
  </div>
  <input type="text" name="rua" id="rua" class="form-control" aria-describedby="inputGroup-sizing-default"/>


 <div class="input-group-prepend">
    <span class="input-group-text" >Bairro</span>
  </div>
  <input type="text"name="bairro" id="bairro"  class="form-control" aria-describedby="inputGroup-sizing-default"/>

</div>
                 <br />

                 <div class="input-group mb-3">
                 <div class="input-group-prepend">
    <span class="input-group-text" >Cidade</span>
  </div>
  <input type="text" name="cidade" id="cidade"  class="form-control" aria-describedby="inputGroup-sizing-default"/>

 <div class="input-group-prepend">
    <span class="input-group-text" >Estado</span>
  </div>
  <input type="text" name="uf" id="uf"  class="form-control" aria-describedby="inputGroup-sizing-default"/>
                   

</div>

                 <br />

                 <div class="input-group input-group-sm mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-sm">IBGE</span>
  </div>
  <input type="text" class="form-control" name="ibge" id="ibge" aria-describedby="inputGroup-sizing-sm"/>
</div>

                 </div>

         <%--   EXEMPLO COMPLETO 
             <label>Cep:
        <input name="cep" type="text" id="cep" value="" size="10" maxlength="9"
               onblur="pesquisacep(this.value);" /></label><br />

        <label>Rua:
        <input name="rua" type="text" id="rua" size="60" /></label><br />
        
             
             <label>Bairro:
        <input name="bairro" type="text" id="bairro" size="40" /></label><br />


        <label>Cidade:
        <input name="cidade" type="text" id="cidade" size="40" /></label><br />


        <label>Estado:
        <input name="uf" type="text" id="uf" size="2" /></label><br />


        <label>IBGE:
        <input name="ibge" type="text" id="ibge" size="8" /></label><br />
        </div>--%>

    
            




    </form>
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 
</body>
</html>
