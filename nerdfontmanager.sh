#!/bin/bash

FONT_DIR="$HOME/.local/share/fonts/NerdFonts"
BASE_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download"
AVAILABLE_FONTS=("JetBrainsMono" "FiraCode" "Hack" "Meslo" "SourceCodePro" "UbuntuMono")

print_help() {
    echo "Usage: nerdfontinstaller [OPTION] [FontName]"
    echo ""
    echo "Options:"
    echo "  -i FONT    Install the specified Nerd Font"
    echo "  -r FONT    Remove the specified Nerd Font"
    echo "  -l         List available fonts"
    echo "  -h         Show this help message"
    echo ""
    echo "Example:"
    echo "  nerdfontinstaller -i FiraCode"
}

list_fonts() {
    echo "Available Nerd Fonts:"
    for font in "${AVAILABLE_FONTS[@]}"; do
        echo "  $font"
    done
}

install_font() {
    FONT="$1"
    ZIP_NAME="${FONT}.zip"

    if [[ ! " ${AVAILABLE_FONTS[*]} " =~ " ${FONT} " ]]; then
        echo "❌ Font '$FONT' is not in the available font list."
        exit 1
    fi

    echo "📥 Installing $FONT Nerd Font..."
    mkdir -p "$FONT_DIR/$FONT"
    curl -Lo "$ZIP_NAME" "$BASE_URL/$ZIP_NAME"
    unzip -o "$ZIP_NAME" -d "$FONT_DIR/$FONT"
    rm "$ZIP_NAME"
    fc-cache -fv "$FONT_DIR"
    echo "✅ Installed $FONT to $FONT_DIR/$FONT"
}

remove_font() {
    FONT="$1"
    TARGET_DIR="$FONT_DIR/$FONT"
    if [ -d "$TARGET_DIR" ]; then
        echo "🗑 Removing $FONT..."
        rm -rf "$TARGET_DIR"
        fc-cache -fv "$FONT_DIR"
        echo "✅ Removed $FONT"
    else
        echo "❌ Font '$FONT' not found in $FONT_DIR"
    fi
}

# Parse arguments
if [ $# -eq 0 ]; then
    print_help
    exit 0
fi

while getopts "i:r:lh" opt; do
    case "$opt" in
        i) install_font "$OPTARG" ;;
        r) remove_font "$OPTARG" ;;
        l) list_fonts ;;
        h) print_help ;;
        *) print_help; exit 1 ;;
    esac
done
