File name:  $[cat pokemon.awk] do 
echo "File name: $pokemon.awk"
done

Total pokemon: awk ' {sum += $1} END { print sum } ' pokemon.awk 

Avg. HP: awk ' {sum += $5} END { if (NR > 0 ) print sum / NR } ' pokemon.awk

Avg: Attack: awk ' { sum +=$6} END { if (NR > 0 ) print sum / NR } ' pokemon.awk

