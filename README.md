bikeshare-data-product
======================

This is a partial (and interactive) solution to the Bike Share Demand Kaggle competition. The details of the problem can be found [here](http://www.kaggle.com/c/bike-sharing-demand/data). The finished product can be found [here](http://ashic.shinyapps.io/bikeshare/).

We are given data sets consisting of data collection from bike sharing schemes over two years - between January, 2011 and December, 2012. The training data set (train.csv) corresponds to the first 19 days of each month, and the test data (test.csv) contains data about the remaining days. Features include the date and time (granular to the hour) of each record, and the season, weather condition, temperature, "feels like" temperature, windspeed, whether the day is a holiday or not, whether it is a workday (or not, i.e. a weekend), and humidity at that time. The training set also contains data on how many registered and non registered users rented a bike in that period, along with the total count. Based on this data, we are to come up with a training model that can predict the count of rentals for the test data set, at least - that's the target for the Kaggle competition.

Here, I have chosen to implement an interactive predictor in order to use Shiny. The predictor takes in some of the features, and output the expected rental count of bikes based on the input values. The model is intentionally kept simple, and is not intended for submission to Kaggle. Details of the model are discussed in the "Model" section.

To use the project from source code, you can simply open the server.R file in R studio. Please ensure the www folder and the train.csv files are in the root folder, and that the root folder is the current working directory.
