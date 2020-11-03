import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("derived_data/amenities.csv")
row_total=df.shape[0]
ideal_count=df.ideal.value_counts()
noideal_count=row_total-ideal_count[1]

labels="Ideal","Not ideal"
sizes=[ideal_count[1],noideal_count]
colors=['#FF585D','#FFD6D8']

fig1,ax1=plt.subplots()
ax1.pie(sizes,labels=labels,colors=colors,autopct='%1.1f%%')
ax1.axis('equal')
plt.title('Pie Chart of Ideal Airbnb Listings')
plt.savefig('assets/pie_ideal.png')