
from resultvisualizer.models import BenchmarkResult
import matplotlib.pyplot as plt

def visualize(results: list[BenchmarkResult]):
  fig, axs = plt.subplots(2, 1, sharex=False, layout="constrained")
  print(len(results))
  for singleResult in results: 
    duration_ms = [t * 1000 for t in singleResult.duration]
    memory_MB = [m / 1000000 for m in singleResult.memory ]
    
    axs[0].plot(duration_ms, marker='.', label=singleResult.command_name)
    axs[0].set_title("Execution Time")
    axs[0].set_ylabel("Execution time (ms)")
    
    axs[1].plot(memory_MB, marker='.', label=singleResult.command_name)
    axs[1].set_title("Memory Usage")
    axs[1].set_ylabel("Memory Usage (MB)")
  
    axs[0].set_ylim(0, max(duration_ms) * 1.2)
    axs[1].set_ylim(0, max(memory_MB) * 1.2)
  
  for ax in axs:
     ax.legend(loc="lower left")
  
  plt.show()