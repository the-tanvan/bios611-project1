import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("derived_data/amenities.csv")
row_total=df.shape[0]
hottub_count=df.hottub.value_counts()
nohottub_count=row_total-hottub_count[1]

labels="Hot tub","No hot tub"
sizes=[hottub_count[1],nohottub_count]
colors=['#FF585D','#FFD6D8']

fig1,ax1=plt.subplots()
ax1.pie(sizes,labels=labels,colors=colors,autopct='%1.1f%%')
ax1.axis('equal')
plt.title('Pie Chart of Airbnb Listings with Hot Tub')
plt.savefig('assets/pie_hottub.png')