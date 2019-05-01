import glob
import pandas as pd

fp = glob.glob('coverage/*.txt')
dfs = []

for f in fp:
    cell = f.split('/')[-1]
    dfs.append(pd.read_csv(f, sep='\t', header=None, names=['pid', cell],
                           index_col='pid'))

cm = pd.concat(dfs, axis=1, sort=True)
cm.fillna(0, inplace=True)
cm.to_csv('count_matrix.txt', sep='\t')
