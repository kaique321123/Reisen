# language: pt
# encoding: utf-8

Funcionalidade: Comprar passagens
    Para facilitar a compra das passagens

    # Cenário: (Feliz ou triste) Indica o comportamento esperado da funcionalidade
    # Dado: Estado atual do programa
    # E: Extensão de comandos
    # Quando: Ação que o usuário irá fazer
    # Então: Resultado esperado da ação

    # nesse caso, deveria conter uma lista de companhias?
    # funcionalidade deve ser pensada em usuário logado ou deslogado?
    @javascript
    Cenário: Redirecionado com sucesso para o site da companhia
        Dado que sou um participante da viagem
        E o documento compartilhado existe
        E que estou na página do documento
        E existem companhias áreas com links de compra disponíveis
        Quando eu clico no link da companhia "Latam"
        Então a nova aba da companhia "Latam" deve ser aberta e ter o URL validado

    # por que daria erro?
    @javascript
    Cenário: Falha no redirecionamento para o site da companhia
        Dado que sou um participante da viagem
        E o documento compartilhado existe
        E que estou na página do documento
        E existem companhias áreas com links de compra disponíveis
        Quando eu clico no link de uma delas "fora do ar"
        Então eu devo ver uma mensagem de erro

    # Regra de negócio confusa (O que o usuário deve ver como conviddo?)
    @javascript
    Cenário: Tentativa de comprar passagens deslogado
        Dado que existe um documento compartilhado
        E que estou na página do documento
        E existem companhias áreas com links de compra disponíveis
        Quando eu clico no link de uma delas
        Então a nova aba da companhia deve ser aberta e ter o URL validado