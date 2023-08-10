
User.create(name: "joaocarlos", email: "joao@gmail.com", password: "12345678", is_admin: true, bio: "Sou o João Carlos, sou jornalista esportivo. Escrevo matérias para ESPN sobre futebol internacional e o mundo da bola.")
User.create(name: "mariaclara", email: "maria@gmail.com", password: "12345678", is_admin: true, bio: "Sou a Maria Clara e adoro futebol. Sempre assisti jogos do Vasco com meu pai e vou em todos jogos que posso.")
User.create(name: "pedropaulo", email: "pedro@gmail.com", password: "12345678", is_admin: false, bio: "Sou o Pedro Paulo e sou fanático pelo Gama FC. Fui representar o maior do DF na torcida pelo Brasil na Copa do Mundo da Russia.")
User.create(name: "leopcortes", email: "leo@gmail.com", password:"12345678", is_admin: true, bio: "Sou o Leonardo Côrtes e acho que o Flamengo vai ganhar a libertadores.")
User.create(name: "gabrielmarques", email: "marques@gmail.com", password:"12345678", is_admin: true, bio: "Sou o Gabriel Marques e jogo bola desde pequeno.")

User.find_by(name:"joaocarlos").profile_picture.attach(io: File.open('./public/joao.png'), filename:('joao.png'))
User.find_by(name:"mariaclara").profile_picture.attach(io: File.open('./public/maria.png'), filename:('maria.png'))
User.find_by(name:"pedropaulo").profile_picture.attach(io: File.open('./public/pedro.png'), filename:('pedro.png'))

Post.create(title: "Inter avança, com justiça, e mostra que fora de casa River não é tudo isso", content: "O Inter soube explorar isso e já deveria ter avançado sem disputa de penais, inclusive teve um pênalti não assinalado. E que diferença da equipe de Eduardo Coudet para o que Mano Menezes escalava!", user_id: 1)
Post.create(title: "Pênalti da Inglaterra atingiu 111km/h e superou marca da Premier League", content: "A atacante Chloe Kelly colocou a Inglaterra nas quartas de final da Copa do Mundo feminina e impressionou com a velocidade da cobrança do pênalti. O chute da jogadora do Manchester City atingiu impressionantes 111km/h. Ela conveteu a última penalidade classificando a atual campeã europeia para as quartas do Mundial feminino.", user_id: 1)
Post.create(title: "Falta de critério da arbitragem faz o Santos ser derrotado pelo São Paulo", content: "Mais uma vez (e são muitas) a arbitragem tornou-se o tema central depois de uma partida de futebol aqui no Brasil. Nossa arbitragem é fraca, infelizmente. Árbitros mal preparados, sem personalidade, suscetíveis a todo o tipo de pressão porque têm receio de tudo e de todos. E o resultado é tudo o que vemos depois que a maioria das partidas terminam: pouco se fala do jogo; muito se reclama da precariedade da nossa arbitragem.", user_id: 2)
Post.create(title: "Lukaku nem chegou e torcida da Juventus já faz protestos contra ele", content: "A possível transferência de Romelu Lukaku para a Juventus ainda não aconteceu, mas os torcedores já fizeram questão de mostrar que não estão muito felizes com a sua chegada. O jogador, muito vinculado à Inter de Milão, tem sido chamado de traidor pelos torcedores do clube nerazzurro e ainda está longe de conquistar a torcida dos bianconeri.", user_id: 2)
Post.create(title: "Violência no futebol cresce e nossa incapacidade de lidar com isso é cada vez mais nítida", content: "O futebol tem tido semanas muito tristes recentemente. Uma escalada de violência vem crescendo e as coisas parecem cada vez mais fora do controle. Pedradas em ônibus em Salvador e Porto Alegre, briga entre corintianos e são-paulinos no metrô e, principalmente, a batalha campal no México que chocou o mundo inteiro com suas imagens.", user_id: 4)
Post.create(title: "BVB planeja teste secreto antes do início da Bundesliga", content: "O Borussia de Dortmund recentemente venceu por 3-1 contra o Ajax. A nova contratação Felix Nmecha fez o BVB comemorar. O jogo havia sido anunciado pelo clube como o último ensaio antes do início da temporada, mas o BVB planeja um teste secreto antes do início da Bundesliga, conforme noticiou o Ruhr Nachrichten. De acordo com a fonte, o BVB enfrentará o Preußen Münster, da terceira divisão, um dia após o jogo pela Copa DFB no dia 12 de agosto. O jogo deve decorrer à porta fechada.", user_id: 5)
Post.create(title: "Atlético Madrid inscreve João Félix na La Liga: Barcelona tem apenas 12 jogadores", content: "Na página oficial da La Liga é possível ver os plantéis regularizados dos 20 clubes que vão disputar o campeonato espanhol. João Félix figura entre os inscritos pelo Atlético Madrid, tendo ficado com a camisola 18.", user_id: 4)
Post.create(title: "LA LIGA irá 'misturar real e virtual' com câmeras de EA Sports FC 24", content: "A LA LIGA terá câmeras que simulam ângulos de video game na temporada 2023/2024, parecido com o gameplay de EA Sports FC 24 (antigo FIFA). A tecnologia é uma parceria da entidade com a EA Sports, principal patrocinadora do campeonato espanhol de futebol. Em evento realizado ontem (08), em São Paulo (SP), Daniel Alonso, representante de LA LIGA no Brasil, explicou que as partidas terão imagens especiais em momentos como bolas paradas.", user_id: 4)
Post.create(title: "Neymar e Verratti estão fora dos planos do PSG, diz emissora RMCSport", content: "De acordo com o jornal L'Equipe Neymar comunicou que deseja deixar o clube. E um retorno ao Barcelona seria seu principal desejo, mas é improvável devido a situação financeira do clube espanhol. O Chelsea manifestou interesse em fevereiro e é uma alternativa, mas também corre por fora. Segundo o L'Equipe, o Al-Hilal fez uma proposta ao brasileiro esta semana. A MLS, nos Estados Unidos, é outro caminho.", user_id: 5)
Post.create(title: "Mbappé está fora de estreia do PSG na Ligue 1 e pode desfalcar equipe por longo período como punição", content: "Kylian Mbappé não estará em campo na estreia do PSG na Ligue 1, contra o Lorient, no Parque dos Príncipes, no sábado (12), disseram fontes à ESPN. Ainda de acordo com a reportagem, Mbappé pode perder todos os jogos do PSG em agosto como punição. O craque não treinou com o time principal sob o comando do novo técnico Luis Enrique em meio a uma disputa contratual existente com o clube.", user_id: 5)
Post.create(title: "Kane no Bayern: Tottenham aceita proposta de mais de R$ 530 milhões, diz jornal", content: "Uma das principais novelas da janela de transferências do verão europeu está perto de terminar. De acordo com o jornal 'The Athletic', o Tottenham aceitou uma proposta do Bayern de Munique pelo atacante Harry Kane. O valor da oferta superaria os 100 milhões de euros (R$ 530 milhões, além de bônus. Aos 30 anos, Harry Kane já teria tudo acertado de sua parte com o Bayern de Munique, com vencimentos de 29 milhões de euros por temporada, segundo diversos veículos. Porém, agora, teria ficado empolgado com o início do trabalho do técnico Ange Postecoglou, e, assim, também 'estaria inclinado a ficar' no clube, de acordo com o jornal.", user_id: 1)
Post.create(title: "A declaração sincera de Guardiola sobre Manchester City antes de estreia na Premier League", content: "O técnico Pep Guardiola, do Manchester City, disse em coletiva de imprensa nesta quinta-feira (10) que será “impossível” para que a equipe conquiste novamente a 'Tríplice Coroa' na atual temporada. O pontapé inicial do multicampeão na Inglaterra será nesta sexta-feira (11), às 16h, diante do Burnley, fora de casa, pela primeira rodada da Premier League 2023/24. O confronto terá transmissão ao vivo pela ESPN no Star+. 'Acho que será impossível fazer o que fizemos na temporada passada. É uma vez na vida. Eu disse aos jogadores: 'Esqueçam isso, escalamos a montanha mais alta na última temporada com o que fizemos''.", user_id: 2)
Post.create(title: "Bem-vindo à Itália, o titular do Grêmio que agora vai jogar na Serie A Tim", content: "O Grêmio enfrentou a possibilidade iminente de perder seu talentoso goleiro, Brenno, para o cenário europeu nas próximas semanas. Com apenas 24 anos, o arqueiro despertou o interesse de diversos clubes do continente, incluindo o Bari, equipe da Série B da Itália. Ainda que não tenha recebido uma proposta oficial, as sondagens indicam que Brenno está na mira de times estrangeiros. O jogador começou a temporada como titular do Tricolor de Porto Alegre, mas perdeu vaga ao longo do Campeonato Gaúcho.", user_id: 2)
Post.create(title: "Cássio discute aspirações do Corinthians no Brasileirão e destaca evolução da equipe com Luxemburgo", content: "'Acho que, como o Brasileirão e os outros campeonatos, temos que dar a devida importância. A gente vem crescendo e tendo resultado, conseguindo fazer coisas boas dentro e fora de campo, ganhando em casa e sendo mais consistente. Fora que era uma questão que não vínhamos pontuando. Lógico que a gente começou mal, mas é importante salientar o que a gente almejava. Por mais que no começo os resultados não foram o que a gente esperava, trabalhamos muito e nos dedicamos', disse o camisa 12 durante a coletiva na Argentina.", user_id: 4)
Post.create(title: "La Liga muda identidade visual e anuncia medidas de combate após casos de racismo", content: "La Liga muda identidade visual e anuncia medidas de combate após casos de racismo. Pensando em uma forma de combate mais afirmativa e ultrapassando a barreira de mensagens de efeito, a organização do Campeonato Espanhol anunciou, nesta terça-feira (8), a criação de uma plataforma multifuncional e voltada a conscientização e combate desta prática criminosa que leva o nome de 'LALIGA VS RACISM'.", user_id: 5)

Category.create(name: "La Liga")
Category.create(name: "Bundesliga")
Category.create(name: "Brasileirão")
Category.create(name: "Premier League")
Category.create(name: "Ligue 1")
Category.create(name: "Serie A")

PostCategory.create(post_id: 1, category_id: 3)
PostCategory.create(post_id: 2, category_id: 4)
PostCategory.create(post_id: 3, category_id: 3)
PostCategory.create(post_id: 4, category_id: 6)
PostCategory.create(post_id: 5, category_id: 3)
PostCategory.create(post_id: 6, category_id: 2)
PostCategory.create(post_id: 7, category_id: 1)
PostCategory.create(post_id: 8, category_id: 1)
PostCategory.create(post_id: 9, category_id: 5)
PostCategory.create(post_id: 10,category_id: 5)
PostCategory.create(post_id: 11,category_id: 2)
PostCategory.create(post_id: 12,category_id: 3)
PostCategory.create(post_id: 13,category_id: 6)
PostCategory.create(post_id: 14,category_id: 3)
PostCategory.create(post_id: 15,category_id: 1)

Upvote.create(status: true, post_id: 1, user_id: 2)
Upvote.create(status: true, post_id: 1, user_id: 3)
Upvote.create(status: true, post_id: 2, user_id: 1)
Upvote.create(status: true, post_id: 2, user_id: 3)
Upvote.create(status: true, post_id: 3, user_id: 1)
Upvote.create(status: true, post_id: 3, user_id: 4)
Upvote.create(status: true, post_id: 4, user_id: 5)
Upvote.create(status: true, post_id: 4, user_id: 3)
Upvote.create(status: true, post_id: 5, user_id: 3)
Upvote.create(status: true, post_id: 5, user_id: 1)
Upvote.create(status: true, post_id: 6, user_id: 5)
Upvote.create(status: true, post_id: 6, user_id: 4)
Upvote.create(status: true, post_id: 7, user_id: 1)
Upvote.create(status: true, post_id: 7, user_id: 4)
Upvote.create(status: true, post_id: 8, user_id: 1)
Upvote.create(status: true, post_id: 8, user_id: 5)
Upvote.create(status: true, post_id: 9, user_id: 2)
Upvote.create(status: true, post_id: 9, user_id: 3)
Upvote.create(status: true, post_id: 10,user_id: 1)
Upvote.create(status: true, post_id: 10,user_id: 2)
Upvote.create(status: true, post_id: 2, user_id: 4)
Upvote.create(status: true, post_id: 4, user_id: 5)
Upvote.create(status: true, post_id: 6, user_id: 3)
Upvote.create(status: true, post_id: 8, user_id: 5)
Upvote.create(status: true, post_id: 11,user_id: 2)
Upvote.create(status: true, post_id: 12,user_id: 1)
Upvote.create(status: true, post_id: 13,user_id: 5)
Upvote.create(status: true, post_id: 14,user_id: 2)
Upvote.create(status: true, post_id: 15,user_id: 3)

Comment.create(content: "Emoção até o último segundo.", post_id: 1, user_id: 5)
Comment.create(content: "Rochet salvou o dia.", post_id: 1, user_id: 4)
Comment.create(content: "Uau, impressionante.", post_id: 2, user_id: 3)
Comment.create(content: "Essa Copa feminana está incrível.", post_id: 2, user_id: 1)
Comment.create(content: "Até quando?!", post_id: 3, user_id: 4)
Comment.create(content: "Isso é um absurdo.", post_id: 3, user_id: 2)
Comment.create(content: "Se eu fosse torcedora da Juventus também estaria furiosa.", post_id: 4, user_id: 2)
Comment.create(content: "Achei uma ótima contratação.", post_id: 4, user_id: 5)
Comment.create(content: "Isso tem que acabar!", post_id: 5, user_id: 3)
Comment.create(content: "Muito triste, precisamos fazer algo para mudar.", post_id: 5, user_id: 2)
Comment.create(content: "Esse ano já é do Borussia.", post_id: 6, user_id: 2)
Comment.create(content: "A muralha amarela vai ficar triste vendo o Bayern ganhar tudo.", post_id: 6, user_id: 3)
Comment.create(content: "So ó Neymar pra salvar esse Barça.", post_id: 7, user_id: 4)
Comment.create(content: "João Felix tem muito potencial.", post_id: 7, user_id: 5)
Comment.create(content: "A tecnologia é incrível.", post_id: 8, user_id: 4)
Comment.create(content: "Isso vai aumentar muito a imersão do torcedor.", post_id: 8, user_id: 2)
Comment.create(content: "PSG é uma bagunça.", post_id: 9, user_id: 1)
Comment.create(content: "Todo esse dinheiro gasto pra não ganhar quase nada.", post_id: 9, user_id: 3)
Comment.create(content: "Como que recusa 1.6 bilhão de reais.", post_id: 10,user_id: 4)
Comment.create(content: "Mbappe fez certo, não vale a pena gastar seu auge na Arábia.", post_id: 10,user_id: 1)
Comment.create(content: "Vamos ver se ele ganha algo agora.", post_id: 11, user_id: 2)
Comment.create(content: "Concordo, muito difícil mesmo.", post_id: 12, user_id: 3)
Comment.create(content: "Bom jogador.", post_id: 13, user_id: 4)
Comment.create(content: "Tá na hora de aposentar.", post_id: 14, user_id: 5)
Comment.create(content: "Acho que não vai dar em nada, precisa ser feito algo mais drástico.", post_id: 15, user_id: 1)
