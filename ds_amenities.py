import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("derived_data/listings.csv")

df.loc[df['amenities'].str.contains('Wifi'),'wifi'] = 'True'

df.loc[df['amenities'].str.contains('Stove'),'stove'] = 'True'
stove_count=df.stove.value_counts()

df.loc[df['amenities'].str.contains('Hot tub'),'hottub'] = 'True'
hottub_count=df.hottub.value_counts()

df.loc[(df['wifi']=="True") & (df['stove']=="True") & (df['hottub']=="True"),'ideal'] = 'True'
ideal_count=df.ideal.value_counts()

df = df[["wifi","stove","hottub","ideal"]]
analysis = pd.get_dummies(df)
np.savetxt("derived_data/amenities.csv", analysis, delimiter=",", header="wifi,stove,hottub,ideal",comments='')