library(tidyverse)
library(here) # este paquete ayuda con las direcciones de las carpetas

## esta parte descomprime los archivos en .zip 
files <- dir(pattern = "*.zip")
files



data <- files %>%
  map(unzip)       # 
data
##
## lo siguiente seria recuperar los archivos que necesitas

files2 <- dir(pattern =  "*.csv")## por ejemplo los archivos .csv

files2
data2 <- files2 %>% 
  map(read_csv)# en este punto puedes cambiar la funcion que
## necesitas utilizar. Cambiar "read_csv" por la funcion que 
## sea necesaria.  El resultado de esta linea es una lsita 
## con todos los archivos que se leen

## Lo siguiente es asignarle el nombre correspondiente a cada
## uno de los elementos que estamos leyendo 
names(data2) <- files2


data2

## A partir de este punto lo siguiente seria hacer subseting 
## para recuperar elementos especificos

data2$states.csv


#########
# Esta es otra opcion para leer los archivos luego de descomprimir
# lo bueno es que permite desglozar la lista a elementos 
# individuales


# leemos los nombres de los archivos
files_to_read <- str_subset(list.files(), ".csv")
files_to_read

# retiramos los caracteres que indican la extencion del archivo

file_names <- files_to_read %>% 
  str_remove(., ".csv")
file_names

# EN ESTE PASO SE IMPORTAN LOS ARCHIVOS A R
list_df_read <- files_to_read %>% 
  map(read_csv) %>% # en este punto es donde se debe cambiar la 
  # funcion segun el tipo de archivo que necesitas importar
  set_names(nm = file_names)
# el resultado seguira siendo un objeto de tipo lista
typeof(list_df_read)
class(list_df_read)

# esta linea permite deglozar los elementos de la lista como
# elemntos individuales en el ambiente de trabajo que seleccionaste

list2env(list_df_read, envir = .GlobalEnv)
