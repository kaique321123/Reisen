 # language: pt
 # encoding: utf-8

 Funcionalidade: Edição colaborativa do documento de viagem
   Para que o planejamento seja colaborativo
   Como membro de um grupo de viagem
   Quero que o grupo todo consiga editar o documento

   #@smoke @integration
   #Cenário: Membro edita o documento com sucesso (fluxo feliz)
   #  Dado que sou membro do grupo "Viagem para Europa"
   #  E existe um documento de planejamento intitulado "Roteiro de Paris"
   #  Quando eu edito a seção "Dia 1 - Chegada" com o texto "Chegar e descansar"
   #  E eu salvo as alterações
   #  Então eu devo ver a mensagem "Documento salvo com sucesso"
   #  E a seção "Dia 1 - Chegada" deve conter "Chegar e descansar"

   #Cenário: Edição colaborativa - alteração visível a outros membros (multi-sessão)
   #  Dado que existe um grupo com dois membros: "kaique" e "amigo"
   #  E existe um documento "Roteiro de Paris" com a seção "Dia 2 - Passeios"
   #  Quando "kaique" abre o documento em uma sessão de navegador
   #  E "amigo" abre o mesmo documento em outra sessão de navegador
  #E "kaique" altera a seção "Dia 2 - Passeios" para "Visitar Louvre" e salva
  #Então "amigo" deve ver a atualização "Visitar Louvre" no documento após recarregar a página

   #Cenário: Validação - conteúdo vazio não pode ser salvo
   #  Dado que sou membro do grupo "Viagem para Europa"
   #  E existe um documento "Roteiro de Paris"
   #  Quando eu tento salvar a seção "Dia 3 - Retorno" com texto ""
   #  Então devo ver um erro "O conteúdo não pode ficar em branco"

   #Cenário: Permissão - usuário não membro não pode editar
   #  Dado que existe um usuário "externo" que não pertence ao grupo
   #  E existe um documento "Roteiro de Paris"
   #  Quando "externo" tenta editar a seção "Dia 1 - Chegada"
   #  Então deve receber um erro de autorização "Você não tem permissão para editar este documento"
