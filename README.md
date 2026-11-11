# Galaxy Adventure PS3 — projeto expandido

Jogo original de aventura espacial, inspirado no gênero de plataforma 3D com planetas e gravidade radial. Não usa código, personagens, músicas, fases ou arquivos extraídos de Super Mario Galaxy/Nintendo.

## O que esta versão contém
- Simulação de movimento 3D com gravidade radial em planetas esféricos.
- Quatro posições de planetas e progressão de três níveis.
- Personagem com salto, vidas e invulnerabilidade temporária.
- Inimigos, estrelas colecionáveis e condição inicial de chefe.
- Câmera de acompanhamento (dados para o renderizador).
- Estados de título, jogo, pausa, fase concluída e game over.
- Salvamento/carregamento binário básico.
- Testes automatizados e GitHub Actions para compilar/testar a lógica C.

## Limitação importante
Este é um projeto expandido de **lógica e sistemas**, não um jogo 3D completo pronto para jogar no PS3. Ainda não inclui o renderizador RSX, modelos/texturas/animações, áudio, interface gráfica final, nem integração real do DualShock 3. `src/ps3_main.c` é um ponto de integração, não um executável funcional. O workflow atual compila os testes nativos no Linux e **não gera PKG/ELF de PS3**.

## Testar no GitHub
1. Envie o conteúdo do ZIP para um repositório GitHub.
2. Abra a aba **Actions**.
3. Execute `Galaxy Adventure - logic checks` ou faça um commit.
4. O workflow compila e executa os testes da lógica. O artefato gerado não é instalável no PS3.

## Próxima etapa para o PS3
A integração deve usar o ambiente completo `ps3dev` (toolchain PPU/SPU + PSL1GHT), e seguir os exemplos oficiais `samples/graphics` e `samples/input` para RSX/vídeo e ioPad. A documentação do PSL1GHT informa que o SDK isolado não é a toolchain completa e que aplicações de exemplo podem gerar ELF/SELF e, quando têm alvo de pacote, PKG: https://github.com/ps3dev/PSL1GHT

Não existe ainda um PKG neste ZIP. É necessário implementar e testar o front-end RSX/ioPad antes de prometer que o jogo roda em PS3 real ou RPCS3.

## Controles previstos
- Analógico esquerdo: movimentar
- X: pular/confirmar
- Start: pausar
- Círculo: voltar

## Build local de lógica
```sh
make test
```
