import { dot, DotOption } from "./scripts/dot.ts";

const common: DotOption = {
  hostname: "home",
  link: {
    ".gitconfig": "gitconfig",
    ".config/omz": "omz",
    ".config/nvim": "nvim",
    ".tmux.conf": "tmux.conf",
    ".tmux/themes": "tmux/themes",
    ".zshrc": "zshrc",
    ".local/bin/ufetch": "linux/bin/ufetch",
    ".vimrc": "vimrc",
  },
};

const darwin: DotOption = {
  hostname: "MacBook-Pro.local",
  install: [
    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`,
    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`,
    "brew tap homebrew/cask-fonts",
    "brew install --cask google-chrome alacritty iina visual-studio-code font-terminess-ttf-nerd-font typora",
    "brew install wget vim yarn yabai skhd spacebar",
  ],
  link: {
    ...common.link,
    ".config/alacritty": "darwin/alacritty",
    ".local/bin/ufetch": "darwin/bin/ufetch",
    ".config/yabai": "darwin/yabai",
    ".config/skhd": "darwin/skhd",
    ".config/spacebar": "darwin/spacebar",
  },
};

const linux: DotOption = {
  hostname: ["office", "T490s"],
  install: [
    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`,
    `sh -c "git clone https://github.com/addy-dclxvi/gtk-theme-collections ~/.themes"`,
    "yay -Syu",
    `yay -S --needed
            sxhkd bspwm rofi-git dunst-git visual-studio-code-bin
            picom-ibhagwan-git alacritty zsh maim gtk-engine-murrine
            xclip xdotool google-chrome pulseaudio polybar-git
            gnome-keyring pasystray polkit-gnome nerd-fonts-terminus
            gnome-settings-daemon feh dex sassc ttf-nanum acpilight
            fcitx5 fcitx5-qt fcitx5-gtk fcitx5-hangul fcitx5-anthy
            kcm-fcitx5 numix-gtk-theme-git numix-circle-icon-theme-git
            telegram-desktop nautilus eog smplayer smplayer-skins transgui-qt
            qt5-styleplugins xdg-user-dirs slim network-manager-applet bc
            glava conky jq xdo ttf-roboto xorg-xsetroot xorg-xinput noto-fonts-cjk`,
  ],
  link: {
    ...common.link,
    ".config/alacritty": "linux/alacritty",
    ".config/bspwm": "linux/bspwm",
    ".config/dunst": "linux/dunst",
    ".config/picom": "linux/picom",
    ".config/polybar": "linux/polybar",
    ".config/rofi": "linux/rofi",
    ".config/sxhkd": "linux/sxhkd",
    ".config/fcitx5": "linux/fcitx5",
    ".config/dconf": "linux/dconf",
    ".config/systemd": "linux/systemd",
    ".config/wallpaper": "wallpaper",
    ".config/glava": "linux/glava",
    ".xinitrc": "linux/xinitrc",
    ".conkyrc": "linux/conkyrc",
    ".jelly-conky": "linux/jelly-conky",
    ".bash_profile": "linux/bash_profile",
    ".pam_environment": "linux/pam_environment",
    ".Xmodmap": "linux/Xmodmap",
    ".Xresources": "linux/Xresources",
  },
};

const linuxHiDPI: DotOption = {
  ...linux,
  hostname: "MBP",
  link: {
    ...linux.link,
    ".config/dconf": "linux-hidpi/dconf",
    ".config/dunst": "linux-hidpi/dunst",
    ".config/picom": "linux-hidpi/picom",
    ".pam_environment": "linux-hidpi/pam_environment",
    ".Xresources": "linux-hidpi/Xresources",
    ".config/glava": "linux-hidpi/glava",
    ".conkyrc": "linux-hidpi/conkyrc",
  },
};

try {
  await dot(Deno.args, [common, linux, linuxHiDPI, darwin]);
} catch (err) {
  console.log(err.message);
}
