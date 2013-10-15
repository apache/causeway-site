for a in `ls *.png`
do
b=`echo $a | cut -d. -f1`
echo "<div class=\"item\">"
echo "  <a href=\"#$b\">"
echo "    <img src=\"images/screenshots2/${a}\"></img>"
echo "  </a>"
echo "</div>"
done
