import re
from pathlib import Path

# Configuration for NVIM and Alacritty
CONFIGS = [
    dict(
        file=Path.home() / ".config/nvim/init.lua",
        pattern=r'vim\.o\.background\s*=\s*"(light|dark)"\s*--\s*theme-color',
        replacement=("light", "dark"),
        match_group=1,
    ),
    dict(
        file=Path.home() / ".config/alacritty/alacritty.toml",
        pattern=r'(import\s*=\s*\["~/.config/alacritty/)(konsole_linux|gruvbox_light)(\.toml"\])\s*#\s*theme-color',
        replacement=("konsole_linux", "gruvbox_light"),
        match_group=2,
    ),
]


def read_file(config: dict) -> list[str]:
    if file := config.get("file"):
        with open(file, "r") as _file:
            return _file.readlines()
    else:
        raise ValueError("File not found in configuration")


def parse_and_togle(config: dict) -> None:
    _match_group = config.get("match_group", 0)
    _repl = config.get("replacement")
    if not _repl:
        raise ValueError("Replacement not found in configuration.")

    _pattern = config.get("pattern")
    if not _pattern:
        raise ValueError("Pattern not found in configuration.")

    with open(config["file"], "w") as _file:
        for line in lines:
            if match := re.search(_pattern, line):
                current_value = match.group(_match_group)
                line = line.replace(
                    current_value,
                    _repl[0] if current_value == _repl[1] else _repl[1],
                )
            _file.write(line)


if __name__ == "__main__":
    for config in CONFIGS:
        lines = read_file(config)
        parse_and_togle(config)
