These are the files including dataset necessary that were used for the production of an LSTM model.
The jupyter notebook file is what was actually used and as such the Python file most likely has issues as it was simply converted
from the notebook to the Python file.

An LSTM or Long Short Term Memory model is a type of Recurrent Neural Network (RNN). These are often used for evaluating time series data
in areas such as Neuro Linguistics Programming (NLP) and wearable data. In this scenario, the LSTM model takes in wearable data in the following
3D shape of 6890,22,9. As such, it has 6890 samples of 22 time steps with 9 columns or features. We realized in this model that the accelerometers
were much more effective and the 9 columns are simply the x,y, and z features from 3 accelerometers: Neck, Wrist, Ankle.

The code is based off of the third place finisher of the Challenge UP competition.