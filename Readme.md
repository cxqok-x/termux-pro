<div align="center">

```
████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗    ██████╗ ██████╗  ██████╗
╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝    ██╔══██╗██╔══██╗██╔═══██╗
   ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝     ██████╔╝██████╔╝██║   ██║
   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗     ██╔═══╝ ██╔══██╗██║   ██║
   ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗    ██║     ██║  ██║╚██████╔╝
   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝
```

**Terminal Enhancement Suite for Android**

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Termux%20%7C%20Android-black?style=flat-square&logo=android&logoColor=white)
![ASCII Art](https://img.shields.io/badge/ASCII%20Art-8%20Styles-00c896?style=flat-square)
![Colors](https://img.shields.io/badge/Colors-15%20Options-blueviolet?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)

</div>

---

## ✦ Overview

**Termux-Pro** is a powerful Termux customization toolkit that transforms your plain terminal into a fully personalized hacking-style environment. Get live system stats, a beautiful colored prompt, ASCII art on startup, and a full dashboard — all configured from a single interactive menu.

---

## ⚡ Installation

> **One command. Copy, paste, done.**

```bash
pkg update -y && pkg install git -y && git clone https://github.com/cxqok-x/termux-pro.git && cd termux-pro && chmod +x termux-pro.sh && bash termux-pro.sh
```

---

## ✦ Features

| Feature | Details |
|---|---|
| 📊 **Live Dashboard** | Real-time battery, ping, IP, time & hostname in one control panel |
| 🎨 **Color Customization** | 15 colors for every element — brackets, username, hostname, path, battery, ping, IP, time |
| 🖼️ **ASCII Art** | 8 unique styles with 7 color options each |
| 🔋 **Battery & Network API** | Live battery percentage + network connectivity testing |
| 🧪 **Components Test** | Instantly test all system components |
| ⚙️ **Easy Setup** | One-command install, reinstall from dashboard, clean uninstall |

---

## 🖼️ ASCII Art Styles

```
1) HACKER1      2) HACKER2      3) LINUX
4) ARCH         5) DRAGON       6) KALI
7) BUTTERFLY    8) PIKACHU
```

> 7 colors available for each style: Red, Green, Yellow, Blue, Magenta, Cyan, White

---

## 🎨 Color Customization

Customize **15 different colors** for every prompt element individually:

```
Elements  →  Brackets · Username · Hostname · Path
             Battery  · Ping     · IP Address · Time

Colors    →  black · red · green · yellow · blue · magenta · cyan · white
             + bright variants of all 8
```

---

## 💻 Commands

### Main
| Command | Description |
|---|---|
| `dashboard` | Open the control panel |
| `helpme` | Show all commands |
| `update` | Update all packages |

### Info
| Command | Description |
|---|---|
| `battery` | Battery status |
| `myip` | Your IP address |
| `mymac` | MAC address *(root required)* |
| `pingtest` | Run a ping test |
| `sysinfo` | Detailed system info |
| `vars` | View live variables |

### Utilities
| Command | Description |
|---|---|
| `cls` / `clear` | Clear the screen |
| `ll` | List files |
| `uninstall-pro` | Remove Termux-Pro |

---

## 🗑️ Uninstall

```bash
uninstall-pro
```

Then type `exit` or close Termux to complete removal.

---

## ⚠️ Troubleshooting

| Problem | Fix |
|---|---|
| Terminal stuck / frozen | Press `Ctrl + C` |
| Command not found after install | Restart Termux and try again |
| Battery API not working | Allow Termux battery permissions in Android settings |

---

## 📁 Project Structure

```
termux-pro/
├── termux-pro.sh       # Main installation & setup script
├── README.md           # Documentation
└── ...
```

---

<div align="center">

**Made with ❤️ by NYRZ**

*Type `dashboard` for customization · Type `helpme` for all commands*

</div>
