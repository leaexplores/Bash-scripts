###############################################################
# Written by Mathieu Rhéaume				      #
# Location Québec, Canada.				      #
# Date 5 Avril 2011					      #
###############################################################
#!/bin/sh
###############################################################
#Ceci est un petit script pour démontrer différents opérateurs#
#Various operators test scripts to show their usage.	      #
###############################################################
#Fonctions voir plus bas pour le programme		      #
###############################################################

function directoryTest {
echo "Test des opérateurs de répertoires"
echo "Test de test -f /bof si le fichier existe"
test -f /bof
echo $?
echo "Test de test -d /boot si le dossier existe"
test -d /boot
echo $?
}

function chaineCaractereTest {
echo "Test de comparaison de chaine de caractère"
variable1="Hello"
variable2="Awesome"
variable3="Awesome"
echo "La variable 1 vaut $variable1 "
echo "La variable 2 vaut $variable2 "
echo "La variable 3 vaut $variable3"
echo "=============================================================="
echo "Est-ce que les deux chaines son pareil?"
echo "variable 1 vs variable 2 (Faux pas pareil)"
test "variable1" = "variable2"
echo $?
echo "Variable 1 vs Variable 2 (Vrai)"
test "variable2" = "variable3"
echo $?
echo "Est-ce que variable1 est vide?"
test -n "$variable1"
echo $?
echo "Est-ce que variable1 est remplis?"
test -z "$variable1"
echo $?
}

function comparaisonNombre {
echo "Test de comparaison de nombres "
echo "=============================================================="
a=5
b=10
echo "Variable1 $a et Variable2 $b"
echo "Si b plus grand que a"
test $b -gt $a
echo $?
echo "Si b est équal à a (Faux)"
test $b -eq $a
echo $?
echo "Si b est non égal à a"
test $b -ne $a
echo $?
echo "Si b est plus petit ou équal à a"
test $b -le $a
echo $?
}

function ifTest {
echo "Test de comparaison avec IF"
echo "ATTENTION ** Tout les test qui ont été réalisé au paravant"
echo "ATTENTION ** Auraient pu être réalisé avec le IF comme l'exemple suivant"
echo "=============================================================="
echo "Test si /bof n'existe pas et si a est équal à 5 (Vrai)"
test ! -f /bof -a $a -eq 5
echo $?
echo "Test de si b est équal à 20 alors dis bonjours! sinon si a = 5 alors Toto sinon Beurk"
if [ $b -eq 20 ]
then
	echo "Le résultat est : Bonjours"
elif [ $a -eq 5 ]
then
	echo "Le résultat est : Toto"
else
	echo "Le résultat est : Beurk"
fi
}

function entrePourContinuer {
echo "=============================================================="
echo "Appuyez sur entrée pour continuer."
echo "=============================================================="
read
clear
}

# Début du programme
clear
directoryTest
entrePourContinuer
chaineCaractereTest 
entrePourContinuer
comparaisonNombre
entrePourContinuer
ifTest
echo "=============================================================="
echo "Fin du programme. Appuyez sur entrée pour quitter."
echo "=============================================================="
read
clear
