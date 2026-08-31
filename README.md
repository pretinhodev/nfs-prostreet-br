# NFS ProStreet — Edição Brasileira (Repack + Tradução + Mods)

Repositório de apoio para montar sua instalação do **Need for Speed: ProStreet v1.1**
com a **tradução brasileira (GameVicio)** e os **mods de correção** mais usados
(Fusion Fix, Extra Options, XtendedInput e HD Reflections).

> ⚠️ **Aviso legal**
> Este repositório **NÃO** contém os arquivos do jogo (executável, dados de mídia etc.),
> que são de propriedade da **EA Games / Black Box**.
> Ele contém apenas **tradução de fã**, **arquivos de mods** e **links**.
> Use apenas com uma cópia do jogo que você possui legalmente.

---

> ⚙️ **IMPORTANTE — ajuste para o seu PC**
> As configurações deste repositório (`.ini` em `Mods/`) são um ponto de partida.
> **Depois de instalar o jogo, rode o `setup-config.ps1`** (veja abaixo) — ele copia os mods
> para a sua instalação e ajusta o gráfico. Não use os `.ini` direto como estão sem rodar o script.

> [!IMPORTANT]
> A versão ORIGINAL em DVD (v1.0) usa **SecuROM v7**, que **não funciona no Windows 10/11**
> (o driver `secdrv.sys` foi removido) — o jogo simplesmente fecha em segundos. Instale uma
> versão **crackeada v1.1** (repack/no-DVD). Sem o exe correto, nem com mods o jogo abre.

---

## 📦 O que tem neste repositório

| Pasta | Conteúdo |
|-------|----------|
| `Traducao-GameVicio/` | `Mexican_*.bin` + `Labels_*.bin` + `Largest_*.bin` (incl. `_DLC`) — tradução brasileira (slot `Mexican Spanish`) |
| `Mods/ASI-Loader/` | `dinput8.dll` — Ultimate ASI Loader (ThirteenAG), carregador dos `.asi` |
| `Mods/FusionFix/` | `NFSProStreet.FusionFix.asi` + `.ini` (Fusion Fix / Widescreen Fix) |
| `Mods/ExtraOptions/` | `NFSPSExtraOptions.asi` + `NFSPSExtraOptionsSettings.ini` (ProStreet ExOpts) |
| `Mods/XtendedInput/` | `NFS_XtendedInput.asi` + `.ini` + `XtendedInputButtons.tpk` + `nfs_cursor.cur` + `EventReference.txt` (XtendedInput) |
| `Mods/HDReflections/` | `NFSPSHDReflections.asi` + `.ini` — reflexos em alta resolução (Aero) |

Scripts:
- **`check-updates.ps1`** — verifica versões (só reporta, NÃO altera) dos mods.
- **`setup-config.ps1`** — copia os mods para o jogo e aplica os ajustes.

---

## 🔗 Links úteis

### Repack / jogo
- **Repack R.G. Mechanics** (v1.1 crackeada/ViTALiTY, com patch LAN/DLC e sem SecuROM):
  - Busque por "Need for Speed ProStreet repack R.G. Mechanics" (site/mirror de confiança).
  - Já inclui os idiomas **English/French/German/Spanish/Largest/Labels/Russian** em `LANGUAGES\`.

### Tradução
- **GameVicio** (tradução brasileira PT-BR): https://www.gamevicio.com
- A tradução ocupa o slot de idioma **`Mexican Spanish`** — no jogo e no registro o idioma
  selecionado é `Mexican Spanish`.
- Verifique/altere o idioma no registro:
  ```powershell
  Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Electronic Arts\Need for Speed ProStreet' | Select-Object Language
  ```

### Mods
- **NFS ProStreet Fusion Fix** (ThirteenAG) — WidescreenFixesPack:
  - Repositório: https://github.com/ThirteenAG/WidescreenFixesPack
  - Releases (tag `nfsps`): https://github.com/ThirteenAG/WidescreenFixesPack/releases
- **NFS ProStreet Extra Options** (ExOpts Team) — `v1.0.1.2578`:
  - Repositório: https://github.com/ExOptsTeam/NFSPSExOpts
  - Releases: https://github.com/ExOptsTeam/NFSPSExOpts/releases
- **Ultimate ASI Loader** (ThirteenAG) — usado pelo `dinput8.dll`:
  - Repositório: https://github.com/ThirteenAG/Ultimate-ASI-Loader
- **NFS XtendedInput** (xan1242) — suporte a controle/gamepad moderno (XInput):
  - Repositório: https://github.com/xan1242/NFS-XtendedInput
  - Releases (baixe o `Release-ProStreet-Pack.zip`, versão 1.22): https://github.com/xan1242/NFS-XtendedInput/releases
- **NFS HD Reflections** (Aero_) — reflexos em alta resolução (ProStreet):
  - nfsmods: https://nfsmods.xyz/ (sem release no GitHub — só o código)

---

## 🛠️ Como instalar

> ⚡ **Recomendado:** use o `setup-config.ps1` (seção **Configurador automático** abaixo).
> Ele copia os mods **e** aplica os ajustes. Os passos manuais são só referência.

### 1. Instale o jogo
1. Instale o **Need for Speed: ProStreet v1.1** (repack limpo — veja links acima).
2. Pasta padrão esperada pelos scripts: a raiz da instalação do jogo (o script a detecta ou pergunta).
3. **Arquivo principal**: `nfs.exe` (v1.1, crackeado/ViTALiTY — sem SecuROM).

> [!IMPORTANT]
> Se você instalar outra versão, **sempre faça um backup da pasta `LANGUAGES\`** antes de mexer
> com a tradução. Este repo foi feito a partir da versão **1.1** (patch LAN/DLC aplicado).

### 2. Aplique a tradução (PT-BR) — ANTES dos mods
> ⚠️ A tradução deve ser aplicada **antes** dos mods (ambos mexem em `LANGUAGES`/`scripts`/`.ini`);
> aplicá-la depois pode sobrescrever arquivos dos mods.

1. Copie o conteúdo de `Traducao-GameVicio\` → pasta `LANGUAGES\` do jogo, **sobrescrevendo**:
   ```
   <pasta do jogo>\LANGUAGES\Mexican_*.bin  (e Labels_*.bin / Largest_*.bin, incl. _DLC)
   ```
2. No jogo (e no registro), confirme o idioma = **`Mexican Spanish`**.

### 3. Instale o ASI Loader + mods (manual — só referência)
O `dinput8.dll` (ASI Loader) é o que carrega os `.asi`:
- Copie `Mods/ASI-Loader/dinput8.dll` → raiz da instalação (ao lado do `nfs.exe`).
- Copie para a pasta `scripts/`:
  - `NFSProStreet.FusionFix.asi` e `.ini`
  - `NFSPSExtraOptions.asi` e `NFSPSExtraOptionsSettings.ini`
  - `NFS_XtendedInput.asi` e `NFS_XtendedInput.ini`
  - `NFSPSHDReflections.asi` e `NFSPSHDReflections.ini`
- Copie `XtendedInputButtons.tpk` → pasta `GLOBAL/` (sobrescrever).
- Copie `EventReference.txt` → raiz da instalação.

> ⚙️ Rodando o `setup-config.ps1` tudo isso é feito automaticamente + ajustes de gráfico.

### 4. Mod do controle (gamepad) — NFS XtendedInput
O ProStreet 2007 só entende controles **DirectInput** e não enxerga controles
Xbox/XInput (nem a maioria dos controles modernos). O **NFS XtendedInput**
adiciona suporte **XInput nativo** + ícones de botão + tudo rebindável.
A instalação é só copiar os arquivos de `Mods/XtendedInput/` (via `setup-config.ps1` ou manual).

> ⚠️ No menu `Controls` do jogo o mod **desabilita a tela (crasha)** — **NÃO entre nele**.
> A configuração é feita pelos `.ini`:
> - Opções gerais: `scripts\NFS_XtendedInput.ini` (deadzone, ícones, etc.)
> - Mapeamento de botões (por save): `scripts\XtendedInputMaps\<nome do save>\NFS_XtendedInput.usermap.ini`
> - Referência de eventos: `EventReference.txt`
>
> 🔧 O mapeamento de botões é **por save (perfil)**, então cada jogador rebinda o seu.
> O `setup-config.ps1` instala o mod mas **não** copia o mapeamento de ninguém.

Se os botões não responderem, rode o jogo **como Administrador** ou mova a pasta
do jogo para fora de `Program Files` (virtualização UAC). Alternativas: **x360ce**
ou **reWASD** (mapeador pago).

### 5. Rode o jogo
   Rode `nfs.exe` (v1.1). Os mods carregam pelo `dinput8.dll`.

---

## 🤖 Configurador automático (setup-config.ps1)

O **`setup-config.ps1`** copia os mods para a pasta do jogo e aplica os ajustes
do `NFSProStreet.FusionFix.ini` — sem copiar arquivos na mão.

### Como usar
1. Baixe/clone este repositório.
2. Abra o **PowerShell** na pasta do repositório.
3. Execute (de preferência como **Administrador**, já que o jogo costuma ficar em `Program Files`):
   ```powershell
   powershell -ExecutionPolicy Bypass -File setup-config.ps1
   ```

O script vai:
- Detectar a pasta do jogo (usa o caminho padrão da instalação se existir, senão pergunta)
- Copiar `dinput8.dll` (ASI Loader) e os mods
  (`FusionFix`, `ExtraOptions`, `XtendedInput`, `HDReflections`) para `scripts/`
- Ajustar o `NFSProStreet.FusionFix.ini` (idioma, câmera, blur, gamma)
- Perguntar se quer a **câmera com stick/mouse**

### Opções avançadas

| Opção | Efeito |
|-------|--------|
| `-GamePath "C:\...\Need for Speed ProStreet"` | Define a pasta do jogo direto |
| `-EnableCamera` | Liga a câmera com stick/mouse (`[CAMERA] Enable = 1`) |
| `-SkipPrompts` | Execução silenciosa (câmera off, sem perguntar) |

Exemplo:
```powershell
powershell -ExecutionPolicy Bypass -File setup-config.ps1 -GamePath "C:\Jogos\NFS ProStreet"
```

---

## 🔎 Verificador de atualizações (check-updates.ps1)

O **`check-updates.ps1`** **apenas verifica** (não baixa nem altera nada) e compara
com o que está instalado em `scripts/`:

- **Fusion Fix** — release do GitHub (`ThirteenAG/WidescreenFixesPack`, tag `nfsps`)
- **Extra Options** — release do GitHub (`ExOptsTeam/NFSPSExOpts`, v1.0.1.2578)
- **XtendedInput** — release do GitHub (`xan1242/NFS-XtendedInput`, 1.22 → `Release-ProStreet-Pack.zip`)
- **HD Reflections** — sem release no GitHub (EOL); checagem **manual** pelo link
  https://nfsmods.xyz/

```powershell
powershell -ExecutionPolicy Bypass -File check-updates.ps1
```

---

## 🎮 Requisitos dos mods

- **Fusion Fix / Extra Options ProStreet** — usa o jogo **v1.1** (`nfs.exe`, crack ViTALiTY).
- **Widescreen Fix** — recomendado para monitores 16:9 / 21:9 / ultrawide.
- **HD Reflections** — recomenda sistema com GPU dedicada mínima (GTX 1060 / RX 480 para 1080p,
  na configuração padrão). Em GPU integrada, ajuste `Scale` no `NFSPSHDReflections.ini`.

---

## ⚙️ Configurações atuais do FusionFix

Configurações aplicadas (prontas para usar / reaplicadas pelo `setup-config.ps1`):

- **`[LANGUAGE] Language = Mexican Spanish`** — tradução PT-BR
- **`[MISC] DisableMotionBlur = 1`** — desativado para performance
- **`[MISC] CustomUserFilesDirectoryInGameDir = save`** — **save local** em `<jogo>\save\` (evita o save em `Documents`/OneDrive, que o jogo de 2007 não lê/grava direito e pode **crashar ao criar perfil**)
- **`[GRAPHICS] ConsoleGamma = 1`** — curva de gamma estilo console (cores mais contrastadas)
- **`[CAMERA] Enable = 0`** — câmera com stick/mouse **desativada** (padrão sem conflito no analógico direito)
- **`FramerateUncap = 1`** — desbloqueio de FPS (v1.1)
- **Extra Options**: `UnlockAllThings`, `UnlockDLC`, `ShowAllCarsInFE`, `RemoveTopSpeedLimiter`
  e `ShowSpecialVinyls` ligados (**tudo liberado**: conteúdo DLC, todos os carros no Car Lot
  para saves novos, sem limitador de velocidade e vinis especiais na loja)

Para habilitar a câmera, use `-EnableCamera` no script ou mude `Enable = 1` na seção
`[CAMERA]` do `Mods/FusionFix/NFSProStreet.FusionFix.ini`.

---

## 📄 Licenças

- **Fusion Fix / Widescreen Fix**: repositório de ThirteenAG (consulte a licença do pack).
- **Extra Options**: GNU GPLv3 (© ExOpts Team).
- **NFS XtendedInput**: MIT (© xan1242).
- **HD Reflections / configurações visuais**: Aero_ (nfsmods).
- **Tradução GameVicio**: créditos à GameVicio.
- **NFS ProStreet**: © EA Games / Black Box. Distribuído aqui apenas como *link*.

---

Feito para facilitar a instalação da versão brasileira do NFS ProStreet.