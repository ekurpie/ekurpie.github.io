This is a machine learning Random Forest Classifier (RFC). It uses the same dataset as the LSTM model in this repository which is a wearable
dataset of accelerometers, gyrometers, and a few other sensors. This differs in that it is NOT deep learning and is instead standard machine 
learning. It also is rather simple in that it does NOT take into account the dimension of time. Rather, it looks at all of the data in each row
for each sensor and performs a calculation of prediction on this. Despite being rather simple, it is surprisingly effective and achieved an accuracy
of 66%. This may not seem high, but the dataset is challenging as their are 11 activities and a number of them are poorly represented.