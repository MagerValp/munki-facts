#!/usr/bin/env -S uv run --python cpython@3.14 --script
# /// script
# dependencies = [
# ]
# [tool.uv]
# exclude-newer = "7 days"
# ///


"""

A small tool to extract the supported device models from a macOS installer app.
Mount the SharedSupport.dmg image from inside the installer before running.

# Version History

## 0.1

* Initial prototype

"""


import sys
import argparse
import plistlib


def die(msg, code=1) -> Never:
    print(msg, file=sys.stderr)
    sys.exit(code)


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--version", action="store_true", help="Print version number")
    args = p.parse_args(argv[1:])
    
    if args.version:
        print(__version__)
        return 0

    try:
        with open("/Volumes/Shared Support/com_apple_MobileAsset_MacSoftwareUpdate/com_apple_MobileAsset_MacSoftwareUpdate.xml", "rb") as f:
            p = plistlib.load(f)
    except FileNotFoundError:
        die("Unable to open com_apple_MobileAsset_MacSoftwareUpdate.xml, SharedSupport.dmg not mounted?")
    except plistlib.InvalidFileException:
        die("Unable to read com_apple_MobileAsset_MacSoftwareUpdate.xml, not a valid plist?")

    models = []
    for asset in p["Assets"]:
        models.extend(asset["SupportedDeviceModels"])

    for model in sorted(models[:-1]):
        print(f"    {model} | \\")
    print(f"    {models[-1]})")
    
    return 0


if __name__ == '__main__':
    if isinstance(__doc__, str):
        for line in __doc__.splitlines():
            if line.startswith("## "):
                __version__ = line[3:].rstrip()

    status = 1
    if sys.__stdout__ is not None and sys.__stdout__.isatty():
        import traceback
        import pdb
        try:
            status = main(sys.argv)
        except:
            type, value, tb = sys.exc_info()
            if type is not SystemExit:
                traceback.print_exc()
                pdb.post_mortem(tb)
    else:
        status = main(sys.argv)
    sys.exit(status)
