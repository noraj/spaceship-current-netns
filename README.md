<h1 align="center">
  🖧 + 🚀
  <br>Current network namespace Spaceship Section<br>
</h1>

<h4 align="center">
  A <a href="https://man7.org/linux/man-pages/man8/ip-netns.8.html" target="_blank">Current network namespace</a> section for Spaceship prompt
</h4>
</p>

## Installing

You need to source this plugin somewhere in your dotfiles. Here's how to do it with some popular tools:

### [Oh-My-Zsh]

Execute this command to clone this repo into Oh-My-Zsh plugin's folder:

```zsh
git clone https://github.com/noraj/spaceship-current-netns.git $ZSH_CUSTOM/plugins/spaceship-current-netns
```

Include `spaceship-current-netns` in Oh-My-Zsh plugins list:

```zsh
plugins=($plugins spaceship-current-netns)
```

### [zplug]

```zsh
zplug "noraj/spaceship-current-netns"
```

### [antigen]

```zsh
antigen bundle "noraj/spaceship-current-netns"
```

### [antibody]

```zsh
antibody bundle "noraj/spaceship-current-netns"
```

### [zinit]

```zsh
zinit light "noraj/spaceship-current-netns"
```

### [zgen]

```zsh
zgen load "noraj/spaceship-current-netns"
```

### [sheldon]

```toml
[plugins.spaceship-current-netns]
github = "noraj/spaceship-current-netns"
```

### Manual

If none of the above methods works for you, you can install Spaceship manually.

1. Clone this repo somewhere, for example to `$HOME/.zsh/spaceship-current-netns`.
2. Source this section in your `~/.zshrc`.

### Example

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/noraj/spaceship-current-netns.git "$HOME/.zsh/spaceship-current-netns"
```

For initializing prompt system add this to your `.zshrc`:

```zsh title=".zshrc"
source "~/.zsh/spaceship-current-netns/spaceship-current-netns.plugin.zsh"
```

## Usage

After installing, add the following line to your `.zshrc` in order to include Current network namespace section in the prompt:

```zsh
spaceship add current-netns
```

Or add `current-netns` to `SPACESHIP_PROMPT_ORDER` or `SPACESHIP_RPROMPT_ORDER`. For example:

```
SPACESHIP_PROMPT_ORDER=(user host dir git node ruby golang php rust docker current-netns line_sep char)
```

## Options

This section is shown only in directories within a foobar context.

| Variable                   |              Default               | Meaning                              |
| :------------------------- | :--------------------------------: | ------------------------------------ |
| `SPACESHIP_NETNS_SHOW`     |               `true`               | Show current section                 |
| `SPACESHIP_NETNS_PREFIX`   | `(`                                | Prefix before section                |
| `SPACESHIP_NETNS_SUFFIX`   | `)`                                | Suffix after section                 |
| `SPACESHIP_NETNS_SYMBOL`   |               `ns🛸`               | Character to be shown before version |
| `SPACESHIP_NETNS_COLOR`    |             `magenta`              | Color of section                     |


<!-- References -->

[Oh-My-Zsh]: https://ohmyz.sh/
[zplug]: https://github.com/zplug/zplug
[antigen]: https://antigen.sharats.me/
[antibody]: https://getantibody.github.io/
[zinit]: https://github.com/zdharma/zinit
[zgen]: https://github.com/tarjoilija/zgen
[sheldon]: https://sheldon.cli.rs/
