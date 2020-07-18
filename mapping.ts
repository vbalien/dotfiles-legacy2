import { dot, DotOption } from "./scripts/dot.ts";

const common: DotOption = {
  link: {
    gitconfig: ".gitconfig",
  },
};

const linux: DotOption = {
  hostname: ["office2"],
  install: [
    "sudo pacman -S git",
    `bash -c "cd && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay"`,
    "yay -Syu",
    `yay -S --needed
            sxhkd bspwm rofi dunst-git visual-studio-code-bin
            ttf-nanum polybar-git baka-mplayer-git
            picom-ibhagwan-git alacritty zsh maim
            xclip xdotool google-chrome pulseaudio
            gnome-keyring pasystray polkit-gnome nerd-fonts-terminus
            gnome-settings-daemon nitrogen dex sassc
            fcitx5 fcitx5-qt fcitx5-gtk fcitx5-hangul fcitx5-anthy
            kcm-fcitx5 numix-gtk-theme-git numix-circle-icon-theme-git`,
  ],
  link: {
    ...common.link,
    "linux/alacritty": ".config/alacritty",
    "linux/bin/ufetch": ".local/bin/ufetch",
    "linux/bspwm": ".config/bspwm",
    "linux/Code/User/settings.json": ".config/Code/User/settings.json",
    "linux/dunst": ".config/dunst",
    "linux/omz": ".config/omz",
    "linux/picom": ".config/picom",
    "linux/polybar": ".config/polybar",
    "linux/rofi": ".config/rofi",
    "linux/sxhkd": ".config/sxhkd",
    "linux/fcitx5": ".config/fcitx5",
    "linux/dconf": ".config/dconf",
    "linux/bakamplayer.ini": ".config/bakamplayer.ini",
    "linux/xinitrc": ".xinitrc",
    "linux/pam_environment": ".pam_environment",
    "linux/zshrc": ".zshrc",
  },
};

const linuxMacbook: DotOption = {
  ...linux,
  hostname: "MBP",
  link: {
    ...linux.link,
    "linux-macbook/dconf": ".config/dconf",
    "linux-macbook/polybar": ".config/polybar",
    "linux-macbook/rofi": ".config/rofi",
    "linux-macbook/sxhkd": ".config/sxhkd",
    "linux-macbook/pam_environment": ".pam_environment",
    "linux-macbook/Xresources": ".Xresources",
  },
};

try {
  await dot(Deno.args, [linux, linuxMacbook]);
} catch (err) {
  console.log(err.message);
}
