<div align="center">

![dotfiles](./dotfiles.jpg)

# [KDE Plasma] - Dracula All In 🧛‍♂️

![Rice](./assets/rice-sc1.png)
![Rice Video](./assets/rice.gif)
![Rice](./assets/rice.png)

</div>

## [KDE Plasma Setup](./assets/kde-setup)

## [Wallpaper](https://github.com/poseidon-code/wallpapers)

## [Panel](./assets/panel)

## [Dolphin](./assets/dolphin)

## [Konsole](./assets/konsole)

## Packages

```bash
sudo pacman -S neovim moc nano firefox lsd bat ranger base base-devel btop git neofetch nodejs go jdk-openjdk jre-openjdk npm python libdbusmenu-glib vlc telegram-desktop discord libreoffice-fresh latte
yay -S cava peaclock visual-studio-code-bin
```

## Setup Pipewire

```bash
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack xdg-desktop-portal xdg-desktop-portal-kde
sudo systemctl enable --now pipewire-pulse.service
```

## KDE Suite Packages

```bash
sudo pacman -S kde-network-meta kde-system-meta kde-utilities-meta kde-accessibility-meta dolphin-plugins gwenview elisa ark okular spectacle konsole kate dolphin kmail
```

## Miscelenous Setup

> **Setup pacman**
>
> ```bash
> sudo nano /etc/pacman.conf
> ```
>
> uncomment (then Save & Exit) : \
> `Color` \
> `ParallelDownloads = 6`

> **Setup Mirrors**
>
> ```bash
> sudo pacman -S reflector
> sudo reflector --latest 5 --sort rate --country 'India' --save /etc/pacman.d/mirrorlist
> sudo pacman -Syyuu
> ```

> **Setup yay AUR Helper**
>
> ```bash
> git clone https://aur.archlinux.org/yay.git
> cd yay/
> makepkg -si
> sudo pacman -Rs $(pacman -Qdtq)
> sudo pacman -Scc
> cd ..
> sudo rm -rf yay
> ```

> **For KDE Discover to work**
>
> ```bash
> sudo pacman -S packagekit packagekit-qt5
> ```

> **Setup dotfiles** \
> Copy all dot files from this repository to their respective directories.

> **Setup Konsole Color Scheme** \
> https://draculatheme.com/konsole
