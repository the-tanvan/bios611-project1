import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("derived_data/amenities.csv")
row_total=df.shape[0]
stove_count=df.stove.value_counts()
nostove_count=row_total-stove_count[1]

labels="Stove","No stove"
sizes=[stove_count[1],nostove_count]
colors=['#FF585D','#FFD6D8']

fig1,ax1=plt.subplots()
ax1.pie(sizes,labels=labels,colors=colors,autopct='%1.1f%%')
ax1.axis('equal')
plt.title('Pie Chart of Airbnb Listings with Stove')
plt.savefig('assets/pie_stove.png')