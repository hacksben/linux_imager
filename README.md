# Linux Imager

Portable Linux AppImage Builder

Linux Imager is a lightweight utility for packaging a Linux application into a portable AppImage using AppImageTool. It is designed for developers who want to create self-contained Linux executables from a structured AppDir without a traditional installation process.

## Features

- creates AppImage packages from a structured AppDir
- supports custom desktop metadata
- uses a launcher script and desktop file for execution
- produces portable Linux executables
- simplifies packaging for desktop utility applications

## Project Structure

```bash
linux_imager/
├── build.sh
├── appimagetool-x86_64.AppImage
├── MyProject.AppDir/
│   ├── AppRun
│   ├── myapp.desktop
│   ├── main.sh
│   ├── icon.svg
│   └── usr/
│       └── bin/
│           └── launcher.sh
├── README.md
└── LICENSE
```

## How It Works

The tool packages every required file into a Linux AppDir structure. This includes:

- `AppRun` — startup launcher
- `myapp.desktop` — application metadata such as name, icon, and execution target
- `main.sh` — the actual application logic
- `icon.svg` — app icon
- runtime files in `usr/bin` or related folders

Once the AppDir is ready, `build.sh` executes `appimagetool` to produce the final `.AppImage`.

## Build Script

```bash
#!/usr/bin/env bash
set -euo pipefail

APPDIR="${1:-MyProject.AppDir}"
APPIMAGE_TOOL="${APPIMAGE_TOOL:-./appimagetool-x86_64.AppImage}"

if [ ! -f "$APPIMAGE_TOOL" ]; then
  echo "[ERROR] AppImage tool not found: $APPIMAGE_TOOL"
  exit 1
fi

if [ ! -d "$APPDIR" ]; then
  echo "[ERROR] AppDir not found: $APPDIR"
  exit 1
fi

chmod +x "$APPDIR/AppRun"
chmod +x "$APPDIR/main.sh"

"$APPIMAGE_TOOL" "$APPDIR"
```

## Build Process

```bash
chmod +x build.sh
./build.sh
```

This generates a portable AppImage from the AppDir.

## Example Desktop Entry

```ini
[Desktop Entry]
Type=Application
Name=My Project
Exec=main.sh
Icon=icon
Terminal=true
Categories=Utility;
```

## Requirements

- Linux environment
- Bash shell
- AppImageTool support
- executable permissions for scripts
- proper AppDir structure

## Usage

1. Create your application files inside `MyProject.AppDir`
2. Add the correct launcher script
3. Add the desktop entry metadata
4. Run:

```bash
./build.sh
```

5. Share the generated `.AppImage`

## Typical Use Cases

- packaging Linux desktop utilities
- distributing portable software without installation
- creating self-contained app bundles
- testing and shipping custom Linux tools

## Author

MANDEEP PARMAR

GitHub: https://github.com/hacksben  
LinkedIn: https://www.linkedin.com/in/mandeep-parmar-b73a54381  
Email: sparmar28332@gmail.com

## License

This project is intended for legitimate Linux packaging and distribution use. Ensure that you comply with all applicable licensing and system requirements for the software you package.
