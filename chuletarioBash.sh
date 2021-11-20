#!/bin/bash

#  ____ _           _      _             _       
# / ___| |__  _   _| | ___| |_ __ _ _ __(_) ___  
#| |   | '_ \| | | | |/ _ \ __/ _` | '__| |/ _ \ 
#| |___| | | | |_| | |  __/ || (_| | |  | | (_) |
# \____|_| |_|\__,_|_|\___|\__\__,_|_|  |_|\___/ 

# Estructuras de control

# Operadores
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

# if [[ "$a" < "$b" ]]
# if [ "$a" \< "$b" ]
# if [ "$a" -lt "$b" ]
# (("$a" < "$b"))


# If, else
if [ ¿? ]; then
    ¿?
else
    ¿?
fi

# While / until
while [ ¿? ]
do
    ¿?
done

# For
for i in ¿?
do
    ##
done

# Case
case i in
  A) ¿? ;;
  B) ¿? ;;
  C) ¿? ;;
esac
