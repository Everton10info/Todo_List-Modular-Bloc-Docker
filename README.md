# Aplicativo Todo-List

Projeto criado em [Flutter](https://flutter.dev/) para estudo de conceitos como navegação, gerencia de estado, uso de containers e princípios de SOLID.
Templaty criado no [Figma](https://www.figma.com/) por @mathes

## Ferramentas utilizadas

* Modular - <https://modular.flutterando.com.br/>
* Bloc - <https://bloclibrary.dev/#/>
* Docker - <https://docs.docker.com/>
* Figma - <https://www.figma.com/>

## Descrição do Projeto

Aplicação de lista de tarefas, possibilitando adicionar tarefas , marcar como concluídas e excluí-las. Os dados são estraídos e armazenados no Back End, essa aplicação é fornecida pela documentação do Docker, um exemplo de imagem com Node.js, usando essa ótima ferramenta de containerização. A gerencia de estado é feita através do [Flutter Bloc](https://pub.dev/packages/flutter_bloc), injeção de dependência, navegação e modularização com [Flutter Modular](https://pub.dev/packages/flutter_modular).
## Passos para executar o Aplicativo
1. Instalação do Docker <https://docs.docker.com/get-started/>.
2. Download e execução da aplicação Getting-Started <https://docs.docker.com/get-started/>.
3. Suba a aplicação Getting-Started e teste no seu navegador .
4. Baixe ou faça o clone deste repositório.
5. Execute seu emulador Android e no terminal de seu sistema operacional digite: ```adb reverse tcp:3000 tcp:3000 ```, isso permitirá que seu emulador conecte-se no servidor local.
6. Suba seu container com a imagem Getting-Started .
7. Execute o aplicativo Todo_List no seu emulador e pronto, o aplicativo estará consumindo o dados do back end em Node.js contido na imagem que está no cantainer. 
