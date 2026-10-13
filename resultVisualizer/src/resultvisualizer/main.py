
#standard library imports:
import json
import os
import sys

from resultvisualizer import visualizer

#my own project imports:
from . import parser

directory = sys.argv[1]

count = 0

file_pathnames = []

for root, directories, files in os.walk(directory):
  for file in files:
    if file.endswith('.json'):
      file_pathnames.append(os.path.join(root, file))
      count = count + 1

print("The number of files found is: ", count)

json_data = []
results = []

for file in file_pathnames:
  print(file)
  with open(file, 'r') as json_file:
    json_data.append(json.load(json_file))
    results.append(parser.parse_results(json_data[(file_pathnames.index(file))]))

visualizer.visualize(results)
