#language:pt
@crud
Funcionalidade: CRUD Filme

  Contexto:
    Dado que tenha realizado o login com dados validos
    E que tenha um payload valido da API de Filme

  @cadastroFilme
  Cenario: Cadastro Filme
    Quando envio uma requisicao do tipo POST de Filme
    Entao valido que recebo status 201 no response
    E valido que no campo "categorias.tipo[1]" possui o valor "Comedia"
    E armazeno o id que recebo do response de Filme

  @consultaFilme
  Cenario: Consulta Filme
    Quando realizo uma requisicao do tipo GET de Filme atraves do nome
    Entao valido que recebo status 200 no response
    E valido que no campo "categorias[0].tipo[1]" possui o valor "Comedia"

  @alteracaoFilme
  Cenario: Alteração Filme
    E altero o indice 1 da lista de categorias do filme com os valores
      | tipo | Terror |
    Quando realizo uma requisicao do tipo PUT de Filme
    Entao valido que recebo status 200 no response
    E valido que no campo "categorias.tipo[1]" possui o valor "Terror"

  @consultaFilmeAposAlteracao
  Cenario: Consulta Filme após alteração
    Quando realizo uma requisicao do tipo GET de Filme atraves do nome
    Entao valido que recebo status 200 no response
    E valido que no campo "categorias[0].tipo[1]" possui o valor "Terror"

  @exclusaoFilme
  Cenario: Exclusão Filme
    Quando realizo uma requisicao do tipo DELETE de Filme
    Entao valido que recebo status 200 no response

  @consultaFilmeAposExclusao
  Cenario: Consulta Filme após exclusão
    Quando realizo uma requisicao do tipo GET de Filme atraves do nome
    Entao valido que recebo status 200 no response
    E valido que recebo uma lista vazia no response
