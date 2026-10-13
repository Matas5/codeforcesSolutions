
from resultvisualizer.models import BenchmarkResult


command_name = None
run_times = []
run_memory = []
number_of_runs = 0

def parse_results(json_data) -> BenchmarkResult:
  result = BenchmarkResult(
    command_name=json_data["results"][0]["command"],
    duration=json_data["results"][0]["times"],
    memory=json_data["results"][0]["memory_usage_byte"]
  )
  if (len(run_times) != len(run_memory)):
    raise Exception("There is result data discrepancy") ## you could make this better with try catch, but if this works - I'll leave it be.
  else: return result