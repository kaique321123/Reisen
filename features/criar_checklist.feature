# language: pt
# encoding: utf-8

Funcionalidade: Criar checklist
    Para poder me organizar com listas customizáveis

    # Cenário: (Feliz ou triste) Indica o comportamento esperado da funcionalidade
    # Dado: Estado atual do programa
    # E: Extensão de comandos
    # Quando: Ação que o usuário irá fazer
    # Então: Resultado esperado da ação

    # Qual o nível de customização? Apenas criar itens? Operação "CRUD" completa?
    # Todos podem ver a minha lista ou deve ser algo apenas para mim?

    # usuário != participante ?
    Cenário: Conseguir criar checklist
        Dado que sou um usuário
        E que estou na página de perfil
        Quando eu clico no botão "Criar checklist"
        Então deve ser criada uma nova checklist
        E eu devo ser redirecionado para ela