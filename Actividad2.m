%---------Identificación de Nulos---------

%Identificamos la matriz de datos faltantes del DataFrame
Matriz_Null= ismissing(mxcompleto);

%Identificamos la cantidad de datos faltantes por Columna
Column_Null= sum(Matriz_Null);

%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_Null= sum(Column_Null);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------Sustitución de Nulos---------

%Rellenamos datos faltantes
df= fillmissing(mxcompleto,'next','DataVariables',{'first_review','last_review'});

df= fillmissing(df,'nearest','DataVariables',{'minimum_minimum_nights', ...
    'maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights', ...
    'host_response_rate','host_acceptance_rate'});

df= fillmissing(df,'movmean', 21000, 'DataVariables',{'minimum_nights_avg_ntm','maximum_nights_avg_ntm'});

df= fillmissing(df,'constant', 0, 'DataVariables',{'bedrooms','beds'});

df= fillmissing(df,'constant', "Desconocido", 'DataVariables',{'host_location','host_neighbourhood', ...
    'neighbourhood','bathrooms_text'});

df= fillmissing(df,'movmedian', 21000,'DataVariables',{'review_scores_rating','review_scores_accuracy', ...
    'review_scores_cleanliness','review_scores_checkin','review_scores_communication','review_scores_location', ...
    'review_scores_value','reviews_per_month'});



%Identificamos la matriz de datos faltantes del DataFrame
Matriz_Null1= ismissing(df)

%Identificamos la cantidad de datos faltantes por Columna
Column_Null1= sum(Matriz_Null1)

%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_Null1= sum(Column_Null1);

%---------Identificación de Outliers---------


%Identificamos Matriz de outliers mediante método de quartiles
Outliers1 = isoutlier(df,'quartiles','DataVariables',{'host_response_rate','host_acceptance_rate','host_listings_count','host_total_listings_count','accommodates','bedrooms','beds','price','minimum_nights','maximum_nights','minimum_minimum_nights','maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights','minimum_nights_avg_ntm', 'maximum_nights_avg_ntm', 'availability_30','availability_60','availability_90','availability_365', 'number_of_reviews', 'number_of_reviews_ltm','number_of_reviews_l30d', 'review_scores_rating', 'review_scores_accuracy', 'review_scores_cleanliness','review_scores_communication', 'review_scores_checkin', 'review_scores_location', 'review_scores_value', 'calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms','reviews_per_month'});
%Identificamos la cantidad de outliers por Columna
Column_outliers1= sum(Outliers1);
%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_outliers_quartiles= sum(Column_outliers1);


%Identificamos Matriz de outliers mediante método de grubbs
Outliers2 = isoutlier(df,'grubbs','DataVariables',{'host_response_rate','host_acceptance_rate','host_listings_count','host_total_listings_count','accommodates','bedrooms','beds','price','minimum_nights','maximum_nights','minimum_minimum_nights','maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights','minimum_nights_avg_ntm', 'maximum_nights_avg_ntm', 'availability_30','availability_60','availability_90','availability_365', 'number_of_reviews', 'number_of_reviews_ltm','number_of_reviews_l30d', 'review_scores_rating', 'review_scores_accuracy', 'review_scores_cleanliness','review_scores_communication', 'review_scores_checkin', 'review_scores_location', 'review_scores_value', 'calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms','reviews_per_month'});
%Identificamos la cantidad de outliers por Columna
Column_outliers2= sum(Outliers2);
%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_outliers_grubbs= sum(Column_outliers2);

%Identificamos Matriz de outliers mediante método de desviación estándar
Outliers3 = isoutlier(df,'mean','DataVariables',{'host_response_rate','host_acceptance_rate','host_listings_count','host_total_listings_count','accommodates','bedrooms','beds','price','minimum_nights','maximum_nights','minimum_minimum_nights','maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights','minimum_nights_avg_ntm', 'maximum_nights_avg_ntm', 'availability_30','availability_60','availability_90','availability_365', 'number_of_reviews', 'number_of_reviews_ltm','number_of_reviews_l30d', 'review_scores_rating', 'review_scores_accuracy', 'review_scores_cleanliness','review_scores_communication', 'review_scores_checkin', 'review_scores_location', 'review_scores_value', 'calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms','reviews_per_month'});
%Identificamos la cantidad de outliers por Columna
Column_outliers3= sum(Outliers3);
%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_outliers_desviacion= sum(Column_outliers3);

%---------Sustitución de Outliers---------

%Rellenamos Outliers por DataFrame usando un método
df = filloutliers(df,'linear','DataVariables',{'number_of_reviews_l30d','review_scores_rating', 'review_scores_accuracy','review_scores_cleanliness','review_scores_communication', 'review_scores_checkin','review_scores_location', 'review_scores_value','reviews_per_month'});

%Rellenamos Outliers por DataFrame usando varios métodos
df = filloutliers(df,'clip','DataVariables',{'calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms'});

%Rellenamos Outliers por DataFrame usando varios métodos
df = filloutliers(df,'center','DataVariables',{'accommodates','bedrooms','beds','price','maximum_nights','minimum_maximum_nights','maximum_maximum_nights','maximum_nights_avg_ntm','number_of_reviews','number_of_reviews_ltm'});

%Identificamos Matriz de outliers mediante método de grubbs
Outliersf = isoutlier(df,'grubbs','DataVariables',{'host_response_rate','host_acceptance_rate','host_listings_count','host_total_listings_count','accommodates','bedrooms','beds','price','minimum_nights','maximum_nights','minimum_minimum_nights','maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights','minimum_nights_avg_ntm', 'maximum_nights_avg_ntm', 'availability_30','availability_60','availability_90','availability_365', 'number_of_reviews', 'number_of_reviews_ltm','number_of_reviews_l30d', 'review_scores_rating', 'review_scores_accuracy', 'review_scores_cleanliness','review_scores_communication', 'review_scores_checkin', 'review_scores_location', 'review_scores_value', 'calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms','reviews_per_month'});
%Identificamos la cantidad de outliers por Columna
Column_outliersf= sum(Outliersf);
%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_outliers_grubbsf= sum(Column_outliersf);

%filtros para correlación
filtro= df(:,[16,17,22,23,34,37,38,40:48,51:54,56:58,61:67,70:74]);
%---------Correlación de datos---------

%Matriz de correlaciones del Dataframe
Matriz=table2array(filtro); %esta línea convierte la tabla en matriz
Mat_Corr=corrcoef(Matriz); %Matriz de correlaciones

%Crear mapa de calor
figure(1)
h = heatmap(Mat_Corr);

%filtros para correlación
filtro1= df(:,[16,17,22,23,34,40:44,47,51:54,56:57,61:67,70,71,74]);
%---------Correlación de datos---------

%Matriz de correlaciones del Dataframe
Matriz1=table2array(filtro1); %esta línea convierte la tabla en matriz
Mat_Corr1=corrcoef(Matriz1); %Matriz de correlaciones

%Crear mapa de calor
figure(2)
h1 = heatmap(Mat_Corr1);


%GRÁFICOS
%Barras paralelas: Visualiza la relación entre 2 o mas variables
var1= df(:,[33, 52, 53]);
figure(3)
parallelplot(var1,'GroupVariable','room_type')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var2= df(:,[18, 61, 67]);
figure(4)
parallelplot(var2,'GroupVariable','host_is_superhost')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var3= df(:,[26, 34, 40]);
figure(5)
parallelplot(var3,'GroupVariable','host_identity_verified')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var4= df(:,[28, 40, 54]);
figure(6)
parallelplot(var4,'GroupVariable','neighbourhood_cleansed')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var5= df(:,[69, 41, 42]);
figure(7)
parallelplot(var5,'GroupVariable','instant_bookable')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var6= df(:,[32, 40, 34]);
figure(8)
parallelplot(var6,'GroupVariable','property_type')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var7= df(:,[25, 16, 65]);
figure(9)
parallelplot(var7,'GroupVariable','host_has_profile_pic')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var8= df(:,[28, 40, 66]);
figure(10)
parallelplot(var8,'GroupVariable','neighbourhood_cleansed')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var9= df(:,[33, 41, 42]);
figure(11)
parallelplot(var9,'GroupVariable','room_type')
title 'Variables de interés de Airbnb México'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var10= df(:,[18, 40, 61]);
figure(12)
parallelplot(var10,'GroupVariable','host_is_superhost')
title 'Variables de interés de Airbnb México'
