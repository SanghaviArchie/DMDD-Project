
import streamlit as st
import streamlit_authenticator as stauth
import pandas as pd
from multipage import MultiPage
from app import Admin, Customer, Vendor

st.write(""" 
# DMDD Final Project
 This is a demo *application!*
 """)

app = MultiPage()

app.add_page("Admin", Admin)
app.add_page("Customer", Customer)
app.add_page("Vendor", Vendor)


names = ['Admin','Customer', 'Vendor']
usernames = ['Admin','Customer','Vendor']
passwords = ['admin1','customer2','vendor3']

hashed_passwords = stauth.Hasher(passwords).generate()

authenticator = stauth.Authenticate(names,usernames,hashed_passwords,
    'Auth_Cookie','Auth_Proj_123',cookie_expiry_days=30)

# User=st.radio('Choose Login Type',('Admin', 'Customer', 'Vendor'))

# if User == 'Admin':
#     st.write('You have selected Admin')

# elif User == 'Customer':
#     st.write('You have selected Customer')

# elif User == 'Vendor':
#     st.write('You have selected Vendor')

# else :
#     st.write('Please Select a User to proceed')

name, authentication_status, username = authenticator.login('Login','main')

if authentication_status:
    authenticator.logout('Logout', 'main')
    st.write('Welcome *%s*' % (name))
    st.title('Welcome to the E-commerce website')

elif authentication_status == False:
    st.error('Username/password is incorrect')
elif authentication_status == None:
    st.warning('Please enter your username and password')




Category = st.selectbox('Select the Category', ('Electronics', 'Apperal', 'Furniture', 'Pet Supplies', 'Books'))

if Category == 'Electronics':
    product = st.selectbox('Please Select the Product', ('MacBook Pro','Macbook Air', 'iPhone 13', 'Samsung Galaxy Note', 'Monitor'))

if Category == 'Apperal':
    gender = st.radio('Please Select the Gender',('Male', 'Female'))
    Size = st.selectbox('Please Select the size', ('S','M','L','XL','XXL'))
    product1 = st.selectbox('Please Select the Product', ('Shirts', 'T-Shirts', 'Jeans', 'Shoes', 'Watches'))

if Category == 'Furniture':
    product2 = st.selectbox('Please Select the Product', ('Sofa','Dining Table', 'Mattress', 'Bed Frame', 'Coffee table', 'Desk', 'Chair', 'Bean Bag'))

if Category == 'Pet Supplies':
    product3 = st.selectbox('Please Select the Product',('Bowl', 'Leash', 'Food', 'Medicines'))

if Category == 'Books':
    genre = st.radio('Please Select the Genere', ('History','Litrature', 'Crime'))
    if genre == 'History':
        product4 = st.selectbox('Please Select the Product', ('Illiad & Odessy','Trojan War', 'Guns & Germs'))
    if genre == 'Litrature':
        product5 = st.selectbox('Please Select the Product', ('The Great Gatsby', 'To Kill a Mockingbird','One Hundreed Years of Solitude'))
    if genre == 'Crime':
        product6 = st.selectbox('Please Select the Product',('The Godfather', 'Final Destination', 'The Moonlight Child'))



    
number = st.slider('Select Quantity', 0, 10)

date = st.date_input('Choose Delivery Date')

Cart = st.button('Add to Cart')

