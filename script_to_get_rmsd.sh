for mut in anymutants(for example M188I)
do
cd $mut
 #echo "mol new $mut\Soluteonly.gro type gro   " > $mut-rmsd.tcl     (change the name of the .gro file)
 #echo "mol addfile prod-$mut-400ns-nopbc-notwat.xtc type xtc skip 20 waitfor all molid 0 " >> $mut-rmsd.tcl  (change the name of the xtc file)
 echo " " >> $mut-rmsd.tcl
 echo "#RMSD for protein whole backbone " >> $mut-rmsd.tcl
 echo "set outfile [open \"$mut-proteinBBrmsd.txt\" w ] " >> $mut-rmsd.tcl
 echo "set reftormsd [atomselect 0 \"protein and backbone and noh\" frame 0] " >> $mut-rmsd.tcl
 echo "set num_steps [molinfo top get numframes] " >> $mut-rmsd.tcl
 echo "for {set frame 0} {\$frame < \$num_steps} {incr frame} { " >> $mut-rmsd.tcl
 echo "        set all [atomselect top \"noh\" frame \$frame] " >> $mut-rmsd.tcl
 echo "        set comparetormsd [atomselect top \"protein and backbone and noh\"] " >> $mut-rmsd.tcl
 echo "        \$comparetormsd frame \$frame " >> $mut-rmsd.tcl
 echo "        set trans_mat [measure fit \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        \$all move \$trans_mat " >> $mut-rmsd.tcl
 echo "        set rmsd [measure rmsd \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        puts \$outfile \"\$frame \$rmsd\" " >> $mut-rmsd.tcl
 echo "        \$all delete " >> $mut-rmsd.tcl
 echo "        \$comparetormsd delete " >> $mut-rmsd.tcl
 echo "} " >> $mut-rmsd.tcl
 echo "puts \"Done for protein\" " >> $mut-rmsd.tcl
 echo "\$reftormsd delete " >> $mut-rmsd.tcl
 echo "close \$outfile  " >> $mut-rmsd.tcl
 echo " " >> $mut-rmsd.tcl
 #echo "#RMSD for nucleic backbone " >> $mut-rmsd.tcl     (if there is no DNA then skip this nucleic calculation)
 echo "set outfile [open \"$mut-nucleicBBrmsd.txt\" w ] " >> $mut-rmsd.tcl
 echo "set reftormsd [atomselect 0 \"nucleic and backbone and noh\" frame 0] " >> $mut-rmsd.tcl
 echo "set num_steps [molinfo top get numframes] " >> $mut-rmsd.tcl
 echo "for {set frame 0} {\$frame < \$num_steps} {incr frame} { " >> $mut-rmsd.tcl
 echo "        set all [atomselect top \"noh\" frame \$frame] " >> $mut-rmsd.tcl
 echo "        set comparetormsd [atomselect top \"nucleic and backbone and noh\"] " >> $mut-rmsd.tcl
 echo "        \$comparetormsd frame \$frame " >> $mut-rmsd.tcl
 echo "        set trans_mat [measure fit \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        \$all move \$trans_mat " >> $mut-rmsd.tcl
 echo "        set rmsd [measure rmsd \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        puts \$outfile \"\$frame \$rmsd\" " >> $mut-rmsd.tcl
 echo "        \$all delete " >> $mut-rmsd.tcl
 echo "        \$comparetormsd delete " >> $mut-rmsd.tcl
 echo "} " >> $mut-rmsd.tcl
 echo "puts \"Done for nucleic\" " >> $mut-rmsd.tcl
 echo "close \$outfile " >> $mut-rmsd.tcl
 echo " " >> $mut-rmsd.tcl
 echo "#RMSD for protein backbone Nterminal " >> $mut-rmsd.tcl
 echo "set outfile [open \"$mut-Nterm-proteinBBrmsd.txt\" w ] " >> $mut-rmsd.tcl
 #echo "set reftormsd [atomselect 0 \"protein and resid 1 to 75 and backbone\" frame 0] " >> $mut-rmsd.tcl  (change the residue of Nterminal according to your protein)
 echo "set num_steps [molinfo top get numframes] " >> $mut-rmsd.tcl
 echo "for {set frame 0} {\$frame < \$num_steps} {incr frame} { " >> $mut-rmsd.tcl
 echo "        set all [atomselect top \"noh\" frame \$frame] " >> $mut-rmsd.tcl
 echo "        set comparetormsd [atomselect top \"protein and resid 1 to 75 and backbone\"] " >> $mut-rmsd.tcl
 echo "        \$comparetormsd frame \$frame " >> $mut-rmsd.tcl
 echo "        set trans_mat [measure fit \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        \$all move \$trans_mat " >> $mut-rmsd.tcl
 echo "        set rmsd [measure rmsd \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        puts \$outfile \"\$frame \$rmsd\" " >> $mut-rmsd.tcl
 echo "        \$all delete " >> $mut-rmsd.tcl
 echo "        \$comparetormsd delete " >> $mut-rmsd.tcl
 echo "} " >> $mut-rmsd.tcl
 echo "puts \"Done for N-terminal protein\" " >> $mut-rmsd.tcl
 echo "\$reftormsd delete " >> $mut-rmsd.tcl
 echo "close \$outfile " >> $mut-rmsd.tcl
 echo " " >> $mut-rmsd.tcl
 echo "#RMSD for protein backbone Cterminal " >> $mut-rmsd.tcl
 echo "set outfile [open \"$mut-Cterm-proteinBBrmsd.txt\" w ] " >> $mut-rmsd.tcl
 #echo "set reftormsd [atomselect 0 \"protein and resid 80 to 229 and backbone\" frame 0] " >> $mut-rmsd.tcl   (change the residue of Cterminal according to your protein)
 echo "set num_steps [molinfo top get numframes] " >> $mut-rmsd.tcl
 echo "for {set frame 0} {\$frame < \$num_steps} {incr frame} { " >> $mut-rmsd.tcl
 echo "        set all [atomselect top \"noh\" frame \$frame] " >> $mut-rmsd.tcl
 echo "        set comparetormsd [atomselect top \"protein and resid 80 to 229 and backbone\"] " >> $mut-rmsd.tcl
 echo "        \$comparetormsd frame \$frame " >> $mut-rmsd.tcl
 echo "        set trans_mat [measure fit \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        \$all move \$trans_mat " >> $mut-rmsd.tcl
 echo "        set rmsd [measure rmsd \$comparetormsd \$reftormsd] " >> $mut-rmsd.tcl
 echo "        puts \$outfile \"\$frame \$rmsd\" " >> $mut-rmsd.tcl
 echo "        \$all delete " >> $mut-rmsd.tcl
 echo "        \$comparetormsd delete " >> $mut-rmsd.tcl
 echo "} " >> $mut-rmsd.tcl
 echo "puts \"Done for C-terminal protein\" " >> $mut-rmsd.tcl
 echo "\$reftormsd delete " >> $mut-rmsd.tcl
 echo "close \$outfile " >> $mut-rmsd.tcl
 echo "exit " >> $mut-rmsd.tcl

 vmd -dispdev text -eofexit -e $mut-rmsd.tcl

done
