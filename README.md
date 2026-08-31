# Need for Speed: ProStreet (v1.1) (PT-BR)

![Jogo](https://img.shields.io/badge/jogo-NFS%20ProStreet%20v1.1-ff7f00)<br>
![Status](https://img.shields.io/badge/status-100%25%20funcional-success)<br>
![Licença](https://img.shields.io/badge/licen%C3%A7a-MIT-blue)

Configuração de mods TODA ORIGINAL (sem repacks sujos, sem versão "FrankenStein" de misturas & sem vírus) para o
**Need for Speed: ProStreet** (2007, Black Box, v1.1) - com **tradução PT-BR (GameVicio)**
já aplicada e todos os mods clássicos de qualidade instalados e validados.

---

## Índice

- [Sobre](#sobre)
- [Onde baixar o jogo](#onde-baixar-o-jogo)
- [Tradução PT-BR (GameVicio)](#tradução-pt-br-gamevicio)
- [Mods incluídos](#mods-incluídos)
- [Estrutura deste repositório](#estrutura-deste-repositório)
- [Como instalar os mods](#como-instalar-os-mods)
- [Como atualizar os mods](#como-atualizar-os-mods)
- [Configuração recomendada](#configuração-recomendada)
- [Solução de problemas](#solução-de-problemas)
- [Sobre o DRM/DVD original](#sobre-o-drmdvd-original)
- [Créditos](#créditos)

---

## Sobre

- **Jogo**: Need for Speed: ProStreet (PC, v1.1).
- **Estúdio**: Black Box (2007).
- **Destaque**: corridas legais (Grip/Drift/Drag/Speed), a academia de corrida e o dano de carro marcante.
- **Pasta padrão** usada nos scripts:
  `C:\Program Files (x86)\R.G. Mechanics\Need for Speed - ProStreet`
- **Arquivo principal**: `nfs.exe` (v1.1, crackeado/ViTALiTY - sem SecuROM).

Este repositório é o "pacote de mods" e o README de configuração. Ele **não contém os arquivos do jogo**
(para não ferir copyright) - apenas os mods (ASIs/ini/tpk), a tradução e os scripts de manutenção.

---

## Onde baixar o jogo

Use instaladores LIMPOS (nada de "patcher" com vírus). Os mais conhecidos:

- **Repack R.G. Mechanics** (o que foi usado aqui, já vem na v1.1 crackeada/ViTALiTY, com patch LAN e sem SecuROM)
  - já inclui os idiomas **English/French/German/Spanish/Largest/Labels/Russian** no `LANGUAGES\`
- Alternativas (instale por sua conta e risco - baixe de sites confiáveis):

> [!IMPORTANT]
> Se você instalar outra versão, **sempre faça um backup da pasta `LANGUAGES\`** antes de mexer
> com a tradução. Este repo foi feito a partir da versão **1.1** (patch LAN/DLC aplicado).

> [!IMPORTANT]
> A versão ORIGINAL em DVD (v1.0) usa **SecuROM v7**, que **não funciona no Windows 10/11**
> (o driver `secdrv.sys` foi removido). O jogo simplesmente não abre. Instale a versão crackeada
> (ou aplique um no-DVD/fixed EXE) para rodar no seu PC. Neste PC usamos o repack R.G. Mechanics.
> Sem o exe correto, nem com mods o jogo abre.

---

## Tradução PT-BR (GameVicio)

A tradução **GameVicio PT-BR** está **já aplicada** no jogo deste PC. Detalhe importante:

- Ela ocupa o slot de idioma **"Spanish (Mexican)"** do jogo (é assim que a tradução GameVicio funciona para o ProStreet).
- No **jogo** e no **registro** o idioma selecionado é `Mexican Spanish`.
- É por isso que os arquivos da tradução se chamam `Mexican_*.bin`.

Você pode verificar/alterar o idioma no registro:

```powershell
Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Electronic Arts\Need for Speed ProStreet' | Select-Object Language
```

- Se quiser **reinstalar**: copie o conteúdo de `Traducao-GameVicio\` para dentro da pasta `LANGUAGES\` do jogo
  (ou rode o script ajustado no seu jogo) e confirme que o idioma está em `Mexican Spanish`.

### Arquivos da tradução (pasta `Traducao-GameVicio\`)

| Arquivo | Função |
|---|---|
| `Mexican_Global.bin` / `Mexican_Frontend.bin` / `Mexican_InGame.bin` / `Mexican_Global_DLC.bin` | Textos PT-BR dos menus/contextos do jogo (inclui o conteúdo DLC) |
| `Labels_Global.bin` / `Labels_Frontend.bin` / `Labels_InGame.bin` / `Labels_Global_DLC.bin` | Rótulos de UI (localizados) |
| `Largest_Global.bin` / `Largest_Frontend.bin` / `Largest_InGame.bin` / `Largest_Global_DLC.bin` | Textos grandes/fontes de UI |

> Os arquivos `Labels_*` e `Largest_*` neste repo são os que estavam instalados com a tradução.
> O objetivo é ter o conjunto completo do slot `Mexican_*`.

---

## Mods incluídos

Todos os mods são **só arquivos `.asi`/`.ini`/`.tpk`/`.dll`** - creditados, baixados das fontes
oficiais e testados (o jogo abre sem crash). Nenhum mod de cheats/sobrecarga - é a config clássica
estável de qualidade.

| Mod | Função | Autor | Fonte oficial |
|---|---|---|---|
| **Fusion Fix** | Correção de HUD/FOV/escala p/ monitores 16:9/21:9, desbloqueio de FPS (v1.1), correções de estabilidade/leaks, fix de LAN p/ Win11, skip intros, gamma, sombras 2048. `NFSProStreet.FusionFix.asi` | ThirteenAG | [WidescreenFixesPack (tag `nfsps`)](https://github.com/ThirteenAG/WidescreenFixesPack/releases) |
| **Extra Options** | Ajustes pós-jogo: vinis especiais na loja, remover limitador de velocidade, desbloqueio de DLC, etc. `NFSPSExtraOptions.asi` | ExOptsTeam | [NFSPSExOpts (v1.0.1.2578)](https://github.com/ExOptsTeam/NFSPSExOpts/releases) |
| **XtendedInput** | Suporte completo a controle XInput (Xbox/PS), ícone de botões dinâmico, tratamento de gamepad. `NFS_XtendedInput.asi` + `XtendedInputButtons.tpk` + `nfs_cursor.cur` + `EventReference.txt` | xan1242 | [NFS-XtendedInput (1.22)](https://github.com/xan1242/NFS-XtendedInput/releases) |
| **HD Reflections** | Reflexos do carro/cidade em alta resolução. `NFSPSHDReflections.asi` | Aero_ | [nfsmods.xyz/mod/... (ProStreet)](https://nfsmods.xyz/) |
| **ASI Loader - dinput8.dll** | Carregador de mods ASI (veio junto do WidescreenFixesPack, é o "Ultimate ASI Loader" do ThirteenAG) | ThirteenAG | (mesma fonte do Fusion Fix) |

> [!NOTE]
> Por padrão, o Extra Options vem com `ShowSpecialVinyls`, `RemoveTopSpeedLimiter` e `UnlockDLC`
> DESLIGADOS neste setup - o objetivo é manter o gameplay ORIGINAL do v1.1.

---

## Estrutura deste repositório

```
nfs-prostreet-br/
├── README.md
├── LICENSE                      (MIT)
├── .gitignore                   (protege arquivos originais do jogo - .big/.zip/etc)
├── Mods/
│   ├── ASI-Loader/              dinput8.dll  (Ultimate ASI Loader)
│   ├── FusionFix/               NFSProStreet.FusionFix.asi + .ini
│   ├── ExtraOptions/            NFSPSExtraOptions.asi + NFSPSExtraOptionsSettings.ini
│   ├── XtendedInput/            NFS_XtendedInput.asi/.ini + XtendedInputButtons.tpk + EventReference.txt + nfs_cursor.cur
│   └── HDReflections/           NFSPSHDReflections.asi + .ini
├── Traducao-GameVicio/          Mexican_*.bin + Labels_*.bin + Largest_*.bin (PT-BR)
├── check-updates.ps1            verifica se os mods têm versão mais recente (sem baixar)
└── setup-config.ps1             aplica/copia os mods na pasta do jogo e ajusta o ini
```

---

## Como instalar os mods

1. Rode o script de configuração (de preferência como **Administrador**, já que o jogo está em `Program Files`):

```powershell
powershell -ExecutionPolicy Bypass -File setup-config.ps1
```

2. Se o jogo estiver em outra pasta:

```powershell
powershell -ExecutionPolicy Bypass -File setup-config.ps1 -GamePath "C:\papai\Need for Speed ProStreet"
```

O script copia os mods para `scripts\`, o `dinput8.dll` para a raiz, o `.tpk` para `GLOBAL\`,
e **ajusta o `NFSProStreet.FusionFix.ini`** para o seu PC:

- `[LANGUAGE] Language = Mexican Spanish` (tradução PT-BR)
- `[MISC] DisableMotionBlur = 1` (tira o blur - mais FPS em gráficos integrados)
- `[CAMERA] Enable = 0` (câmera livre OFF por padrão)
- `[GRAPHICS] ConsoleGamma = 1` (contraste estilo Xbox 360)

---

## Como atualizar os mods

Rode (não baixa nada, só informa se existe versão nova e de onde):

```powershell
powershell -ExecutionPolicy Bypass -File check-updates.ps1
```

Consultas feitas:

| Mod | Fonte da consulta |
|---|---|
| Fusion Fix | GitHub release tag `nfsps` do WidescreenFixesPack |
| Extra Options | GitHub releases do ExOptsTeam/NFSPSExOpts |
| XtendedInput | GitHub 1.22 (Release-ProStreet-Pack.zip) |
| HD Reflections | Manual (nfsmods.xyz, sem release no GitHub - end of life) |

Para atualizar qualquer um: **faça backup do arquivo atual** e substitua pela versão nova.

---

## Configuração recomendada

- **Resolução/monitor**: o Fusion Fix usa a resolução nativa da tela automaticamente.
- **Modo janela** (se quiser): `[MISC] WindowedMode = 1 (borderless)`.
- **FPS**: o `FramerateUncap = 1` vem ligado (v1.1). Em monitores de 144 Hz+ o `SimRate = -1` acompanha a taxa.
- **Gamer**: o Fusion Fix redireciona o suporte a gamepad para o **XtendedInput** - configure os binds no `NFS_XtendedInput.ini`.
- **Câmera livre**: `[CAMERA] Enable = 0` por padrão (ativável no ini).
- **Extra Options**: mantenha `ShowSpecialVinyls`, `RemoveTopSpeedLimiter` e `UnlockDLC` em `0` para o gameplay original.

---

## Solução de problemas

| Problema | Causa provável / solução |
|---|---|
| Jogo não abre (v1.0/DVD) | SecuROM v7 não roda no Win10/11. Use uma versão crackeada/no-DVD (v1.1). É obrigatório. |
| Jogo abre e fecha em segundos | Mesma causa de cima - exe com SecuROM. |
| Sem tradução | Verifique idioma = `Mexican Spanish` no registro e arquivos `Mexican_*.bin` em `LANGUAGES\`. |
| Mods não carregam | O `dinput8.dll` (Ultimate ASI Loader) precisa estar na **raiz** do jogo (ao lado do `nfs.exe`). |
| Menu de controles estranho | XtendedInput redireciona o gamepad; configure no `NFS_XtendedInput.ini`. |
| Áudio/legendas dos menus em inglês | É normal: a tradução GameVicio cobre textos; vídeos/áudio são do original. |

---

## Sobre o DRM/DVD original

- A versão **v1.0 original em DVD** usa **SecuROM v7 (v7.34.0017)**.
- O **Windows 10/11 removeu o driver `secdrv.sys`** que o SecuROM precisa - o jogo fecha sozinho
  (exit code 1) em 3-7 segundos, com ou sem mods.
- Para jogar: instale uma versão **crackeada** (repack) ou aplique um **no-DVD/fixed EXE**.
  Neste PC usamos o repack R.G. Mechanics (v1.1, crack ViTALiTY, sem SecuROM, com patch LAN já incluso).

> [!WARNING]
> O no-DVD/fixed EXE e a tradução/e os mods NÃO são do mesmo autor. Ao misturar exe de terceiros
> você assume o risco (baixe de fontes confiáveis, verifique o hash com o da cena se quiser).

---

## Créditos

- **ThirteenAG** - WidescreenFixesPack (nfsps/Fusion Fix), Ultimate ASI Loader (dinput8.dll).
- **ExOptsTeam** - Extra Options para o ProStreet.
- **xan1242** - XtendedInput (ProStreet pack).
- **Aero_ (AeroWidescreen)** - HD Reflections.
- **GameVicio** - Tradução PT-BR.
- **R.G. Mechanics** - Repack original usado na instalação (v1.1, ViTALiTY).

Feito para uso pessoal. **Sem distribuir os arquivos do jogo** (`.big`, `.bun` etc.).
Os arquivos de mod pertencem aos autores acima; os arquivos de tradução pertencem aos seus autores.

---

## Licença

MIT - veja [LICENSE](LICENSE). Os mods/tradução mantêm suas próprias licenças/autores.