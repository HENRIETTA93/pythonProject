import numpy as np

lists_of_lists=[[2,1],[1]]
np_arr = np.array(lists_of_lists)
lists = np_arr.flatten()
print(lists)