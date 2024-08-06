#!/usr/bin/env python
# coding: utf-8

# In[7]:


import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')


# In[5]:


import pandas as pd
df = pd.read_csv("Googleplaystore(1).csv")
df


# In[8]:



df.columns


# In[7]:


df.head(1)


# In[21]:


df.tail()


# In[9]:


df.sample(2)


# In[10]:


df.shape


# In[11]:


df.describe()


# In[29]:


df.describe(include='all')


# In[12]:


df.info()


# In[34]:


df.duplicated().sum()


# In[37]:


df1=df.drop_duplicates()
df1


# In[39]:


df.dtypes


# In[40]:


df['Content Rating'].dtypes


# In[42]:


df['Content Rating']


# In[43]:


df['Reviews'].dtype


# In[44]:


df['Reviews']


# In[46]:


df.Reviews.str


# In[47]:


df.Reviews


# In[49]:


"a".isnumeric()


# In[50]:


"1".isnumeric()


# In[51]:


df[~df.Reviews.str.isnumeric()]


# In[14]:


df_copy = df.copy()
df_copy


# In[64]:


df_copy.reset_index(drop = True, inplace=True)


# In[15]:


df_copy


# In[61]:


df_copy[~df_copy.Reviews.str.isnumeric()]


# In[65]:


df_copy = df_copy.drop(df_copy.index[9990])


# In[66]:


df_copy[~df_copy.Reviews.str.isnumeric()]


# In[67]:


df_copy.Reviews


# In[68]:


df_copy['Reviews'] = df_copy['Reviews'].astype(int)
df_copy.Reviews.dtype


# In[70]:


df_copy["Reviews"].dtype


# In[71]:


df_copy.info()


# In[73]:



df_copy['Size'].unique()


# In[80]:


df_copy.Size.dtype


# In[81]:


df_copy.info()


# In[82]:


df_copy['Installs']


# In[83]:


df_copy['Installs'] = df_copy['Installs'].str.replace("+", "").str.replace(",", "")


# In[85]:


df_copy['Installs'].dtypes


# In[86]:


df_copy['Installs'].astype(int)


# In[88]:


df_copy["Price"].unique()


# In[89]:


df_copy.Price.dtype


# In[91]:


char_to_remove = ["+", ",", "$"] 
cols_to_remove = ["Installs", "Price"]

for char in char_to_remove:
    for col in cols_to_remove:
        df_copy[col] = df_copy[col].str.replace(char, "")


# In[92]:


df_copy.Price.unique()


# In[93]:


df_copy['Installs'] = df_copy['Installs'].astype(int)
df_copy['Price'] = df_copy['Price'].astype(float)


# In[94]:


df_copy.dtypes


# In[95]:


df_copy['Last Updated']


# In[96]:


df_copy['Last Updated'] = pd.to_datetime(df_copy['Last Updated'])


# In[97]:


df_copy['day'] = df_copy['Last Updated'].dt.day
df_copy['month'] = df_copy['Last Updated'].dt.month
df_copy['year'] = df_copy['Last Updated'].dt.year


# In[98]:


df_copy.dtypes


# In[99]:


df_copy.drop("Last Updated", axis =1, inplace = True)


# In[100]:


df_copy.dtypes


# In[101]:


df_copy['Android Ver'].unique()


# In[ ]:


df_copy['Android Ver'] = df_copy['Android Ver'].str.replace("and up", "").str.replace("Varies with device","")


# In[102]:


df_copy['Android Ver'].unique()


# In[103]:


df_copy.App


# In[107]:


df[df.duplicated("App")]


# In[108]:


df_copy = df_copy.drop_duplicates(subset = ["App"], keep = 'first')


# In[109]:


df_copy[df_copy.duplicated("App")]


# In[110]:


df_copy.dtypes


# In[4]:


import pandas as pd

df = pd.read_csv("Googleplaystore(1).csv")
df
df_copy = df.copy()
df_copy
df_copy.columns


# In[10]:


df_copy = df.copy()
df_copy


# In[19]:


df_copy['Type'].value_counts()


# In[20]:


df_copy['Type'].value_counts(normalize=True)*100


# In[26]:


df_copy['Android Ver'].value_counts(normalize=True)*100


# In[6]:


import seaborn as sns
import pandas as pd


# In[7]:


df = pd.read_csv("Googleplaystore(1).csv")
df
df_copy = df.copy()
df_copy


# In[10]:


sns.countplot(x=df_copy['Type'])


# In[12]:


sns.countplot(x=df_copy['Android Ver'])


# In[15]:


df_copy["Content Rating"].value_counts()


# In[16]:


df_copy["Content Rating"].value_counts(normalize=True)*100


# In[18]:


sns.countplot(x=df_copy["Content Rating"])


# In[20]:


sns.countplot(x=df_copy["Size"])


# In[21]:


#numerical features


# In[29]:


sns.kdeplot(df_copy['Rating'])


# In[75]:


import matplotlib.pyplot as plt 
plt.figure(figsize=(10,15))
category=["Type","Content Rating"]
for i in range(0,len(category)):
    plt.subplot(2,2,i+1)
    sns.countplot(x=df_copy[category[i]],palette="Set2")
    plt.xlabel(category[i])
    plt.xticks(rotation=60)
    plt.tight_layout()


# In[77]:


df_copy["Category"].value_counts()


# In[103]:


df_copy["Category"].value_counts().plot.pie(x=df['Category'],figsize=(15,15),autopct='%1.1f%%')


# In[132]:


category


# In[136]:


sns.barplot(x=category["groups"],y=category['count'],palette="Set2")
plt.xticks(rotation=41)


# In[137]:


df_copy.columns


# In[138]:


df_copy.Category.unique()


# In[143]:


df_copy.groupby(['Category'])['Installs'].sum().sort_values(ascending=False).reset_index()


# In[147]:


sns.boxplot(df_copy['Rating'])


# In[13]:


sns.boxplot(x='Installs',y='Rating',data=df_copy)
plt.xticks(rotation=45)
plt.figure(figsize=(25,50))

