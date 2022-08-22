# Chuletario

## Estructuras de control
### If, else
```
if [ ¿? ]; then
    echo "Soy true"
else
    echo "Soy false"
fi
```
```
[user@serverlinux ~]$ if [[ "a" == "a" ]];then echo "Soy A"; else echo "No soy A";fi
```

### While / until
```
while [ ¿? ]
do
    ¿?
done
```

### For
```
for i in $(seq 1 10)
do
    echo "$i"
done
```
```
[user@serverlinux ~]$ for i in $(seq 1 10);do echo "$i";done
```

### Case
```
case i in
  A) ¿? ;;
  B) ¿? ;;
  C) ¿? ;;
esac
```

## Operadores para las comparaciones
| Elemento | Descripción |
|:--------:|-------------|
| == | Igual (str) |
| -eq | Igual (int) |
| != | Distinto (str) |
| -ne | Distinto (int) |
| < | menor que |
| -lt | menor que (int) |
| <= | menor o igual que |
| -le | menor o igual que (int) |
| > | mayor que | |
| -gt | mayor que (int) |
| -ge | mayor o igual que (int) |
| >= | mayor o igual que |
| -z | string null |
| -n | string not null |
| -a, && | and |
| -o, \|\| | or |

## Operadores para los int
```
[user@serverlinux ~]$ echo "$((5 + 3))"
8
```
| Elemento | Descripción |
|:--------:|-------------|
| + | suma |
| - | resta |
| \\* | mutiplicación |
| / | división |
| % | resto |
| ** | potencia |
| += | suma y asigna |
| -= | resta y asigna |
| *= | mutiplica y asigna |
| \/= | divide y asigna |
| \%= | resto y asigna |

## Imprime por pantalla el id de usuario, si es root será 0
```
[root@serverlinux ~]# id -u
0
```

## Mantenimiento de usuarios
### Crear usuario
```
[root@serverlinux ~]# useradd lroca
```

### Crear grupo
```
[root@serverlinux ~]# groupadd docker
```

### Añadir usuario a grupo
```
[root@serverlinux ~]# usermod -aG docker lroca
```
| Argument | Description |
|:--------:| ----------- |
| -a | append (sin la -a, remplaza) |
| -G | define el grupo como secundario |
| -g | define el grupo como primario |


## Grep
Imprime las lineas que contenga el argumento
| Argument | Description |
|:--------:| ----------- |
| -r | Busca recursivamente. |
| -i | Ignore case sensetive. |
| -v | Invert match. |
| -c | Output count of matching lines only. |
| -l | Output matching files only. |
| -n | Precede each matching line with a line number. |
| -b | A historical curiosity: precede each matching line with a block number. |
| -h | Output matching lines without preceding them by file names. |
| -s | Suppress error messages about nonexistent or unreadable files. |
| -f | file: Take regexes from a file. |
| -o | Output the matched parts of a matching line. |
| --help | Get help. |
| -V, --version | Show version. |
| --regexp=pattern | in addition to -e pattern. |
| --word-regexp | in addition to -w. |
| --line-regexp | in addition to -x. |
| -A num | num lines to show After grep line. |
| -B num | num lines to show Before grep line. |
| -C num | num lines to show Context(after and before) grep line. |
```
[user@serverlinux ~]$ grep error /var/log/app.log
```
Grep también puede ser complementado con la salida del comando anterior gracias al pipe "|"
```
[user@serverlinux ~]$ cat /var/log/app.log | grep error
```

## $?
Devuelve 0 si el comando anterior se ejecutó correctamente.
```
[user@serverlinux ~]$ mkdir test01
[user@serverlinux ~]$ echo "$?"
0
```
Devuelve 1 si el comando anterior no se ejecutó correctamente.
```
[user@serverlinux ~]$ ls /path/do/not/exist
[user@serverlinux ~]$ echo "$?"
1
```
Devuelve 127 si el comando anterior no existe.
```
[user@serverlinux ~]$ dfajsdlf
[user@serverlinux ~]$ echo "$?"
127
```

## /dev/null
Devuelve la salida a /dev/null (a nada) y la salida de errores la redirige a stdoutput
```
[user@serverlinux ~]$ echo "Hola" > /dev/null 2<&1
```

## Mostrar/Ocultar el cursor
Muestra el cursor
```
tput cnorm
```
Ocultar el cursor
```
tput civis
```

## Formatear salida con echo
La salida la podemos imprimir con el comando echo
```
[root@serverlinux ~]# echo "Soy lroca"
```
### Parámetros
| Argument | Description |
|:--------:| ----------- |
| -e | Interpreta el carácter \\ como acción |
| -n | No hace un "intro" de después de imprimir |

### Formatos \
| Argument | Description |
|:--------:| ----------- |
| \b | Quita los espacios en blanco |
| \n | Salto de línea |
| \t | Tabulación |
| \v | Sangría a la derecha |
| \r | Vuelve el cursor al principio de la linea |
| \c | El prompt continúa |
| \a | Alerta de sonido ¿? |
| \e\[0;31m | Color Rojo |


## Trap
Trap ejecuta una funcion dependiendo de la señal con la que ha finalizado el proceso, en este caso interrupción (ctrl+c)<br>
Para ver el listado de señales con los que puede finalizar un proceso: INT, EXIT, TERM...
```
[user@serverlinux ~]$ kill -l
```
INT es cuando se interrumpe un proceso (equivalente al típico ctrl+C)
```
trap control_c INT

control_c () {
        echo -e "\nAdioooos!!"
        exit 1
}

La función control_c se ejecuta cuando el script como proceso se detiene con señal INTerrumpida.
```

## getops
```
[user@serverlinux ~]$ ./script.sh -n lroca -c Mallorca
I am lroca
And I live in Mallorca
```
Code:
```
while getopts n:c: opt
do
    case "$opt" in
          n) name=$OPTARG;;
          c) country=$OPTARG
     esac
done

echo "I am $name";
echo  "And I live in $country";


$OPTARG captura los argumentos pasados en los parámetros
```

## find
```
[user@serverlinux ~]$ find <directory_path> <search_parameter>
```
| Argument | Description |
|:--------:| ----------- |
| -name, -iname | Quita los espacios en blanco |
| -type f/d/l | tipo de objeto file, dir, link |
| -empty, -size b, k, M, G | Tamaño del archivo (+100G) |
| -ctime, -mtime, -atime s,m,h,d,M | Tiempo de creación, modificación, acceso (+30d) |
| -user, -group | Usuarios y grupos especificos |
| -perm | Permisos especificos (775) |
| -and | Y |
| -or | O |
| -not | Inversa |
| -maxdepth | Máxima profundidad de recursión |
| -mindepth | Mínima profundidad de recursión |
| -exec | Ejecuta el -exec al resultado del find (como el xargs) |
| -ok | Lo mismo que -exec pero con confirmaci |

## xargs
La salida del comando anterior se utilizará como argumento en el parámetro de xargs
[user@serverlinux ~]$ find . -name archivo.txt | xargs cat
[user@serverlinux ~]$ ls kernel* | xargs rm -f


## cut
Recorta la salida con el formato deseado.
[user@serverlinux ~]$ echo "Hola-Mundo-Como-Estás" | cut -d "-" -f2
Mundo

| Argument | Description |
|:--------:| ----------- |
| -f | fields |
| -c | characters |
| -d | delimiter |

## tr
Remplaza los characters de la salida del comando anterior con el formato deseado.<br>
La primera opción indica que quieres reemplazar y la segunda a qué.
```
[user@serverlinux ~]$ echo "Hola mundo!" | tr "[OPCIONES]" "[OPCIONES]"
[user@serverlinux ~]$ echo "Hola mundo!" | tr "[:lower:]" "[:upper:]"
```
| Argument | Description |
|:--------:| ----------- |
| -c | Contrario, el que no sea... |
| -d | Delete (elimina los caracteres del set1) |
| -s | Sustituye las secuencias de repetidas occurrencias |

| Opciones | Description |
|:--------:| ----------- |
| \[:lower:] | Todas las mayusculas |
| \[:upper:] | Characters |
| \[:digit:] | Delimiter |
| \[:space:], [:blank:] | Todos los espacios en blanco horizontales |
| \[:alpha:] | Todas las letras |
| \[:alnum:] | Todas las letras y numeros |


Todas las minusculas a mayusculas
```
[user@serverlinux ~]$ echo "Hola mundo!" | tr "[:lower:]" "[:upper:]"
```
Todo lo que no contecga A me lo pones a t
```
[user@serverlinux ~]$ echo "Abc123d56E" | tr -c 'A' 't'
```
Las secuencias de ' ' me las sustituyes por un ' ' 
```
[user@serverlinux ~]$ echo "GNU     \    Linux" | tr -s ' '
```

## sed
Edita el texto de un archivo.
```
[user@serverlinux ~]$ sed -i 's/Microsoft Windows/GNU Linux/2' fichero.txt
```
s sustitución<br>
/ delimitadores
- primera posición del delimitador es el patrón de búsqueda
- segunda posición del delimitador es la cadena de remplazo
- tercera posición del delimitador es el numero de apariciones que actuará, en este caso 2. Utilizamos 'g' para todas las apariciones.


Podemos indicar que línea especifica debe acutar
```
[user@serverlinux ~]$ sed '5 s/Microsoft Windows/GNU Linux/2' fichero.txt
```

Podemos indicar un rango de lineas donde debe acutar
```
[user@serverlinux ~]$ sed '5,10 s/Microsoft Windows/GNU Linux/2' fichero.txt
```

Podemos eliminar una fila de un fichero
```
[user@serverlinux ~]$ sed '5d' fichero.txt
```

Podemos eliminar un rango de filas de un fichero
```
[user@serverlinux ~]$ sed '5,10d' fichero.txt
```

-i se aplica los cambios en el archivo, en caso contrario solo se ve reflejado en el output
```
[user@serverlinux ~]$ sed -i 's/^que .*$/el contenido de la línea ha sido reemplazado/' sedexamples.txt
```

> El carácter \ convierte el siguiente caracter en str. Ejemplo --> \/<br>
> / será un string y no un limitador


## tcpdump
Este comando captura los paquetes que viajan por la red. Mas tarde, estos paquetes se pueden analizar con wireshark
```
[user@serverlinux ~]$ tcpdump <argumentos>
```

| Opciones | Description |
|:--------:| ----------- |
| -w | Donde output podemos poner el nombre/ubicación donde se guarda el archevo |
| host \<host\> | Analiza los paquetes entrantes  y salientes del host |
| port \<nº puerto\> | Filtra los paquetes y caputura solo los del puerto definido |
| -v, -vv | Muestra más detalle en la salida del comando |
| src | Solo captura los paquetes de origen en la comunicación |
| dest | Solo captura los paquetes de destinatario en la comunicación |
| -i | Para que escuche por una interfaz de red especifica |
Más info en --> https://danielmiessler.com/study/tcpdump/

## rlwrap
Hace un historico de comandos para utilizar las fechas de arriba y abajo y cambiar de comando mas rapido
```
[user@serverlinux ~]$ rlwrap
```

# awk
Imprime la primera columna (por defecto el delimitador es el espacio)
```
[user@serverlinux ~]$ ps | awk '{print $1}'
```
    
Imprime la primera columna pero NO la primera fila, NR --> Number Row
```
[user@serverlinux ~]$ ps | awk 'NR>1{print $2}'
```

Cambiar el delimitador -F ":"
```
[user@serverlinux ~]$ cat /etc/passwd | awk -F ":" '{print $1}'
```

Mostrar coincidencias (como un grep)
```
[user@serverlinux ~]$ cat fichero.txt | awk '/^tmpfs/ {print}'
```

Contar el numero de líneas (como un wc -l)
```
[user@serverlinux ~]$ cat fichero.txt | awk '{print NR}' /etc/shells
```

Imprimir la primera/rango linea
```
[user@serverlinux ~]$ cat fichero.txt | awk 'NR==1{print $0}'
[user@serverlinux ~]$ cat fichero.txt | awk 'NR>2{print $0}'
[user@serverlinux ~]$ cat fichero.txt | awk 'NR==2, NR==4 {print $0}'
```

## Crear un servicio en linux.(link tuto tomcat service )


## Personalizar prompt
Se configura en `~/.bashrc` con la variable `PS1=""`

| Argument | Description |
|:--------:| ----------- |
| \u | Nombre del usuario actual. |
| \h | Nombre del host hasta el primer punto (.), por ejemplo, orion del host orion.zeppelinux.es. |
| \H | Nombre del host completo. |
| \w | Path del directorio de trabajo actual. |
| \W | Nombre del directorio de trabajo actual. |
| \d | Fecha actual en formato (dia_semana mes día, lun jul 27. |
| \t | Hora actual en formato 24 horas (HH:MM:SS). |
| \T | Hora actual en formato 12 horas (HH:MM:SS). |
| \@ | Hora actual en formato 12 horas (am/pm). |
| \n | Nueva línea. |
| \r | Retorno de carro (enter/intro). |
| \s | Nombre de la shell. |
| \v | Versión de bash. |
| \V | Numero de la release de bash. |
| \! | Número en el historial del comando ejecutado. |
| \# | Número de comando de este comando. |
| \$ | Si se trada de un usuario normal, aparece un $. Si se trata del usuario root, aparece un #. |
| \\ | Barra diagonal. |
| \[ | Inicio de una secuencia de caracteres no imprimibles. |
| \] | Fin de una secuencia de caracteres no imprimibles. |


## Expresiones regulares (regexp)
https://www.tutorialspoint.com/unix/unix-regular-expressions.htm

## NetworkManager
NetworkManager es un servicio para configurar la red
```
[root@linuxserver ~]# systemctl status NetworkManager
[root@linuxserver ~]# systemctl start NetworkManager
[root@linuxserver ~]# systemctl stop NetworkManager
[root@linuxserver ~]# systemctl restart NetworkManager
[root@linuxserver ~]# systemctl enable NetworkManager
```
Para ver las conexiones configuradas
```
[root@linuxserver ~]# nmcli connection show
```

Para añadir nueva conexión
```
[root@linuxserver ~]# nmcli con add con-name eth0 ifname ens192 type ethernet ip4 192.168.100.25/24
```

Para editar una conexión
```
[root@linuxserver ~]# nmcli connection edit ens192
nmcli> set connection.autoconnect yes
nmcli> set ipv4.method manual
nmcli> set ipv4.addresses 192.168.253.11/24
nmcli> set ipv4.gateway 192.168.253.254
nmcli> set ipv4.dns 192.168.253.61,192.168.253.62
nmcli> set ipv4.dns-search riu.net
nmcli> set ipv6.method disabled
nmcli> remove connection.permissions
nmcli> remove ipv6.addr-gen-mode
nmcli> save
nmcli> activate ens192
nmcli> quit
```

Para eliminar una conexión
```
[root@linuxserver ~]# nmcli connection delete eth0
```

