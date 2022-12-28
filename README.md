<h2>Rodando o app</h2>

<p>Para rodar o app, vamos precisar de uma instância do banco de dados Postgresql rodando na máquina e o NodeJs instalado.</p>

<p>É importante, antes de subir a aplicação, criar e preencher os arquivos .env dentro da pasta dos serviços. Existem arquivos exemplos dentro dos diretórios (.env.example).</p>

<p>Para rodar o frontend, basta entrar no diretorio do frontend e executar o seguinte comando:</p>

    npm install

<p>esse vai instalar as dependências do projeto, e por fim o comando que irá subir o projeto:<p>

    npm run serve

<p>Para rodar o backend, basta entrar no diretorio backend e executar o primeiro comando que instala as dependências do projeto:</p>

    npm install

<p>Na sequência o comando que irá buildar a aplicação:</p>

    npm run build

<p>Antes de subir a api, vamos rodar dois comandos, o primeiro que irá rodar as migrations:</p>

    npm run db:migrate

<p>E o segundo que irá fazer o seed das tabelas:</p>

    npm run db:seed

<p>Por fim, o comando que vai subir a API:</p>

    npm start
  
<p>OU</p>

    npm start dev

<p>Com a aplicação rodando (frontend e backend), basta entrar no endereço <b>http://localhost:8080/</b> através do navegador.</p>
