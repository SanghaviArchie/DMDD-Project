import streamlit as st


def app():
    st.write("Welcome to the Customer Page")

    Category = st.selectbox('Select the Category', ('Electronics', 'Apperal', 'Furniture', 'Pet Supplies', 'Books'))
    
    number = st.slider('Select Quantity', 0, 10)

    date = st.date_input('Choose Delivery Date')

    st.button('ORDER')