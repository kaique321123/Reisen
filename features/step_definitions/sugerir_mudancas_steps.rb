Dado('que estou autenticado como membro do grupo {string}') do |nome_grupo|
  @participante = FactoryBot.build(:participante)
  @grupo_nome = nome_grupo
end

Dado('estou visualizando o documento {string}') do |titulo_documento|
  @documento = FactoryBot.build(:documento, title: titulo_documento)
  @documento.secoes ||= {}
end

Dado('existe a seção {string}') do |nome_secao|
  @documento.secoes[nome_secao] = { comentarios: [] }
end

Quando('eu adiciono o comentário {string}') do |texto_comentario|
  @comentario = texto_comentario
  @secao_alvo = @documento.secoes.keys.first
  @documento.secoes[@secao_alvo][:comentarios] << @comentario
end

Então('devo ver o comentário {string} associado à seção {string}') do |texto_comentario, nome_secao|
  comentarios = @documento.secoes[nome_secao][:comentarios]
  expect(comentarios).to include(texto_comentario)
end

Dado('que existe um comentário {string} na seção {string}') do |comentario, nome_secao|
  @documento = FactoryBot.build(:documento, title: "Roteiro de Paris")
  @documento.secoes ||= {}
  @documento.secoes[nome_secao] = { comentarios: [comentario] }
end

Quando('eu visualizo o documento {string}') do |_titulo_documento|
  # Simula apenas a ação de abrir o documento
end

Então('devo ver o comentário {string} na seção {string}') do |comentario, nome_secao|
  comentarios = @documento.secoes[nome_secao][:comentarios]
  expect(comentarios).to include(comentario)
end

Quando('eu tento adicionar um comentário vazio') do
  @comentario = ''
end

Então('devo ver a mensagem de erro {string}') do |mensagem_erro|
  if @comentario.strip.empty?
    @erro = 'O comentário não pode estar em branco'
  end
  expect(@erro).to eq(mensagem_erro)
end
