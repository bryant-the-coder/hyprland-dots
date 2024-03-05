wallpapers="~/Pictures/"

list_wallpapers() {
    for file in "$1"/*
    do
        if [[ -f "$file" ]]; then
            echo -en "$(basename "$file")\0icon\x1f$(realpath "$file")\n"
        fi
    done
}

selected_wallpaper="$(list_wallpapers "''${wallpapers}" |  rofi -dmenu -theme ~/.config/rofi/launchers/type-4/style-1.rasi -p " ")"

icon="''${wallpapers}""''${selected_wallpaper}"

if [[ -f "$selected_wallpaper" ]]; then
    exit 0;
fi

swww img "''${wallpapers}""''${selected_wallpaper}" && dunstify -u low --replace=69 -i "''${icon}" "Wallpaper Changed"
