### Original data features

For a description of the original data please see features_info.txt that you can obtain from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Feature Selection

The features in the tidy.txt data set are the avearge of each mean and standard deviation feature from the origianl data set for each activity and each subject.

The following features are can be found in the tidy.txt data set:

 [1] "activity"                                       
 [2] "subject"                                        
 [3] "timeBodyAccelerometerMeanX"                     
 [4] "timeBodyAccelerometerMeanY"                     
 [5] "timeBodyAccelerometerMeanZ"                     
 [6] "timeGravityAccelerometerMeanX"                  
 [7] "timeGravityAccelerometerMeanY"                  
 [8] "timeGravityAccelerometerMeanZ"                  
 [9] "timeBodyAccelerometerJerkMeanX"                 
[10] "timeBodyAccelerometerJerkMeanY"                 
[11] "timeBodyAccelerometerJerkMeanZ"                 
[12] "timeBodyGyroscopeMeanX"                         
[13] "timeBodyGyroscopeMeanY"                         
[14] "timeBodyGyroscopeMeanZ"                         
[15] "timeBodyGyroscopeJerkMeanX"                     
[16] "timeBodyGyroscopeJerkMeanY"                     
[17] "timeBodyGyroscopeJerkMeanZ"                     
[18] "timeBodyAccelerometerMagnitudeMean"             
[19] "timeGravityAccelerometerMagnitudeMean"          
[20] "timeBodyAccelerometerJerkMagnitudeMean"         
[21] "timeBodyGyroscopeMagnitudeMean"                 
[22] "timeBodyGyroscopeJerkMagnitudeMean"             
[23] "frequencyBodyAccelerometerMeanX"                
[24] "frequencyBodyAccelerometerMeanY"                
[25] "frequencyBodyAccelerometerMeanZ"                
[26] "frequencyBodyAccelerometerMeanFreqX"            
[27] "frequencyBodyAccelerometerMeanFreqY"            
[28] "frequencyBodyAccelerometerMeanFreqZ"            
[29] "frequencyBodyAccelerometerJerkMeanX"            
[30] "frequencyBodyAccelerometerJerkMeanY"            
[31] "frequencyBodyAccelerometerJerkMeanZ"            
[32] "frequencyBodyAccelerometerJerkMeanFreqX"        
[33] "frequencyBodyAccelerometerJerkMeanFreqY"        
[34] "frequencyBodyAccelerometerJerkMeanFreqZ"        
[35] "frequencyBodyGyroscopeMeanX"                    
[36] "frequencyBodyGyroscopeMeanY"                    
[37] "frequencyBodyGyroscopeMeanZ"                    
[38] "frequencyBodyGyroscopeMeanFreqX"                
[39] "frequencyBodyGyroscopeMeanFreqY"                
[40] "frequencyBodyGyroscopeMeanFreqZ"                
[41] "frequencyBodyAccelerometerMagnitudeMean"        
[42] "frequencyBodyAccelerometerMagnitudeMeanFreq"    
[43] "frequencyBodyAccelerometerJerkMagnitudeMean"    
[44] "frequencyBodyAccelerometerJerkMagnitudeMeanFreq"
[45] "frequencyBodyGyroscopeMagnitudeMean"            
[46] "frequencyBodyGyroscopeMagnitudeMeanFreq"        
[47] "frequencyBodyGyroscopeJerkMagnitudeMean"        
[48] "frequencyBodyGyroscopeJerkMagnitudeMeanFreq"    
[49] "timeBodyAccelerometerStdX"                      
[50] "timeBodyAccelerometerStdY"                      
[51] "timeBodyAccelerometerStdZ"                      
[52] "timeGravityAccelerometerStdX"                   
[53] "timeGravityAccelerometerStdY"                   
[54] "timeGravityAccelerometerStdZ"                   
[55] "timeBodyAccelerometerJerkStdX"                  
[56] "timeBodyAccelerometerJerkStdY"                  
[57] "timeBodyAccelerometerJerkStdZ"                  
[58] "timeBodyGyroscopeStdX"                          
[59] "timeBodyGyroscopeStdY"                          
[60] "timeBodyGyroscopeStdZ"                          
[61] "timeBodyGyroscopeJerkStdX"                      
[62] "timeBodyGyroscopeJerkStdY"                      
[63] "timeBodyGyroscopeJerkStdZ"                      
[64] "timeBodyAccelerometerMagnitudeStd"              
[65] "timeGravityAccelerometerMagnitudeStd"           
[66] "timeBodyAccelerometerJerkMagnitudeStd"          
[67] "timeBodyGyroscopeMagnitudeStd"                  
[68] "timeBodyGyroscopeJerkMagnitudeStd"              
[69] "frequencyBodyAccelerometerStdX"                 
[70] "frequencyBodyAccelerometerStdY"                 
[71] "frequencyBodyAccelerometerStdZ"                 
[72] "frequencyBodyAccelerometerJerkStdX"             
[73] "frequencyBodyAccelerometerJerkStdY"             
[74] "frequencyBodyAccelerometerJerkStdZ"             
[75] "frequencyBodyGyroscopeStdX"                     
[76] "frequencyBodyGyroscopeStdY"                     
[77] "frequencyBodyGyroscopeStdZ"                     
[78] "frequencyBodyAccelerometerMagnitudeStd"         
[79] "frequencyBodyAccelerometerJerkMagnitudeStd"     
[80] "frequencyBodyGyroscopeMagnitudeStd"             
[81] "frequencyBodyGyroscopeJerkMagnitudeStd"

Were "activity" has one of the following values:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

And "subject" resorts to the subject under analysis. The other features are from the original data set and are renamed for easier understanding.
 
 
