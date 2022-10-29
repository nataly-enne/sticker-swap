# sticker_swap_client

> Aplicação do cliente do sistema StickerSwap


# Requisitos

1. flutter

# Configuração

1. Baixe as dependências do projeto:

```
flutter pub get
```

2. Adicione a sua plataforma:

```
flutter create --platforms=windows,macos,linux,android . 
```
> Edite o comando acima para selecionar apenas as plataformas que você utiliza.

2. Configure as váriaveis de ambiente, para isso crie um arquivo .env com:

```
API_URI="localhost:8081"
```

localhost:8081 é o endereço padrão de execução do sticker_swap_server

# Execução

Após configurar o client e inicializar a api, execute:

```
# flutter run -d <plataform>
flutter run -d linux
```




