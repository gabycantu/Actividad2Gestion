%--- Identificar nulos ---%

%Identificamos la matriz de datos faltantes del DataFrame
Matriz_Null= ismissing(londonz);

%Identificamos la cantidad de datos faltantes por Columna
Column_Null= sum(Matriz_Null);


%--- Sustitucion de nulos ---%
df= fillmissing(londonz,'next','DataVariables',{'first_review','last_review'});
df= fillmissing(df,'nearest','DataVariables',{'minimum_minimum_nights', ...
    'maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights', ...
    'host_response_rate','host_acceptance_rate'});
df= fillmissing(df,'movmean', 69000, 'DataVariables',{'minimum_nights_avg_ntm','maximum_nights_avg_ntm'});
df= fillmissing(df,'constant', 0, 'DataVariables',{'bedrooms','beds'});
df= fillmissing(df,'constant', "Desconocido", 'DataVariables',{'host_location','host_neighbourhood', ...
    'neighbourhood','bathrooms_text'});
df = fillmissing(df,'previous','DataVariables',{'host_since','host_response_time','host_is_superhost','host_has_profile_pic','host_identity_verified'});
df = fillmissing(df,'movmean',69000,'DataVariables',{'host_listings_count','host_total_listings_count'});
df = fillmissing(df,'movmedian',69000,'DataVariables',{'review_scores_rating','review_scores_accuracy','review_scores_cleanliness','review_scores_checkin','review_scores_communication','review_scores_location','review_scores_value','reviews_per_month'});



%--- Verificar nulos ---%

%Identificamos la matriz de datos faltantes del DataFrame
Matriz_Null1= ismissing(df);

%Identificamos la cantidad de datos faltantes por Columna
Column_Null1= sum(Matriz_Null1);

%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_Null1= sum(Column_Null1);


%--- Outliers ---%

%Identificamos Matriz de outliers mediante método de quartiles
Outliers1 = isoutlier(df,'quartiles','DataVariables',{'host_response_rate','host_acceptance_rate','latitude','longitude','price','minimum_nights','maximum_nights','minimum_minimum_nights','maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights','minimum_nights_avg_ntm','maximum_nights_avg_ntm','availability_30','availability_60','availability_90','availability_365','number_of_reviews','number_of_reviews_ltm','number_of_reviews_l30d','review_scores_rating','review_scores_accuracy','review_scores_cleanliness','review_scores_checkin','review_scores_communication','review_scores_location','review_scores_value','calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms','reviews_per_month'});
%Identificamos la cantidad de outliers por Columna
Column_outliers1= sum(Outliers1);
%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_outliers_quartiles= sum(Column_outliers1);

%Identificamos Matriz de outliers mediante método de grubbs
Outliers2 = isoutlier(df,'grubbs','DataVariables',{'host_response_rate','host_acceptance_rate','latitude','longitude','price','minimum_nights','maximum_nights','minimum_minimum_nights','maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights','minimum_nights_avg_ntm','maximum_nights_avg_ntm','availability_30','availability_60','availability_90','availability_365','number_of_reviews','number_of_reviews_ltm','number_of_reviews_l30d','review_scores_rating','review_scores_accuracy','review_scores_cleanliness','review_scores_checkin','review_scores_communication','review_scores_location','review_scores_value','calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms','reviews_per_month'});
%Identificamos la cantidad de outliers por Columna
Column_outliers2= sum(Outliers2);
%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_outliers_grubbs= sum(Column_outliers2);

%Identificamos Matriz de outliers mediante método de desviación estándar
Outliers3 = isoutlier(df,'mean','DataVariables',{'host_response_rate','host_acceptance_rate','latitude','longitude','price','minimum_nights','maximum_nights','minimum_minimum_nights','maximum_minimum_nights','minimum_maximum_nights','maximum_maximum_nights','minimum_nights_avg_ntm','maximum_nights_avg_ntm','availability_30','availability_60','availability_90','availability_365','number_of_reviews','number_of_reviews_ltm','number_of_reviews_l30d','review_scores_rating','review_scores_accuracy','review_scores_cleanliness','review_scores_checkin','review_scores_communication','review_scores_location','review_scores_value','calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms','reviews_per_month'});
%Identificamos la cantidad de outliers por Columna
Column_outliers3= sum(Outliers3);
%Identificamos la cantidad de datos faltantes por DataFrame
DataFrame_outliers_desviacion= sum(Column_outliers3);


%--- Sustitución de Outliers ---%

%Rellenamos Outliers por DataFrame usando un método
df = filloutliers(df,'linear','DataVariables',{'number_of_reviews_l30d','review_scores_rating', 'review_scores_accuracy','review_scores_cleanliness','review_scores_communication', 'review_scores_checkin','review_scores_location', 'review_scores_value','reviews_per_month'});

%Rellenamos Outliers por DataFrame usando varios métodos
df = filloutliers(df,'clip','DataVariables',{'calculated_host_listings_count','calculated_host_listings_count_entire_homes','calculated_host_listings_count_private_rooms','calculated_host_listings_count_shared_rooms'});

%Rellenamos Outliers por DataFrame usando varios métodos
df = filloutliers(df,'center','DataVariables',{'accommodates','bedrooms','beds','price','maximum_nights','minimum_maximum_nights','maximum_maximum_nights','maximum_nights_avg_ntm','number_of_reviews','number_of_reviews_ltm'});



%--- Filtro de datos ---

%Filtro por columnas
filtro= df(:,[1,2,10,11,17,18,24,31,32,35,38,39,41:49,52:55,57:59,62:68,71:75]);

%Matriz de correlaciones del Dataframe
Matriz=table2array(filtro); %esta línea convierte la tabla en matriz
Mat_Corr=corrcoef(Matriz); %Matriz de correlaciones

%Crear mapa de calor
figure(1)
h = heatmap(Mat_Corr);

%filtros para correlación
filtro1= df(:,[1,2,10,11,17,18,24,31,32,35,41:45,48,52:55,57,62:68,72,75]);

%---------Correlación de datos---------

%Matriz de correlaciones del Dataframe
Matriz1=table2array(filtro1); %esta línea convierte la tabla en matriz
Mat_Corr1=corrcoef(Matriz1); %Matriz de correlaciones

%Crear mapa de calor
figure(2)
h1 = heatmap(Mat_Corr1);

%--- Graficos ---%

%GRÁFICOS
%Barras paralelas: Visualiza la relación entre 2 o mas variables
var1= df(:,[34, 53, 54]);
figure(3)
parallelplot(var1,'GroupVariable','room_type')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var2= df(:,[19, 62, 68]);
figure(4)
parallelplot(var2,'GroupVariable','host_is_superhost')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var3= df(:,[27, 35, 41]);
figure(5)
parallelplot(var3,'GroupVariable','host_identity_verified')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var4= df(:,[29, 41, 55]);
figure(6)
parallelplot(var4,'GroupVariable','neighbourhood_cleansed')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var5= df(:,[70, 42, 43]);
figure(7)
parallelplot(var5,'GroupVariable','instant_bookable')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var6= df(:,[33, 41, 35]);
figure(8)
parallelplot(var6,'GroupVariable','property_type')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var7= df(:,[26, 17, 66]);
figure(9)
parallelplot(var7,'GroupVariable','host_has_profile_pic')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var8= df(:,[29, 41, 67]);
figure(10)
parallelplot(var8,'GroupVariable','neighbourhood_cleansed')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var9= df(:,[34, 42, 43]);
figure(11)
parallelplot(var9,'GroupVariable','room_type')
title 'Variables de interés de Airbnb Londres'

%Barras paralelas: Visualiza la relación entre 2 o mas variables
var10= df(:,[19, 41, 62]);
figure(12)
parallelplot(var10,'GroupVariable','host_is_superhost')
title 'Variables de interés de Airbnb Londres'

