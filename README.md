# andreabreu76

## Rodar o projeto

```bash
cd <nome-projeto>
```

```bash
docker-compose up -d
```

Caso não tenha o docker-compose, veja como instalar clicando [aqui](https://docs.docker.com/compose/install/).

## Docker basics

Alguns comandos basicos de docker para melhor usufruir da conteinirização

1. Liste os conteiners que estão de pé

   ```bash
   docker ps
   ```

2. Acesse seu container

   ```bash
   docker exec -it <nomeDoContainer> /bin/bash
   ```

3. Assista a saída de STDOUT do seu conteiner

   ```bash
   docker logs --follow <idDoContainer>
   ```

4. Reinicie todos os conteiners de sua doca.

   ```bash
   docker-compose restart
   ```

5. Verifique o log de todos os containers de sua doca

   ```bash
   docker-composer logs
   ```

## A Fazer

- [ ] Instruir/Elucidar o uso do Xdebug no ambiente de desenvolvimento (VSCode, PhpStorm)
- [ ] Adicionar propriedades de enviroment
- [ ] Adicionar RabbitMQ Container
- [ ] Adicionar MySqlAdmin Container
- [ ] Adicionar NodeJS, Angular ou React Container (frontend)
- [ ] Adicionar Redis Container
- [ ] Detalhar arvore de arquivos e funções do projeto neste documento

### Dúvidas

Andre Abreu - [andre.abreu(at)gmail.com]

### Bases de conhecimento

<https://dev.to/thiagoluna/xdebug-3-no-phpstorm-com-php-7-4-55jm>
<https://vladiiancu.com/post/configure-xdebug-3-and-vscode-with-docker/>
<https://blog.levacic.net/2020/12/19/xdebug-3-docker-vs-code-setup-guide-on-ubuntu/>
