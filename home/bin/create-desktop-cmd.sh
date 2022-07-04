#!/bin/sh -xue

if [ "$#" = "2" ]; then
    name="$1";
    cmd="$2";
else
    echo 'Invalid input. This scription creates desktop executable files. Usage: [name] [command string]';
    exit 1;
fi

path="$HOME/bin/$name";
cat - > "$path" <<END
#!/bin/sh -ue
$cmd
END
chmod u+x "$path";

desktopFile="$HOME/.local/share/applications/$name.desktop";
cat - > "$desktopFile" <<END
[Desktop Entry]
Version=1.0
Type=Application
Name=$name
GenericName=$name
#Icon="$HOME/.local/share/icons/$name.svg"
Exec="$cmd"
Terminal=false
END
