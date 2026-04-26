#!/data/data/com.termux/files/usr/bin/bash
# TERMUX PRO - 
# This script is free and open source
# GitHub: @cxqok-x

CONFIG_DIR="$HOME/.termux-pro"
CONFIG_FILE="$CONFIG_DIR/config"
COLOR_FILE="$CONFIG_DIR/colors"
ZSHRC_FILE="$HOME/.zshrc"
ASCII_DIR="$CONFIG_DIR/ascii"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

print_status()  { echo -e "${GREEN}[✓]${NC} $1"; }
print_error()   { echo -e "${RED}[✗]${NC} $1"; }
print_info()    { echo -e "${BLUE}[i]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[!]${NC} $1"; }

install_system() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════╗"
    echo "║     - TERMUX PRO -                   ║"
    echo "║  DEV :             NYRZ             ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${NC}"

    print_info "Packages update ho rahe hain..."
    pkg update -y > /dev/null 2>&1
    pkg install -y zsh git curl termux-api python3 net-tools > /dev/null 2>&1
    print_status "Packages install ho gaye"

    mkdir -p "$CONFIG_DIR"
    mkdir -p "$ASCII_DIR"

    echo -e "${YELLOW}"
    read -p "Username daalo (e.g. adam): " USERNAME
    USERNAME=${USERNAME:-user}
    read -p "Hostname daalo (e.g. localhost): " HOST
    HOST=${HOST:-localhost}
    echo -e "${NC}"

    echo -e "${CYAN}ASCII Art choose karo:${NC}"
    echo "  1) HACKER1 (Epic hacking)"
    echo "  2) HACKER2 (Epic hacking2)"
    echo "  3) LINUX (Linux logo)"
    echo "  4) ARCH (Arch logo)"
    echo "  5) DRAGON (Dragon)"
    echo "  6) KALI (Kali text)"
    echo "  7) BUTTERFLY (for my lovely gurls)"
    echo "  8) PIKACHU (for pkmn fans)"
    read -p "Select [1-8] (default 1): " ART_CHOICE
    ART_CHOICE=${ART_CHOICE:-1}
    
    echo -e "${CYAN}ASCII Art Color choose karo:${NC}"
    echo "  1) Red"
    echo "  2) Green"
    echo "  3) Yellow"
    echo "  4) Blue"
    echo "  5) Magenta"
    echo "  6) Cyan"
    echo "  7) White"
    read -p "Select [1-7] (default 6): " ART_COLOR
    ART_COLOR=${ART_COLOR:-6}

    cat > "$CONFIG_FILE" << EOF
USERNAME="$USERNAME"
HOST="$HOST"
ASCII_ART="$ART_CHOICE"
ASCII_COLOR="$ART_COLOR"
EOF

    cat > "$COLOR_FILE" << 'EOF'
COLOR_BRACKET="cyan"
COLOR_USER="green"
COLOR_HOST="yellow"
COLOR_PATH="blue"
COLOR_BATTERY="magenta"
COLOR_PING="red"
COLOR_IP="green"
COLOR_TIME="white"
COLOR_ARROW="cyan"
EOF

    echo "TERMUX_PRO_PART=2" > "$CONFIG_DIR/.install_state"
    curl -s -o "$CONFIG_DIR/termux-pro-part2.sh" "https://raw.githubusercontent.com/cxqok-x/termux-pro/main/termux-pro-part2.sh"
    bash "$CONFIG_DIR/termux-pro-part2.sh"
}
