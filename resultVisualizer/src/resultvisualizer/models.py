
from typing import NamedTuple


class BenchmarkResult(NamedTuple):
  command_name: str
  duration: list[float] 
  memory: list[float]  