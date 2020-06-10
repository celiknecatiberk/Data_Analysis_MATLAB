bool=true;
% Allowed the number of columns to be selected.
while(bool)
prompt=('Which column would you like to select (1-4)');
x=input(prompt);
 
%We have 4 attributes.
if(x<5)
%Calls that column from the data set according to the number entered by the user.
    z=(data(:,x));
    bool=false;
%Error occurs when user enters out of column count range.   
else
    fprintf('Column must be less than 5 ...');
 end
end
 
 
%Calculate the mean of dataset.
cmean=mean(data);
%Calculate the  centered data matrix of dataset and we have created a ones matrix.
one=ones(size(data,1),1);
y=data-one*cmean;
disp(y)
%Calculate the mean of the selected column.
u_mean=mean(z);
%Calculate the median of the selected column.
u_median=median(z);
%Calculate the transpose of the matrix and calculates its mode.
u_mode=mode(transpose(z));
%Calculate the sum of the selected column.
u_sum=sum(z);
%Calculate the max of the selected column.
u_max=max(z);
%Calculate the range by subtracting the minimum value from the maximum value.
u_range=range(z);
%Calculate the skewness of dataset.
u_skewness=skewness(z);
%Calculate the kurtosis of dataset.
u_kurtosis=kurtosis(z);
%Calculate the boxplot of dataset and boxplot summarizes data visually.
boxplot(z)
 

%We calculate outliers and get the transpose.
TH= transpose(isoutlier (z));
outlier_count=0;
for j=1:length(TH)
      if (TH(j)==1)
          outlier_count=outlier_count+1;
      end
end
%Print the values that  calculate and want to appear on the screen using fprintf().
fprintf('\nSelected Column: %d \nMean: %.4f \nMedian: %.4f \nMode: %.4f  \nSum: %.4f \nMax: %.4f \nRange: %.4f \nSkewness value: %.4f \nKurtosis value: %.4f \nNumber of Outliners: %d \n',x,u_mean,u_median,u_mode,u_sum,u_max,u_range,u_skewness,u_kurtosis,outlier_count)
 
%According to the value of skewness greater than or less than or equal to 0, we print the skewness type. >Positive Skewed, <Negative Skewed , = Symmetric skewed.
if (u_skewness >0 )
    fprintf ('Curve to Right \n ');
else if (u_skewness <0 )
        fprintf('Curve to Left \n');
    else 
        fprintf ('Curve is Symetric \n');
    end 
 end
 
%According to the value of kurtosis greater than or less than or equal to 3, we print the kurtosis type.
 
if(u_kurtosis >3 )
        fprintf ('Leptokurtic\n');
else if (u_kurtosis < 3 )
        fprintf ('Playtkurtic\n');
    else
        fprintf ('Mesokurtic \n');
    end
end
