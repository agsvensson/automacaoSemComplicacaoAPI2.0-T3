## Curso Automação API


![Project Status Badge](https://img.shields.io/badge/Status%20do%20projeto-Concluído-green)

### Projeto realizado no curso "Automação Sem Complicação API 2.0" da [Chronos Academy](https://chronosacademy.com.br/).

#### Tecnologias utilizadas:
- Java
- JUnit
- Maven
- Rest Assured
- Design Pattern Page Object
- Escrita de cenários padrão BDD com Cucumber/Gherkin


#### Para clonar o projeto no Git:
```
git clone https://github.com/agsvensson/automacaoSemComplicacaoAPI2.0-T3.git
```

#### Para executar os testes é necessário baixar e inicializar a api Plataforma Filmes:
```
git clone https://github.com/adamvinicius/PlataformaFilmes.git
```

#### Após inicializar a api, para executar os testes, incluir tag no arquivo RunnerTest:
- @login para executar feature de Login;
- @categoria para executar feature de Categoria;
- @crud para executar o CRUD da feature de filmes;
- deixar sem tag para rodar todos.