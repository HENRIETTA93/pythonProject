# -*- coding: utf-8 -*-
"""
Created on Tue Oct 30 16:18:58 2018

@author: epinsky
detailed analysis of iris dataset
# https://datascience.stackexchange.com/questions/32753/find-cluster-diameter-and-associated-cluster-points-with-kmeans-clustering-scik
"""
import os
from sklearn import datasets 
import numpy as np 
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import matplotlib.patches as mpatches
from scipy.cluster.hierarchy import dendrogram, linkage
from sklearn.cluster import DBSCAN
from sklearn.decomposition import PCA


input_dir = r'C:\Users\epinsky\bu\python\data_science_with_Python\plots'
filename = os.path.join(input_dir,'iris_clustering.pdf')
iris = datasets.load_iris()

x = iris.data
y = iris.target


estimator = KMeans(n_clusters=3)
y_kmeans = estimator.fit_predict(x)


clusters_centroids=dict()
clusters_radii= dict()

'''looping over clusters and calculate Euclidian distance of 
each point within that cluster from its centroid and 
pick the maximum which is the radius of that cluster'''

for cluster in list(set(y)):
    clusters_centroids[cluster]=list(zip(estimator.cluster_centers_[:, 0],
                      estimator.cluster_centers_[:,1]))[cluster]
    cluster_points = zip(x[y_kmeans == cluster, 0],x[y_kmeans == cluster, 1])
    clusters_radii[cluster]=max([np.linalg.norm(np.array(i)-clusters_centroids[cluster]) for i in cluster_points])


fig, ax = plt.subplots(1,figsize=(7,5))

plt.scatter(x[y_kmeans == 0, 0], x[y_kmeans == 0, 1], s = 75, c = 'red', label = 'Iris-setosa')
#art = mpatches.Circle(clusters_centroids[0],clusters_radii[0], edgecolor='r',ls='--', fill=False)
#ax.add_patch(art)

plt.scatter(x[y_kmeans == 1, 0], x[y_kmeans == 1, 1], s = 75, c = 'blue', label = 'Iris-versicolour')
#art = mpatches.Circle(clusters_centroids[1],clusters_radii[1], edgecolor='b', ls='--', fill=False)
#ax.add_patch(art)

plt.scatter(x[y_kmeans == 2, 0], x[y_kmeans == 2, 1], s = 75, c = 'green', label = 'Iris-virginica')
#art = mpatches.Circle(clusters_centroids[2],clusters_radii[2], edgecolor='g',ls='--', fill=False)
#ax.add_patch(art)

#Plotting the centroids of the clusters
plt.scatter(estimator.cluster_centers_[:, 0], estimator.cluster_centers_[:,1], s = 200, c = 'black', label = 'Centroids')

plt.legend()
plt.tight_layout()
plt.savefig(filename,dpi=300)

plt.show()

# let us do hierarchical
Z = linkage(x, 'ward')

# set cut-off to 150
max_d = 7.08                # max_d as in max_distance

plt.figure(figsize=(25, 10))
plt.title('Iris Hierarchical Clustering Dendrogram')
plt.xlabel('Species')
plt.ylabel('distance')
dendrogram(
    Z,
    truncate_mode='lastp',  # show only the last p merged clusters
    p=150,                  # Try changing values of p
    leaf_rotation=90.,      # rotates the x axis labels
    leaf_font_size=8.,      # font size for the x axis labels
)
plt.axhline(y=max_d, c='k')
plt.show()



# example with DBSCAN for IRIS
# taken from https://fangya18.com/2018/12/19/clustering-analysis-iris-dataset/

dbscan=DBSCAN()
dbscan.fit(x)
pca=PCA(n_components=2).fit(x)
pca_2d=pca.transform(x)
for i in range(0, pca_2d.shape[0]):
    if dbscan.labels_[i] == 0:
        c1 = plt.scatter(pca_2d[i, 0], pca_2d[i, 1], c='r', marker='+')
    elif dbscan.labels_[i] == 1:
        c2 = plt.scatter(pca_2d[i, 0], pca_2d[i, 1], c='g', marker='o')
    elif dbscan.labels_[i] == -1:
        c3 = plt.scatter(pca_2d[i, 0], pca_2d[i, 1], c='b', marker='*')
plt.legend([c1, c2, c3], ['Cluster 1', 'Cluster 2', 'Noise'])
plt.title('DBSCAN finds 2 clusters and Noise')
plt.show()










# Let's convert to dataframe 




