#language:pt
@categoria
Funcionalidade: Consulta Categoria

  Cenario: Realizar consulta categoria com sucesso
    Dado que tenha realizado o login com dados validos
    E que tenha um payload da API de Categoria
    Quando realizo uma requisicao do tipo GET de Categoria
    Entao valido que recebo status 200 no response
    E valido que no campo "tipo[2]" possui o valor "Terror"

  Cenario: Realizar consulta categoria sem token
    Quando realizo uma requisicao do tipo GET de Categoria
    Entao valido que recebo status 403 no response
    E valido que no campo "message" possui o valor "Access Denied"

  Cenario: Realizar consulta categoria com token invalido
    Dado que altero o campo "Authorization" para "invalido" do header de categoria
    Quando realizo uma requisicao do tipo GET de Categoria
    Entao valido que recebo status 403 no response
    E valido que no campo "message" possui o valor "Access Denied"