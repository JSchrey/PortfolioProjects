#!/usr/bin/env python
# coding: utf-8

# In[ ]:


name = input("Enter your name.")

weight = int(input("Enter Your Weight in Pounds: "))

height = int(input("Enter Your Height in Inches: "))

BMI = (weight * 703) / (height * height)

print(BMI)

if BMI>0:
    if(BMI<18.5):
        print(name +", you are underweight.")
    elif(BMI<=24.9):
        print(name +", you are normal weight.")
    elif(BMI<29.9):
        print(name +", you are overweight.")
    elif(BMI<34.9):
        print(name +", you are obese.")
    elif(BMI<39.9):
        print(name +", you are severely obese.")
    else:
        print(name +", you are morbidly obese.")


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





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




