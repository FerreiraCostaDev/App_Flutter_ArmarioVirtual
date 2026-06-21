# Armário Virtual

App cliente de demonstração do projeto "Armário Virtual" desenvolvido em Flutter como parte do Projeto Integrador EQS.

## Descrição

Este repositório contém um aplicativo móvel Flutter que simula a experiência de um cliente em um armário virtual:
- Tela de splash de boas-vindas
- Menu principal com navegação por Drawer
- Login do cliente
- Experiência de look virtual
- Catálogo de produtos com filtros por categoria
- Carrinho de compras simples
- Histórico de looks salvos

O design do app utiliza uma paleta suave de cores e componentes de interface customizados para entregar uma aparência coesa.

## Tecnologias

- Flutter
- Dart
- Material Design 3

## Funcionalidades

- Splash screen com apresentação do projeto
- Menu principal com acesso rápido às telas do app
- Tela de login com validação básica de campos
- Tela de look virtual com fluxo de demonstração
- Catálogo de produtos com cards, filtro de categorias e adição rápida
- Carrinho de compras com resumo de pedido e manipulação de quantidade
- Histórico de looks com itens favoritos

## Como rodar

1. Certifique-se de ter o Flutter instalado e configurado.
2. Abra o terminal na pasta do projeto.
3. Execute:

```bash
flutter pub get
flutter run
```

Para escolher um dispositivo específico, use `flutter devices` e, em seguida, `flutter run -d <device_id>`.

## Estrutura do projeto

- `lib/main.dart` - código principal do aplicativo e todas as telas da interface
- `pubspec.yaml` - definição de dependências e configuração do Flutter
- `android/` e `ios/` - projetos nativos para cada plataforma
- `test/` - pasta de testes (atualmente com o teste padrão do Flutter)

## Observações

- O aplicativo atualmente é um protótipo de interface e demonstração. Algumas ações são simuladas e não estão conectadas a backend ou API externa.
- A tela de login não faz autenticação real; é apenas uma navegação de demonstração.

## Contribuições

Contribuições são bem-vindas. Para colaborar:

1. Faça um fork do repositório.
2. Crie uma branch com sua feature: `git checkout -b minha-feature`
3. Faça as alterações e envie um pull request.

## Licença

Este projeto não possui licença explícita. Adicione um arquivo `LICENSE` se desejar publicar com direitos definidos.
