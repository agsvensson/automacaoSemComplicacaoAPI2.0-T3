# language: pt
@login
Funcionalidade: Testes da API de login

  @loginSucesso @regressivo
  Cenario: Realizar login com sucesso
    Dado que tenha um payload valido da api de login
    Quando envio uma requisicao do tipo POST de login
    Entao valido que recebo status 200 no response
    E armazeno o token que recebo do response de login

  @loginInvalido
  Esquema do Cenario: Realizar login com <cenario>
    Dado que tenha um payload valido da api de login com as seguintes informacoes
      | email | <email> |
      | senha | <senha> |
    Quando envio uma requisicao do tipo POST de login
    Entao valido que recebo status 400 no response

    @loginUsuarioInvalido @regressivo
    Exemplos:
      | cenario          | email              | senha    |
      | usuario invalido | invalido@email.com | 123456   |

    @loginSenhaInvalida
    Exemplos:
      | cenario          | email              | senha    |
      | senha invalida   | aluno@email.com    | invalido |
