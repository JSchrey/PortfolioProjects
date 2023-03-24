#!/usr/bin/env python
# coding: utf-8

# In[48]:


import os, shutil


# In[49]:


path = r"C:/Users/schre/Desktop/Python File Sorter/"


# In[50]:


file_names = os.listdir(path)


# In[51]:


folder_names = ['excel files', 'word files', 'pdf files', 'R files']

for loop in range(0,4):
    if not os.path.exists(path + folder_names[loop]):
        print(path + folder_names[loop])
        os.makedirs(path + folder_names[loop])
        
for file in file_names:
    if ".csv" in file and not os.path.exists(path + "excel files/" + file):
        shutil.move(path + file, path + "excel files/" + file)
    elif ".xls" in file and not os.path.exists(path + "excel files/" + file):
        shutil.move(path + file, path + "excel files/" + file)
    elif ".xlsx" in file and not os.path.exists(path + "excel files/" + file):
        shutil.move(path + file, path + "excel files/" + file)
    elif ".xlsb" in file and not os.path.exists(path + "excel files/" + file):
        shutil.move(path + file, path + "excel files/" + file)
    elif ".docx" in file and not os.path.exists(path + "word files/" + file):
        shutil.move(path + file, path + "word files/" + file)
    elif ".rtf" in file and not os.path.exists(path + "word files/" + file):
        shutil.move(path + file, path + "word files/" + file)
    elif ".pdf" in file and not os.path.exists(path + "pdf files" + file):
        shutil.move(path + file, path + "pdf files/" + file)
    elif ".R" in file and not os.path.exists(path + "R files" + file):
        shutil.move(path + file, path + "R files/" + file)


# In[43]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




