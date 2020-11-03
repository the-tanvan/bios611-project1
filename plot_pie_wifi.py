import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("derived_data/amenities.csv")
row_total=df.shape[0]
wifi_count=df.wifi.value_counts()
nowifi_count=row_total-wifi_count[1]

labels="Wifi","No wifi"
sizes=[wifi_count[1],nowifi_count]
colors=['#FF585D','#FFD6D8']

fig1,ax1=plt.subplots()
ax1.pie(sizes,labels=labels,colors=colors,autopct='%1.1f%%')
ax1.axis('equal')
plt.title('Pie Chart of Airbnb Listings with Wifi')
plt.savefig('assets/pie_wifi.png')