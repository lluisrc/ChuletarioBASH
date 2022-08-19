```
  ____ _           _      _             _       
 / ___| |__  _   _| | ___| |_ __ _ _ __(_) ___  
| |   | '_ \| | | | |/ _ \ __/ _` | '__| |/ _ \ 
| |___| | | | |_| | |  __/ || (_| | |  | | (_) |
 \____|_| |_|\__,_|_|\___|\__\__,_|_|  |_|\___/ 
```

## If, else
```
if [ ¿? ]; then
    echo "Soy true"
else
    echo "Soy false"
fi
```

## While / until
```
while [ ¿? ]
do
    ¿?
done
```

## For
```
for i in ¿?
do
    echo "$i"
done
```

## Case
```
case i in
  A) ¿? ;;
  B) ¿? ;;
  C) ¿? ;;
esac
```

## Operadores para hacer comparaciones
= --> asignación
== --> igual
-eq --> igual
!= --> distinto
-ne --> distinto
< --> menor que
-lt --> menor que
<= --> menor o igual que
-le --> menor o igual que
> --> mayor que
-gt --> mayor que
-ge --> mayor o igual que 
>= --> mayor o igual que 
-z --> string null
-n --> string not null
-a --> and
&& --> and
-o --> or
|| --> or
+ --> suma
- --> resta
\* --> mutiplicación
/ --> división
% --> resto
** --> potencia
+= --> suma y asigna
-= --> resta y asigna
*= --> mutiplica y asigna
/= divide y asigna
%= resto y asigna

# Estructuras de control

# if [[ "$a" < "$b" ]]
# if [ "$a" \< "$b" ]
# if [ "$a" -lt "$b" ]
# (("$a" < "$b"))

# Imprime por pantalla el id de usuario, si es root será 0
id -u

# Crear usuario
useradd lroca

# Crear grupo
groupadd docker

# Añadir usuario a grupo
usermod -aG docker lroca

-a, append (sin la -a, remplaza)
-G, define el grupo como secundario
-g, define el grupo como primario




# Grep imprime las lineas que contenga el argumento
grep error
-r --> busca recursivamente
-v --> omite las lineas que contenga el argumento
-i --> no diferencia el caseSensitive
También, gracias al "|", puede ser complementado por otro comando
cat output.log | grep error

-e pattern
-i: Ignore uppercase vs. lowercase.
-v: Invert match.
-c: Output count of matching lines only.
-l: Output matching files only.
-n: Precede each matching line with a line number.
-b: A historical curiosity: precede each matching line with a block number.
-h: Output matching lines without preceding them by file names.
-s: Suppress error messages about nonexistent or unreadable files.
-x
-f file: Take regexes from a file.
-o: Output the matched parts of a matching line.
--help
-V, --version
--regexp=pattern, in addition to -e pattern
--invert-match, in addition to -v
--word-regexp, in addition to -w
--line-regexp, in addition to -x
-A num, --after-context=num
-B num, --before-context=num
-C num, -num, --context=num


# Devuelve 0 si el comando anterior se ejecutó correctamente
$?

# Devuelve la salida a /dev/null (a nada) y la salida de errores la redirige a stdoutput
echo "Hola" > /dev/null 2<&1

# Oculta el cursor
tput civis
# Muestra el cursor
tput cnorm

# Salto de línea
\n
# Salto de tabulación
\t

# -e se come las expresiones \ 
# en los echo puedes jugar con \n \t \r (el \r se ejecuta con el -n y se pone al. Esto hace que el siguiente echo que venga empezará a sustituir los caracteres impresos echo actual.)
# -n imprime el siguiente echo en la misma linea donde se declara el -n

echo -e "\n${redColour}Hola"

# Trap ejecuta una funcion dependiendo de la señal con la que ha finalizado el proceso, en este caso interrupción (ctrl+c)
# (kill -l) --> INT, EXIT, TERM
trap control_c INT

# Ojo al declare y al declare -i parameter_counter=0; while getops :x:y: arg; do
while getopts "h:s:" arg; do
  case $arg in
    h)
      echo "usage" ;;
    s)
      strength=$OPTARG
      echo $strength ;;
  esac
done

# El comando find es muy potente, parámetros y todo lo que podemos hacer con find
find <directory_path> <search_parameter>

argumentos:
    -name, -iname
    -type --> f,d,l
    -size, -empty --> c, k, M, G, b (+/-100G)
    -ctime, -mtime, -atime (creación, modificación, acceso)
    -user, -group
    -perm --> 775
    -and
    -or
    -not
    -maxdepth (profundidad de recursión)
    -mindepth
    -exec (permite ejecutar comando al resultado del find)

    -ok (como el exec pero fuerza la confirmación interactiva del usuario)
# xargs va acompañado al paid(tuberia), recoje la salida del comando anterior y lo pasa como argumentos al comando definido.
find . -name archivo.txt | xargs cat


# cut, recorta la salida con el formato deseado.
cut <option> <file>
options:
    -f (fields)
    -c (characters)
    -d (delimiter)
# Corta y muestra la salida de el segundo field delimintado por ' '
cut -f2 -d ' ' <archivo>
# Muestra los caracteres definidos
cut -c 1-10 <archivo>
# El cut se puede utilizar a continuación de un paid para tratar la salida del comando anterior
echo "Hola mundo" | cut -c 1-3


# tr, remplazar los characters de la salida con el formato deseado. Se utiliza con paid para tratar la salida del comando anterior
# Noramlmente en OPTION hay dos opciones, que quieres remplazar y a que quieres remplazar
echo "Hola mundo!" | tr "[:lower:]" "[:upper:]"

-c (la negativa, "la que no sea...")
-d delete (elimina los caracteres del set1)
-s sustituye las secuencias de repetidas occurrencias

[:lower:] todas las mayusculas
[:upper:] todos las minusculas
[:digit:] todos los digitos
[:space:], [:blank:] todos los espacios en blanco horizontales
[:alpha:] todas las letras
[:alnum:] todas las letras y numeros

# Todas las minusculas a mayusculas
echo "Hola mundo!" | tr "[:lower:]" "[:upper:]"
# Todo lo que no contecga A me lo pones a t
echo "Abc123d56E" | tr -c 'A' 't'
# Las secuencias de ' ' me las sustituyes por un ' ' 
echo "GNU     \    Linux" | tr -s ' '


# sed; reemplazar el texto en un archivo sin acceder a este.
-s (sustitución, solo la primera aparición NO todas)
/ (delimitadores)
    primera posición del delimitador es el patrón de búsqueda
    segunda posición del delimitador es la cadena de remplazo
    tercera posición del delimitador es el numero de apariciones que actuará, en este caso 2. Utilizamos 'g' para todas las apariciones.
5 (podemos indicar que línea especifica debe acutar --> sed '5 s/Microsoft Windows/GNU Linux/2' fichero.txt)
5,10 (podemos indicar un rango de lineas donde debe acutar --> sed '5,10 s/Microsoft Windows/GNU Linux/2' fichero.txt)
5d (podemos eliminar una fila de un fichero --> sed '5d' fichero.txt)
5,10d (podemos eliminar un rango de filas de un fichero --> sed '5,10d' fichero.txt)

Si no le se añade parametro muestra la modificación en el output pero no se aplica en el archivo
sed 's/Microsoft Windows/GNU Linux/2' fichero.txt

-i se aplica los cambios en el archivo
sed -i 's/^que .*$/el contenido de la línea ha sido reemplazado/' sedexamples

Nota: La magia del último comando la realiza la expresión regular ^que .*$. La parte ^que hace referencia a todas las líneas que empiezan por la cadena de caracteres que. El punto . hace referencia a cualquier letra que aparezca las veces que aparezca * hasta el final de la línea$.

sin el -i te muestra por pantalla las modificaciones pero no aplica al archivo,
con el -i aplica las modificaicones en el archivo.
los comodines \ sirven para poner "/" como caracter --> \/


# tcpdump, este comando captura los paquetes que viajan por la red. Mas tarde, estos paquetes se pueden analizar con wireshark
tcpdump <argumentos>
# mas info en --> https://danielmiessler.com/study/tcpdump/
-w <output.pcap> --> donde output podemos poner el nombre/ubicación donde se guarda el archevo
host <host> --> analiza los paquetes (entrantes  y salientes) del host
port <nº puerto> --> filtra los paquetes y caputura solo los del puerto definido
-v / -vv --> muestra más detalle en la salida del comando
src --> solo captura los paquetes de origen en la comunicación
dest --> solo captura los paquetes de destinatario en la comunicación
-i --> para que escuche por una interfaz de red especifica


rlwrap --> hace un historico de comandos para utilizar las fechas de arriba y abajo y cambiar de comando mas rapido


# awk
Imprime la primera columna (por defecto el delimitador es el espacio)
ps | awk '{print $1}'

Imprime la primera columna pero NO la primera fila
ps | awk 'NR>1{print $2}'

Cambiar el delimitador
-F ":"
cat /etc/passwd | awk -F ":" '{print $1}'

Mostrar coincidencias (como un grep)
awk '/^tmpfs/ {print}'

Contar el numero de líneas (como un wc -l)
awk '{print NR}' /etc/shells

Imprimir la primera/rango linea
awk 'NR==1{print $0}'
awk 'NR>2{print $0}'
awk 'NR==2, NR==4 {print $0}'


# Como crear un servicio en linux.(link tuto tomcat service )


# Personalizar prompt
Se configura en ~/.bashrc con la variable PS1=""

Customizar el prompt:
\u : Nombre del usuario actual.
\h : Nombre del host hasta el primer punto (.), por ejemplo, orion del host orion.zeppelinux.es.
\H : Nombre del host completo.
\w : Path del directorio de trabajo actual.
\W : Nombre del directorio de trabajo actual.
\d : Fecha actual en formato (dia_semana mes día, lun jul 27.
\t : Hora actual en formato 24 horas (HH:MM:SS).
\T : Hora actual en formato 12 horas (HH:MM:SS).
\@ : Hora actual en formato 12 horas (am/pm).
\n : Nueva línea.
\r : Retorno de carro (enter/intro).
\s : Nombre de la shell.
\v : Versión de bash.
\V : Numero de la release de bash.
\! : Número en el historial del comando ejecutado.
\# : Número de comando de este comando.
\$ : Si se trada de un usuario normal, aparece un $. Si se trata del usuario root, aparece un #.
\\ : Barra diagonal.
\[ : Inicio de una secuencia de caracteres no imprimibles.
\] : Fin de una secuencia de caracteres no imprimibles.


Expresiones regulares (regexp)
https://www.tutorialspoint.com/unix/unix-regular-expressions.htm
