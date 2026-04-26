

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
    echo "║  DEV :             CXQOK             ║"
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


    cat > "$ASCII_DIR/art1.txt" << 'EOF'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠈⠉⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣄⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠾⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⣤⣶⣤⣉⣿⣿⡯⣀⣴⣿⡗⠀⠀⠀⠀⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⡈⠀⠀⠉⣿⣿⣶⡉⠀⠀⣀⡀⠀⠀⠀⢻⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡇⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⢸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠉⢉⣽⣿⠿⣿⡿⢻⣯⡍⢁⠄⠀⠀⠀⣸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠐⡀⢉⠉⠀⠠⠀⢉⣉⠀⡜⠀⠀⠀⠀⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠘⣤⣭⣟⠛⠛⣉⣁⡜⠀⠀⠀⠀⠀⠛⠿⣿⣿⣿
⡿⠟⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⡀⠀⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF

    cat > "$ASCII_DIR/art2.txt" << 'EOF'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣠⣤⣤⣤⣤⣤⡙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣦⣈⠻⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡿⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢹⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡿⢀⣿⣿⡿⠿⠛⢋⣉⣉⡙⠛⠿⢿⣿⣿⡄⢹⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣧⠘⢿⣤⡄⢰⣿⣿⣿⣿⣿⣿⣶⠀⣤⣽⠃⣸⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⡿⠛⢋⣁⡈⢻⡇⢸⣿⣿⣿⣿⣿⣿⡿⢠⡿⢁⣈⡙⠛⢿⣿⣿⣿⣿
⣿⣿⣿⡿⢁⡾⠿⠿⠿⠄⠹⠄⠙⠛⠿⠿⠟⠋⠠⠞⠠⠾⠿⠿⠿⡄⢻⣿⣿⣿
⣿⣿⡿⢁⣾⠀⣶⣶⣿⣿⣶⣾⣶⣶⣶⣶⣶⣿⣿⣷⣾⣷⣶⣶⠀⣷⡀⢻⣿⣿
⣿⣿⠁⣼⣿⠀⣿⣿⣿⣿⣿⣿⠟⣉⣤⣤⣈⠛⣿⣿⣿⣿⣿⣿⠀⣿⣷⡈⢿⣿
⣿⠃⣼⣿⣿⠀⣿⣿⣿⣿⣿⡇⣰⡛⢿⡿⠛⣧⠘⣿⣿⣿⣿⣿⠀⣿⣿⣷⠈⣿
⡇⢸⣿⣿⣿⠀⣿⣿⣿⣿⣿⣧⡘⠻⣾⣷⠾⠋⣰⣿⣿⣿⣿⣿⠀⣿⣿⣿⣧⠘
⣷⣌⠙⠿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣄⣉⣉⣠⣿⣿⣿⣿⣿⣿⣿⠀⣿⡿⠛⣡⣼
⣿⣿⣿⣦⣈⠀⠿⠿⠿⠿⠿⠟⠛⠛⠛⠛⠿⠛⠟⠛⢿⣿⠛⠻⠀⢉⣴⣾⣿⣿
⣿⣿⣿⣿⣿⡀⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠀⣿⣿⣿⣿⣿
EOF

    cat > "$ASCII_DIR/art3.txt" << 'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⢫⡌⣿⣿⢉⣤⠹⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣜⠗⠉⠙⠘⠻⢡⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣥⡀⠀⢀⡠⣐⣸⣿⡿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠇⠉⠒⠶⠉⠀⠀⢻⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣿⠃⠀⠀⠀⠁⠀⠀⠀⠀⢻⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣼⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣦⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⡆⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣾⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡀⠀⠀⠀
⠀⠀⠀⢀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀
⠀⠀⠀⡸⠋⠛⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⢼⣿⣿⣿⣿⠃⠀⠀⠀
⡐⠀⠈⠀⠀⠀⠈⢻⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⡿⠿⠃⠀⠀⠀⠀
⢡⠀⠀⠀⠀⠀⠀⠀⠻⣿⠷⠀⠀⠀⠀⠀⠀⠀⣠⠃⠀⠀⠀⠀⠀⠀⠐⠠⡀
⡄⠀⠀⠀⠀⠀⠀⠀⠀⠑⣄⠀⠀⠀⠀⣀⣤⣾⣿⠀⠀⠀⠀⠀⠀⠀⣀⡠⠃
⠒⠠⠤⣀⣄⡀⠀⠀⢀⣰⣿⠿⠿⠿⠿⠿⠿⠿⣿⡄⠀⠀⢀⡠⠔⠉⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠙⠻⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⠷⠿⠋⠀⠀⠀⠀⠀⠀
EOF

    cat > "$ASCII_DIR/art4.txt" << 'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡘⢿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣶⣽⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⠿⠿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⡟⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀
⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⡷⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣽⣛⠀⠀⠀⠀
⠀⠀⢠⣿⣿⣿⣿⣿⣿⠿⠛⠛⠀⠀⠀⠀⠀⠀⠛⠛⠿⣿⣿⣿⣿⣿⣶⡄⠀⠀
⠀⢰⣿⣿⠿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⣿⣿⡆⠀
⡰⠟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢆
EOF

    cat > "$ASCII_DIR/art5.txt" << 'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⣄⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣀⠀⠀⢢⣤⣀⣦⣄⡀⠙⣶⡘⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⣀⣨⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣯⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣽⣿⣿⣿⣿⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⣻⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⢿⣷⡀⠀⠀⠀⠀⠀⠀
⠀⠀⣴⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣷⣽⣷⣄⠀⠀⠀⠀⠀
⠀⠀⠀⣾⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⣯⠁⠀⠀⠀⠀
⠀⠀⠐⠛⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣷⣄⡀⠀⠀
⠀⠀⠀⠀⠘⠟⠿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⠇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠟⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣷⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF

    cat > "$ASCII_DIR/art6.txt" << 'EOF'
⠲⣶⣶⣦⠀⢀⣴⣶⣶⠖⠀⠀⠒⢶⣶⣶⣶⠀⠀⠐⢶⣶⣶⣦⠀⠀⠀⠒⢶⣶⣶⡆
⠀⣿⣿⣿⣠⣾⣿⡿⠋⠀⠀⠀⢠⣿⣿⣿⣿⣧⠀⠀⠠⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⡇
⠀⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⣾⣿⡿⠹⣿⣿⣇⠀⠐⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⡇
⠀⣿⣿⣿⠟⣿⣿⣿⣄⠀⠀⣼⣿⣿⣿⣶⣿⣿⣿⣆⢈⣿⣿⣿⣤⣤⣄⣀⣸⣿⣿⡇
⠀⣿⣿⡿⠀⠈⢿⣿⣿⡆⢸⣿⣿⠏⠉⠉⠉⢿⣿⡿⡄⣿⣿⣿⣿⢿⣿⡿⢸⣿⣿⡇
EOF

    cat > "$ASCII_DIR/art7.txt" << 'EOF'
⣠⣤⣤⡤⠤⢤⣤⣀⡀⠀⠐⠒⡄⠀⡠⠒⠀⠀⢀⣀⣤⠤⠤⣤⣤⣤⡄
⠈⠻⣿⡤⠤⡏⠀⠉⠙⠲⣄⠀⢰⢠⠃⢀⡤⠞⠋⠉⠈⢹⠤⢼⣿⠏⠀
⠀⠀⠘⣿⡅⠓⢒⡤⠤⠀⡈⠱⣄⣼⡴⠋⡀⠀⠤⢤⡒⠓⢬⣿⠃⠀⠀
⠀⠀⠀⠹⣿⣯⣐⢷⣀⣀⢤⡥⢾⣿⠷⢥⠤⣀⣀⣞⣢⣽⡿⠃⠀⠀⠀
⠀⠀⠀⠀⠈⢙⣿⠝⠀⢁⠔⡨⡺⡿⡕⢔⠀⡈⠐⠹⣟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢼⣟⢦⢶⢅⠜⢰⠃⠀⢹⡌⢢⣸⠦⠴⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣿⣇⡬⡌⢀⡟⠀⠀⠀⢷⠀⣧⢧⣵⣿⠂⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⢻⠛⠋⠉⠀⠀⠀⠀⠈⠉⠙⢻⡏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠄⠀⠀⠀⠀⠀⠀
EOF

    cat > "$ASCII_DIR/art8.txt" << 'EOF'
⠸⣷⣦⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⠀⠀⠀
⠀⠙⣿⡄⠈⠑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠔⠊⠉⣿⡿⠁⠀⠀⠀
⠀⠀⠈⠣⡀⠀⠀⠑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠁⠀⠀⣰⠟⠀⠀⠀⣀⣀
⠀⠀⠀⠀⠈⠢⣄⠀⡈⠒⠊⠉⠁⠀⠈⠉⠑⠚⠀⠀⣀⠔⢊⣠⠤⠒⠊⠉⠀⡜
⠀⠀⠀⠀⠀⠀⠀⡽⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠩⡔⠊⠁⠀⠀⠀⠀⠀⠀⠇
⠀⠀⠀⠀⠀⠀⠀⡇⢠⡤⢄⠀⠀⠀⠀⠀⡠⢤⣄⠀⡇⠀⠀⠀⠀⠀⠀⠀⢰⠀
⠀⠀⠀⠀⠀⠀⢀⠇⠹⠿⠟⠀⠀⠤⠀⠀⠻⠿⠟⠀⣇⠀⠀⡀⠠⠄⠒⠊⠁⠀
⠀⠀⠀⠀⠀⠀⢸⣿⣿⡆⠀⠰⠤⠖⠦⠴⠀⢀⣶⣿⣿⠀⠙⢄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢻⣿⠃⠀⠀⠀⠀⠀⠀⠀⠈⠿⡿⠛⢄⠀⠀⠱⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⠈⠓⠦⠀⣀⣀⣀⠀⡠⠴⠊⠹⡞⣁⠤⠒⠉⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⠃⠀⠀⠀⠀⡌⠉⠉⡤⠀⠀⠀⠀⢻⠿⠆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠰⠁⡀⠀⠀⠀⠀⢸⠀⢰⠃⠀⠀⠀⢠⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢶⣗⠧⡀⢳⠀⠀⠀⠀⢸⣀⣸⠀⠀⠀⢀⡜⠀⣸⢤⣶⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠈⠻⣿⣦⣈⣧⡀⠀⠀⢸⣿⣿⠀⠀⢀⣼⡀⣨⣿⡿⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠻⠿⠿⠓⠄⠤⠘⠉⠙⠤⢀⠾⠿⣿⠟⠋
EOF

    [ -f "$ZSHRC_FILE" ] && cp "$ZSHRC_FILE" "${ZSHRC_FILE}.backup" 2>/dev/null

    cat > "$ZSHRC_FILE" << 'ZSHRC_EOF'

[ -f ~/.termux-pro/config ] && source ~/.termux-pro/config
[ -f ~/.termux-pro/colors ] && source ~/.termux-pro/colors

autoload -U colors && colors
setopt PROMPT_SUBST

if [ -f ~/.termux-pro/config ]; then
    CONFIG_CONTENT=$(cat ~/.termux-pro/config)
    DISPLAY_USER=$(echo "$CONFIG_CONTENT" | grep '^USERNAME=' | head -1 | sed 's/USERNAME=//;s/^"//;s/"$//')
    DISPLAY_HOST=$(echo "$CONFIG_CONTENT" | grep '^HOST=' | head -1 | sed 's/HOST=//;s/^"//;s/"$//')
    ASCII_ART_NUM=$(echo "$CONFIG_CONTENT" | grep '^ASCII_ART=' | head -1 | sed 's/ASCII_ART=//;s/^"//;s/"$//')
    ASCII_COLOR_NUM=$(echo "$CONFIG_CONTENT" | grep '^ASCII_COLOR=' | head -1 | sed 's/ASCII_COLOR=//;s/^"//;s/"$//')
else
    DISPLAY_USER="user"
    DISPLAY_HOST="localhost"
    ASCII_ART_NUM="1"
    ASCII_COLOR_NUM="6"
fi

COLOR_BRACKET="${COLOR_BRACKET:-cyan}"
COLOR_USER="${COLOR_USER:-green}"
COLOR_HOST="${COLOR_HOST:-yellow}"
COLOR_PATH="${COLOR_PATH:-blue}"
COLOR_BATTERY="${COLOR_BATTERY:-magenta}"
COLOR_PING="${COLOR_PING:-red}"
COLOR_IP="${COLOR_IP:-green}"
COLOR_TIME="${COLOR_TIME:-white}"
COLOR_ARROW="${COLOR_ARROW:-cyan}"

_get_battery() {
    local raw
    raw=$(termux-battery-status 2>/dev/null)
    if [ -z "$raw" ]; then
        echo "?"
        return
    fi
    echo "$raw" | python3 -c "
import sys, json
try:
    d = json.load(sys.stdin)
    print(d.get('percentage', '?'))
except:
    print('?')
" 2>/dev/null || echo "?"
}

_get_ping() {
    local result
    result=$(ping -c 1 -W 1 8.8.8.8 2>/dev/null)
    if [ $? -ne 0 ] || [ -z "$result" ]; then
        echo "?"
        return
    fi
    echo "$result" | awk -F'time=' '{if(NF>1) {split($2,a," "); printf "%d", a[1]}}' 2>/dev/null || echo "?"
}

_get_ip() {
    local ip
    ip=$(ip -4 addr show 2>/dev/null | awk '/inet / && !/127.0.0.1/ {split($2,a,"/"); print a[1]; exit}')
    if [ -z "$ip" ]; then
        ip=$(ifconfig 2>/dev/null | awk '/inet / && !/127.0.0.1/ {print $2; exit}' | sed 's/addr://')
    fi
    echo "${ip:-no-ip}"
}

_get_mac() {
    local mac
    mac=$(ip link 2>/dev/null | awk '/ether/ {print $2; exit}')
    if [ -z "$mac" ]; then
        mac=$(ifconfig 2>/dev/null | awk '/ether/ {print $2; exit}')
    fi
    if [ -z "$mac" ]; then
        mac=$(cat /sys/class/net/wlan0/address 2>/dev/null)
    fi
    echo "${mac:-??:??:??:??:??:??}"
}

_show_ascii_art() {
    local art_num="${ASCII_ART_NUM:-1}"
    local color_num="${ASCII_COLOR_NUM:-6}"
    local art_file="$HOME/.termux-pro/ascii/art${art_num}.txt"
    

    local color_code=""
    case "$color_num" in
        1) color_code="31" ;;  
        2) color_code="32" ;;  
        3) color_code="33" ;;  
        4) color_code="34" ;;  
        5) color_code="35" ;;  
        6) color_code="36" ;;  
        7) color_code="37" ;;  
        *) color_code="36" ;;
    esac
    
    echo ""
    if [ -f "$art_file" ]; then

        while IFS= read -r line; do
            printf "\033[${color_code}m%s\033[0m\n" "$line"
        done < "$art_file"
    else
        printf "\033[${color_code}mTERMUX PRO\033[0m\n"
    fi
    echo ""
}

_zsh_color() {
    local c="$1"
    case "$c" in
        bright_red)     echo '%B%F{red}'     ;;
        bright_green)   echo '%B%F{green}'   ;;
        bright_yellow)  echo '%B%F{yellow}'  ;;
        bright_blue)    echo '%B%F{blue}'    ;;
        bright_magenta) echo '%B%F{magenta}' ;;
        bright_cyan)    echo '%B%F{cyan}'    ;;
        bright_white)   echo '%B%F{white}'   ;;
        *)              echo "%F{$c}"        ;;
    esac
}

_update_prompt_vars() {
    export BATTERY=$(_get_battery)
    export PING_MS=$(_get_ping)
    export IP_ADDR=$(_get_ip)
    export CURRENT_TIME=$(date +%H:%M:%S)
    [ -f ~/.termux-pro/colors ] && source ~/.termux-pro/colors
    COLOR_BRACKET="${COLOR_BRACKET:-cyan}"
    COLOR_USER="${COLOR_USER:-green}"
    COLOR_HOST="${COLOR_HOST:-yellow}"
    COLOR_PATH="${COLOR_PATH:-blue}"
    COLOR_BATTERY="${COLOR_BATTERY:-magenta}"
    COLOR_PING="${COLOR_PING:-red}"
    COLOR_IP="${COLOR_IP:-green}"
    COLOR_TIME="${COLOR_TIME:-white}"
    COLOR_ARROW="${COLOR_ARROW:-cyan}"
}

_build_prompt() {
    local cb=$(_zsh_color "${COLOR_BRACKET:-cyan}")
    local cu=$(_zsh_color "${COLOR_USER:-green}")
    local ch=$(_zsh_color "${COLOR_HOST:-yellow}")
    local cp=$(_zsh_color "${COLOR_PATH:-blue}")
    local cbat=$(_zsh_color "${COLOR_BATTERY:-magenta}")
    local cping=$(_zsh_color "${COLOR_PING:-red}")
    local cip=$(_zsh_color "${COLOR_IP:-green}")
    local ct=$(_zsh_color "${COLOR_TIME:-white}")
    local reset='%b%f'

    PROMPT="${cb}┌─[${cu}${DISPLAY_USER}${cb}@${ch}${DISPLAY_HOST}${cb}]─[${cp}%~${cb}]${reset}
${cb}└─[${cbat}🔋${BATTERY}%%${cb}|${cping}📶${PING_MS}ms${cb}|${cip}🌐${IP_ADDR}${cb}|${ct}⏰${CURRENT_TIME}${cb}]${reset} %(?.%F{green}.%F{red})➤%f "
}

precmd() {
    _update_prompt_vars
    _build_prompt
}

_build_prompt

if [ -z "$TERMUX_PRO_LOADED" ]; then
    export TERMUX_PRO_LOADED=1
    clear
    _show_ascii_art
    echo -e "\033[1;32m✨ Welcome \033[1;33m${DISPLAY_USER}\033[1;32m!\033[0m"
    echo -e "\033[1;36m📊 Type \033[1;33mdashboard\033[1;36m for control panel\033[0m"
    echo -e "\033[1;36m❓ Type \033[1;33mhelpme\033[1;36m for commands\033[0m"
    echo ""
fi

dashboard() {
    bash ~/.termux-pro/main.sh dashboard
}

helpme() {
    echo ""
    echo -e "\033[1;36m══════════════════ COMMANDS ══════════════════\033[0m"
    echo ""
    echo -e "\033[1;33m📊 MAIN:\033[0m"
    echo "  dashboard     → Control panel"
    echo "  helpme        → Ye menu"
    echo "  update        → Packages update"
    echo ""
    echo -e "\033[1;33m📱 INFO:\033[0m"
    echo "  battery       → Battery status"
    echo "  myip          → IP address"
    echo "  mymac         → MAC address(root required)"
    echo "  pingtest      → Ping test"
    echo "  sysinfo       → System info"
    echo "  vars          → Live variables dekho"
    echo ""
    echo -e "\033[1;33m🛠️ UTILITIES:\033[0m"
    echo "  cls / clear   → Screen saaf"
    echo "  ll            → Files list"
    echo "  uninstall-pro → Remove karo"
    echo ""
    echo -e "\033[1;36m═══════════════════════════════════════════════\033[0m"
    echo ""
}

battery() {
    echo ""
    echo -e "\033[1;36mBattery Status:\033[0m"
    local raw
    raw=$(termux-battery-status 2>/dev/null)
    if [ -n "$raw" ]; then
        echo "$raw" | python3 -c "
import sys, json
try:
    d = json.load(sys.stdin)
    print(f'  Percentage : {d.get(\"percentage\",\"?\")}%')
    print(f'  Status     : {d.get(\"status\",\"?\")}')
    print(f'  Plugged    : {d.get(\"plugged\",\"?\")}')
    print(f'  Health     : {d.get(\"health\",\"?\")}')
    print(f'  Temperature: {d.get(\"temperature\",\"?\")}°C')
except Exception as e:
    print('Parse error:', e)
" 2>/dev/null
    else
        echo "  termux-api install nahi hai"
    fi
    echo ""
}

myip() {
    echo ""
    echo -e "\033[1;36mIP Addresses:\033[0m"
    local local_ip
    local_ip=$(_get_ip)
    echo -e "  Local IP  : \033[0;32m${local_ip}\033[0m"
    echo -n "  Public IP : "
    local pub
    pub=$(curl -s --max-time 5 ifconfig.me 2>/dev/null)
    echo -e "\033[0;32m${pub:-No internet}\033[0m"
    echo ""
}

mymac() {
    echo ""
    echo -e "\033[1;36mMAC Address:\033[0m"
    local mac
    mac=$(_get_mac)
    echo -e "  \033[0;32m${mac}\033[0m"
    echo ""
}

pingtest() {
    echo ""
    echo -e "\033[1;36mPing Test (8.8.8.8):\033[0m"
    ping -c 4 8.8.8.8
    echo ""
}

vars() {
    echo ""
    _update_prompt_vars
    echo -e "\033[1;36mLive Variable Values:\033[0m"
    echo "  USERNAME     : $DISPLAY_USER"
    echo "  HOST         : $DISPLAY_HOST"
    echo "  BATTERY      : ${BATTERY}%"
    echo "  PING         : ${PING_MS}ms"
    echo "  IP           : $IP_ADDR"
    echo "  CURRENT_TIME : $CURRENT_TIME"
    echo ""
}

sysinfo() {
    echo ""
    echo -e "\033[1;36mSystem Information:\033[0m"
    _update_prompt_vars
    echo "  Username    : $DISPLAY_USER"
    echo "  Hostname    : $DISPLAY_HOST"
    echo "  Android     : $(getprop ro.build.version.release 2>/dev/null || echo 'Unknown')"
    echo "  Device      : $(getprop ro.product.model 2>/dev/null || echo 'Unknown')"
    echo "  Battery     : ${BATTERY}%"
    echo "  IP (Local)  : $IP_ADDR"
    echo "  Ping        : ${PING_MS}ms"
    echo "  Storage     : $(df -h /data 2>/dev/null | awk 'NR==2 {print $4}') free"
    echo "  Kernel      : $(uname -r)"
    echo "  ZSH         : $ZSH_VERSION"
    echo ""
}

alias update="pkg update -y && pkg upgrade -y"
alias cls="clear"
alias ll="ls -la --color=auto"
alias la="ls -la --color=auto"
alias uninstall-pro="bash ~/.termux-pro/main.sh uninstall"

ZSHRC_EOF

    cp "$0" "$CONFIG_DIR/main.sh"
    chmod +x "$CONFIG_DIR/main.sh"

    chsh -s zsh > /dev/null 2>&1

    clear
    echo ""
    print_status "INSTALLATION COMPLETE!"
    echo ""
    echo -e "${GREEN}Ab ye steps karo:${NC}"
    echo ""
    echo "  1. Type karo:  exit"
    echo "  2. Termux band karo"
    echo "  3. Termux dobara kholo"
    echo "  4. Type karo:  zsh"
    echo ""
    echo -e "${CYAN}DEVELOPER:${NC}"
    echo "  • t.me@cxqok"
    echo "  • github @cxqok"
    echo ""
}

_color_menu() {
    local COLOR_FILE="$HOME/.termux-pro/colors"

    while true; do
        clear
        [ -f "$COLOR_FILE" ] && source "$COLOR_FILE"
        echo -e "${CYAN}"
        echo "╔══════════════════════════════════════╗"
        echo "║      🎨 COLOR CUSTOMIZATION          ║"
        echo "╚══════════════════════════════════════╝"
        echo -e "${NC}"
        
        echo -e "${GREEN}Current Colors:${NC}"
        echo "  ┌────────────────────────────────────────┐"
        printf "  │ Brackets    : %-15s │\n" "${COLOR_BRACKET:-cyan}"
        printf "  │ Username    : %-15s │\n" "${COLOR_USER:-green}"
        printf "  │ Hostname    : %-15s │\n" "${COLOR_HOST:-yellow}"
        printf "  │ Path        : %-15s │\n" "${COLOR_PATH:-blue}"
        printf "  │ Battery     : %-15s │\n" "${COLOR_BATTERY:-magenta}"
        printf "  │ Ping        : %-15s │\n" "${COLOR_PING:-red}"
        printf "  │ IP Address  : %-15s │\n" "${COLOR_IP:-green}"
        printf "  │ Time        : %-15s │\n" "${COLOR_TIME:-white}"
        echo "  └────────────────────────────────────────┘"
        echo ""
        echo -e "${YELLOW}Select element to change:${NC}"
        echo "  1) Brackets    [  ]"
        echo "  2) Username"
        echo "  3) Hostname"
        echo "  4) Path"
        echo "  5) Battery 🔋"
        echo "  6) Ping 📶"
        echo "  7) IP Address 🌐"
        echo "  8) Time ⏰"
        echo "  9) Reset to defaults"
        echo "  0) Back"
        echo ""
        read -p "Select [0-9]: " copt

        case $copt in
            1) _pick_color "Brackets" "COLOR_BRACKET" "$COLOR_FILE" ;;
            2) _pick_color "Username" "COLOR_USER" "$COLOR_FILE" ;;
            3) _pick_color "Hostname" "COLOR_HOST" "$COLOR_FILE" ;;
            4) _pick_color "Path" "COLOR_PATH" "$COLOR_FILE" ;;
            5) _pick_color "Battery" "COLOR_BATTERY" "$COLOR_FILE" ;;
            6) _pick_color "Ping" "COLOR_PING" "$COLOR_FILE" ;;
            7) _pick_color "IP" "COLOR_IP" "$COLOR_FILE" ;;
            8) _pick_color "Time" "COLOR_TIME" "$COLOR_FILE" ;;
            9)
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
                print_status "Colors reset ho gaye!"
                sleep 1
                ;;
            0) break ;;
            *) print_error "Galat option"; sleep 1 ;;
        esac
    done
}

_pick_color() {
    local element_name="$1"
    local color_var="$2"
    local color_file="$3"
    
    echo ""
    echo -e "${CYAN}${element_name} color choose karo:${NC}"
    echo ""
    echo "  ┌────────────────────────────────────────────────────┐"
    echo "  │  1) ██████ black         2) ██████ red            │"
    echo "  │  3) ██████ green         4) ██████ yellow         │"
    echo "  │  5) ██████ blue          6) ██████ magenta        │"
    echo "  │  7) ██████ cyan          8) ██████ white          │"
    echo "  │  9) ██████ bright_red   10) ██████ bright_green   │"
    echo "  │ 11) ██████ bright_yellow12) ██████ bright_blue    │"
    echo "  │ 13) ██████ bright_magenta14) ██████ bright_cyan   │"
    echo "  │ 15) ██████ bright_white                           │"
    echo "  └────────────────────────────────────────────────────┘"
    echo ""
    read -p "  Number select karo [1-15]: " num
    
    local new_color=""
    case $num in
        1) new_color="black" ;;
        2) new_color="red" ;;
        3) new_color="green" ;;
        4) new_color="yellow" ;;
        5) new_color="blue" ;;
        6) new_color="magenta" ;;
        7) new_color="cyan" ;;
        8) new_color="white" ;;
        9) new_color="bright_red" ;;
        10) new_color="bright_green" ;;
        11) new_color="bright_yellow" ;;
        12) new_color="bright_blue" ;;
        13) new_color="bright_magenta" ;;
        14) new_color="bright_cyan" ;;
        15) new_color="bright_white" ;;
        *) echo "" ;;
    esac
    
    if [ -n "$new_color" ]; then
        sed -i "s/^${color_var}=.*/${color_var}=\"${new_color}\"/" "$color_file"
        source "$color_file" 2>/dev/null
        print_status "${element_name} color update ho gaya! Type 'zsh' to see effect"
        sleep 1
    fi
}

_ascii_art_menu() {
    while true; do
        clear
        [ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"
        echo -e "${CYAN}"
        echo "╔══════════════════════════════════════╗"
        echo "║      🖼️  ASCII ART SETTINGS          ║"
        echo "╚══════════════════════════════════════╝"
        echo -e "${NC}"
        echo -e "${GREEN}Current Art: ${ASCII_ART:-1}${NC}"
        echo -e "${GREEN}Current Art Color: ${ASCII_COLOR:-6}${NC}"
        echo ""
        echo "  ART STYLES:"
        echo "  1) HACKER1      2) HACKER2      3) LINUX"
        echo "  4) ARCH       5) DRAGON       6) KALI"
        echo "  7) BUTTERFLY       8) PIKACHU"
        echo ""
        echo "  ART COLORS:"
        echo " 11) Red          12) Green        13) Yellow"
        echo " 14) Blue         15) Magenta      16) Cyan"
        echo " 17) White"
        echo ""
        echo "  0) Back"
        echo ""
        read -p "Select [0-17]: " aopt

        case $aopt in
            [1-8])
                sed -i "s/^ASCII_ART=.*/ASCII_ART=\"$aopt\"/" "$CONFIG_FILE"
                print_status "Art changed to option $aopt! Type 'zsh' to see effect"
                sleep 1
                ;;
            11|12|13|14|15|16|17)
                local color_val=$((aopt - 10))
                sed -i "s/^ASCII_COLOR=.*/ASCII_COLOR=\"$color_val\"/" "$CONFIG_FILE"
                print_status "Art color changed! Type 'zsh' to see effect"
                sleep 1
                ;;
            0) break ;;
            *) print_error "Galat option"; sleep 1 ;;
        esac
    done
}

dashboard() {
    [ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"

    while true; do
        clear
        echo -e "${CYAN}"
        echo "╔══════════════════════════════════════╗"
        echo "║        TERMUX PRO DASHBOARD          ║"
        echo "╚══════════════════════════════════════╝"
        echo -e "${NC}"

        LIVE_BAT=$(termux-battery-status 2>/dev/null | python3 -c "
import sys,json
try: print(json.load(sys.stdin).get('percentage','?'))
except: print('?')
" 2>/dev/null)

        LIVE_PING=$(ping -c 1 -W 1 8.8.8.8 2>/dev/null | \
            awk -F'time=' '{if(NF>1){split($2,a," "); printf "%d",a[1]}}')
        [ -z "$LIVE_PING" ] && LIVE_PING="?"

        LIVE_IP=$(ip -4 addr show 2>/dev/null | \
            awk '/inet / && !/127.0.0.1/ {split($2,a,"/"); print a[1]; exit}')
        [ -z "$LIVE_IP" ] && LIVE_IP="No IP"

        echo -e "${GREEN}📊 Live Status:${NC}"
        echo "  Username     :  ${USERNAME:-Not set}"
        echo "  Hostname     :  ${HOST:-Not set}"
        echo "  Time         :  $(date '+%H:%M:%S')"
        echo "  Battery      :  ${LIVE_BAT:-?}%"
        echo "  IP           :  $LIVE_IP"
        echo "  Ping         :  ${LIVE_PING}ms"
        echo "  ASCII Art    :  ${ASCII_ART:-1}"
        echo "  ASCII Color  :  ${ASCII_COLOR:-6}"
        echo ""
        echo -e "${YELLOW}⚙️ Options:${NC}"
        echo "  1) Username change karo"
        echo "  2) Hostname change karo"
        echo "  3) 🎨 Colors customize karo"
        echo "  4) 🖼️  ASCII Art settings"
        echo "  5) Components test karo"
        echo "  6) Reinstall"
        echo "  7) Exit"
        echo ""
        read -p "Select [1-7]: " opt

        case $opt in
            1)
                echo ""
                read -p "Naya username: " new_name
                if [ -n "$new_name" ]; then
                    sed -i "s/^USERNAME=.*/USERNAME=\"$new_name\"/" "$CONFIG_FILE"
                    print_status "Username badal gaya: $new_name"
                    print_warning "Restart zsh: Type 'exit' then 'zsh'"
                    sleep 2
                fi
                ;;
            2)
                echo ""
                read -p "Naya hostname: " new_host
                if [ -n "$new_host" ]; then
                    sed -i "s/^HOST=.*/HOST=\"$new_host\"/" "$CONFIG_FILE"
                    print_status "Hostname badal gaya: $new_host"
                    print_warning "Restart zsh: Type 'exit' then 'zsh'"
                    sleep 2
                fi
                ;;
            3)
                _color_menu
                ;;
            4)
                _ascii_art_menu
                ;;
            5)
                echo ""
                print_info "Testing..."
                echo -n "  • Battery API : "
                termux-battery-status 2>/dev/null | python3 -c "import sys,json; json.load(sys.stdin)" 2>/dev/null \
                    && echo -e "${GREEN}✓ Working${NC}" || echo -e "${RED}✗ Not available${NC}"
                echo -n "  • Network     : "
                ping -c 1 -W 1 8.8.8.8 > /dev/null 2>&1 \
                    && echo -e "${GREEN}✓ Connected${NC}" || echo -e "${RED}✗ No connection${NC}"
                echo ""
                read -p "Enter dabao..."
                ;;
            6)
                echo ""
                print_warning "Ye sab reinstall karega"
                read -p "Pakka? (y/N): " confirm
                [[ $confirm == [yY] ]] && uninstall_system && install_system && exit 0
                ;;
            7)
                print_info "Dashboard band ho raha hai..."
                exit 0
                ;;
            *)
                print_error "Galat option"
                sleep 1
                ;;
        esac
    done
}

uninstall_system() {
    clear
    echo -e "${RED}"
    echo "╔══════════════════════════════════════╗"
    echo "║        TERMUX PRO UNINSTALL          ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${NC}"

    read -p "Termux Pro hata doon? (y/N): " confirm
    if [[ $confirm == [yY] ]]; then
        print_info "Files remove ho rahi hain..."
        rm -rf "$CONFIG_DIR"

        if [ -f "${ZSHRC_FILE}.backup" ]; then
            mv "${ZSHRC_FILE}.backup" "$ZSHRC_FILE"
            print_status "Purana config restore ho gaya"
        else
            cat > "$ZSHRC_FILE" << 'EOF'

PS1='%F{green}%n@%m%f %F{blue}%~%f %(?.%F{green}.%F{red})%#%f '
alias ll='ls -la'
alias cls='clear'
EOF
            print_status "Default config bana diya"
        fi

        chsh -s bash > /dev/null 2>&1
        echo ""
        print_status "Termux Pro hata diya gaya!"
        echo ""
    else
        print_info "Cancel kar diya"
    fi
}

case "$1" in
    dashboard) dashboard ;;
    uninstall) uninstall_system ;;
    help|--help|-h)
        echo ""
        echo "Termux Pro Enhanced Installer"
        echo "Usage:"
        echo "  bash termux-pro.sh           → Install"
        echo "  bash termux-pro.sh dashboard → Dashboard"
        echo "  bash termux-pro.sh uninstall → Remove"
        echo ""
        ;;
    *)
        if [ -f "$CONFIG_FILE" ]; then
            echo -e "${YELLOW}⚠️ Pehle se installed hai!${NC}"
            echo ""
            read -p "Dashboard kholoon? (Y/n): " open_dash
            [[ $open_dash != [Nn] ]] && dashboard || echo -e "Type '${GREEN}zsh${NC}' phir '${GREEN}dashboard${NC}'"
        else
            install_system
        fi
        ;;
esac