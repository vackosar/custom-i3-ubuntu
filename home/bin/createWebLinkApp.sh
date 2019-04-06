#!/bin/sh -xue
url="$1";
if [ "$#" = "1" ]; then
        name="$(echo "$url" |sed -e 's|https://||;s|http://||;s|\.[^.]\+$||;')";
elif [ "$#" = "2" ]; then
        name="$2";
else
        echo 'Too many arguments. Usage: url [name]';
        exit 1;
fi
command="$HOME/bin/$name";
cat - > "$command" <<END
#!/bin/sh -ue
chromium-browser --class "$name" -user-data-dir="$HOME/.config/$name" --app="$url";
END
chmod u+x "$command";
desktopFile="$HOME/.local/share/applications/$name.desktop";
cat - > "$desktopFile" <<END
[Desktop Entry]
Version=1.0
Type=Application
Name=$name
GenericName=$name
#Icon="$HOME/.local/share/icons/$name.svg"
Exec="$command"
Terminal=false
END
