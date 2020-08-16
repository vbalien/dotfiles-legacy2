import { dot, DotOption } from "./scripts/dot.ts";

const common: DotOption = {
  link: {
    ".gitconfig": "gitconfig"
  }
};

const linux: DotOption = {
  hostname: ["office2", "T490s"],
  install: [
    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`,
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
            qt5-styleplugins xdg-user-dirs slim network-manager-applet bc`
  ],
  link: {
    ...common.link,
    ".config/alacritty": "linux/alacritty",
    ".local/bin/ufetch": "linux/bin/ufetch",
    ".config/bspwm": "linux/bspwm",
    ".config/Code/User/settings.json": "linux/Code/User/settings.json",
    ".config/dunst": "linux/dunst",
    ".config/omz": "linux/omz",
    ".config/picom": "linux/picom",
    ".config/polybar": "linux/polybar",
    ".config/rofi": "linux/rofi",
    ".config/sxhkd": "linux/sxhkd",
    ".config/fcitx5": "linux/fcitx5",
    ".config/dconf": "linux/dconf",
    ".config/systemd": "linux/systemd",
    ".config/wallpaper": "wallpaper",
    ".config/nvim": "linux/nvim",
    ".tmux/themes": "tmux/themes",
    ".xinitrc": "linux/xinitrc",
    ".pam_environment": "linux/pam_environment",
    ".zshrc": "linux/zshrc",
    ".Xmodmap": "linux/Xmodmap",
    ".Xresources": "linux/Xresources"
  }
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
    ".Xresources": "linux-hidpi/Xresources"
  }
};

try {
  await dot(Deno.args, [linux, linuxHiDPI]);
} catch (err) {
  console.log(err.message);
}
