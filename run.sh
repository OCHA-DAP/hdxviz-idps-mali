printf('converting shapefile to csv')
cd data
ogr2ogr -f CSV output.csv IDP_2012-2014_point.shp
printf('done')
printf('cleaning the file -- preparing for viz')
Rscript code/munging.R