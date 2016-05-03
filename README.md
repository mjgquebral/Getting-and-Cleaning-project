# Getting-and-Cleaning-project
Data Science course Project

#Analysis Process:

1.) First segment of the code loads the following files into R:

	-'activity_labels.txt' into 'actLabel'
	-'features.txt' into 'features'

2.) We then create 'columns' to be the header of the merged dataset to be created
3.) We then load the following files into R:
	
	-'subject_train.txt' into 'trainSubj'
	-'Y_train.txt' into 'trainAct'
	-'X_train.txt' into 'train'
	-'subject_test.txt' into 'testSubj'
	-'Y_test.txt' into 'testAct'
	-'X_test.txt' into 'test'

4.) Code then merges the train datasets into one dataset and likewise for test.
5.) Afterwhich it merges the consolidated train and test datasets into one dataset 'final' (We use 'columns' as the colnames for final)
6.) We then extract the columns with variables related to 'mean' and 'std'
7.) We replace activity indicators (1 to 6) to their proper names using 'actLabel' and convert them to levels (this includes 'Subject')
8.) Finally we melt the extracted data set so that we can easily cast it into a tidy dataset with means for each subject-activity per variable combination.
9.) We write/export the tidy data set into 'tidy.txt'
