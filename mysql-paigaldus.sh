#mysql-server paigaldusskript
#defineerib väärtust
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
#kui väärtus = 0
if [ $MYSQL -eq 0 ]; then
#siis ok installed pole leitud
#paigaldame teenuse
echo "Paigaldame mysql ja vajalikud lisad"
apt install mysql-server
#lisan võimaluse kasutada mysql käske ilma kasutaja ja parooli lisamiseta
touch $HOME/.my.cnf
echo "[client]" >>  $HOME/.my.cnf
echo "host = localhost" >>  $HOME/.my.cnf
echo "user = root" >>  $HOME/.my.cnf
echo "password = qwerty" >> $HOME/.my.cnf
#kui väärtus = 1
elif [ $MYSQL -eq 1 ]; then
#siis on ok installed leitud 1 kord
echo "mysql-server on juba paigaldatud"
mysql
fi
#lõpp
