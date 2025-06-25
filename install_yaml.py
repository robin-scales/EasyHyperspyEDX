"""
This code is from the following
https://stackoverflow.com/a/73527968/27490879"""

import os
import yaml

with open("hyperspy_rjs_env.yaml") as file_handle:
    environment_data = yaml.safe_load(file_handle)

for dependency in environment_data["dependencies"]:
    if isinstance(dependency, dict):
      for lib in dependency['pip']:
        os.system(f"pip install {lib}")