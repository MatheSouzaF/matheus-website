# Engie Website 2023 Development

![](wp-content/themes/lohn-2023/screenshot.png)

## Under the hood

- [ES6](https://github.com/lukehoban/es6features#readme) for JavaScript (transpiling with [Babel](https://babeljs.io/) and linting with [ESLint](https://eslint.org/))
- [SASS](http://sass-lang.com/) preprocessor for CSS following [SASS Guidelines](https://sass-guidelin.es/#the-7-1-pattern)
- [Bootstrap 5](https://getbootstrap.com/docs/5.2/getting-started/introduction/) as CSS framework ([customizable with SASS](https://getbootstrap.com/docs/5.2/customize/sass/))
- [Gulp 4](https://gulpjs.com/) & [Webpack 5](https://webpack.js.org/) to manage, compile and optimize theme assets
- SVG Sprite : create a folder containing all your SVGs like `assets/src/svg/sprite` and run your watch or build

## Requirements

- Versão do node: >=16.0.0
- Versão npm: >=8.0.0
- [Gulp](https://gulpjs.com/docs/en/getting-started/quick-start)

## Usage

Primeiro, clone este repositório no diretório de temas do WordPress.

Em seguida, execute os seguintes comandos no diretório do tema para instalar as dependencias :

    npm install

Launch your watch for assets with :

    npm run start

For production sites, create your build with :

    npm run build

Para compilar e minificar JS:

npm run build-compiled

## Descrição

- Para criar uma nova pagina php crie direto no root do tema.

- Para arquivos JS use o caminho 'assets/src/js';
  -E para injetar o JS na sua página PHP use a seguinte função "wp_enqueue_script()" que recebe 5 argumentos:

  1. A classe da sua página encontrada no body gerado pela função "body_class()" presente no header.php;
  2. O caminho do arquivo JS;
  3. um array de dependencias para aquele script ex: array('jquery');
  4. a versão fará o controle de cache no navegador;
  5. um booleano para inserir o script no footer ou no header;

- Para criar arquivos SCSS use o caminho 'assets/src/scss'; e com base na finalidade do seu arquivo ultilize um dos diretórios existentes e depois import o novo arquivo no main.scss. Após criar o arquivo use o seguinte seletor "body.(classe-da-pagina)" que é gerado pela função "body_class()" presente no header.php.

- Para adicionar imagens ao projeto use o caminho 'assets/src/img'.

- Para adicionar svg ao projeto use o caminho 'assets/src/svg'.

## Utilizar WPCLI no Docker:

Execute o comando:

docker exec <id-do-container-wp-cli> wp core version

E o script wpcli estará disponível, de fora do docker.
