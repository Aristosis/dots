#!/usr/bin/env python3
import os
import subprocess

files = subprocess.check_output(
    ["fd", "--type", "f"], cwd=os.path.expanduser("~/HDD/Music/")
).decode("utf-8").splitlines()

pretty_names = {os.path.splitext(os.path.basename(f))[0]: f for f in files}

fuzzel = subprocess.Popen(
    ["fuzzel", "--dmenu", "--width=60", "--lines=20"],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
)
pretty_list = "\n".join(pretty_names.keys())
stdout, _ = fuzzel.communicate(pretty_list.encode())
selection = stdout.decode("utf-8").strip()

full_path = pretty_names.get(selection)

if full_path:
    print(full_path)
    subprocess.run(["mpc", "add", full_path])
else:
    print("No selection or not found.")

