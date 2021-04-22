This is a machine learning Random Forest Classifier (RFC). It uses the same dataset as the LSTM model in this repository which is a wearable
dataset of accelerometers, gyrometers, and a few other sensors. This differs in that it is NOT deep learning and is based off of the other
RFC within this repository. Unlike that model, however, this one uses a few new tricks. The main one is a "sliding window" whereby samples of data
are concatenated together to give the model the ability to analyze the time dimension of the dataset. In addition, it uses a module known as 
TSFresh to produce a large number of new features. It then reduces these features down to the ones will valuable and high correlations.

Not all of this code is within this module and I am working on getting it into this folder. The code within this folder is primarily the code that is 
ran after much of the feature generation has taken place. There are a few other tricks being used and we also attempted to use SMOTE and other 
sampling techniques to reduce the imbalance of the dataset.