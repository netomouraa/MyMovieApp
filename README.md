# MyMovieApp

## Descrição do Projeto

Este é um aplicativo simples de lista de filmes que utiliza a arquitetura MVVM em SwiftUI. Ele consome dados de um serviço da API de filmes para exibir informações sobre diferentes filmes.

## Arquitetura

O projeto segue a arquitetura MVVM (Model-View-ViewModel), onde:

MovieListView é a View principal.
MovieListViewModel é o ViewModel responsável pela lógica de apresentação.
MovieService é o serviço para interação com a API de filmes.

## Funcionalidades

- Exibição da lista de filmes populares
- Detalhes de cada filme, incluindo uma imagem, título e sinopse
- Pesquisa de filmes por nome

## Como Executar o Projeto

1. Clone o repositório.
2. Abra o projeto no Xcode.
3. Execute o aplicativo em um simulador ou dispositivo.

## Configuração

Certifique-se de instalar as dependências usando o CocoaPods antes de executar o aplicativo.

1. Abra um terminal e navegue até o diretório do projeto.

2. Execute o comando:

`pod install`

Certifique-se de que você possui o CocoaPods instalado em seu sistema. Se não tiver, você pode instalá-lo usando:

`sudo gem install cocoapods`

## Dependências

O projeto utiliza o framework MovieService para interagir com a API de filmes.

## Requisitos do Sistema
- iOS 14.0+
- Xcode 12.0+

## Autor

Neto Moura

## Licença

Este projeto está sob a licença de Neto Moura.

---
