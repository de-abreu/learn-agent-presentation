# Code, Config, and Curriculum

This repository hosts the presentation titled _"Code, Config, and Curriculum:
Aligning AI Assistants with Pedagogical Goals"_ and a complimentary Nix flake to
replicate the tools and configuration used for the presentation itself.

## How to run

### Using Nix Flakes

With [nix installed](https://nixos.org/download/) and
[flakes enabled](https://nixos.wiki/wiki/flakes), execute the following command
in your terminal:

```bash
nix run github:de-abreu/learn-agent-presentation --  code-config-curriculum.md
```

To use the light theme:

```bash
nix run github:de-abreu/learn-agent-presentation -- --theme light code-config-curriculum-light.md
```

You may also pass any other presenterm options as arguments:

```bash
nix run github:de-abreu/learn-agent-presentation -- --theme light --export-pdf code-config-curriculum-light.md
```

> [!NOTE]
>
> For more information on presenterm options, check
> `nix run github:de-abreu/learn-agent-presentation -- --help`

### Using whichever package manager is supported by your distribution

These are the dependencies of this project, for you to install however you see
fit.

#### Obligatory

| Package     | Version |
| :---------- | :------ |
| presenterm  | 0.15.1  |
| mermaid-cli | 11.12.0 |

#### Optional

If you would like to
[export pdfs of the presentation](https://mfontanini.github.io/presenterm/features/exports.html?highlight=export#exporting-presentations)

| Package    | Version |
| :--------- | :------ |
| python     | 3.11.15 |
| weasyprint | 68.0    |

#### Cloning the repository and launching the presentation

```bash
git clone https://github.com/de-abreu/learn-agent-presentation.git
cd learn-agent-presentation
nix run . --theme dark code-config-curriculum.md
```
