BEGIN {FS = ","
        choice = ARGV[2]
        ARGV[2] = ""
        age = 0
      }

        NR > 1 {
           if (choice == "a") {
                count++
           }

           if (choice == "b") {
                gerbong[$4] = 1
           }

           if (choice == "c") {
                if ($2 > age) {
                   age = $2
                   oldest = $1
                }
           }
if (choice == "d") {
                sum += $2
                count++
           }

           if (choice == "e") {
                if ($3 == "Business") {
                        business++
                }
           }
        }

END {
        if (choice == "a") {
                print "Jumlah seluruh penumpang KANJ adalah " count " orang"
        }
        else if (choice == "b") {
                for (i in gerbong) jumlah++
                print "Jumlah gerbong penumpang KANJ adalah " jumlah
                }
        else if (choice == "c") {
                print oldest " adalah penumpang kereta tertua dengan usia " age " tahun"
                }
 else if (choice == "d") {
                if (count > 0) {
                   average = int(sum/count)
                   print "Rata-rata usia penumpang adalah " average " tahun"
                   }
        }
        else if (choice == "e") {
                print "Jumlah penumpang business class ada " business " orang"
        }
        else {
             print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
             print "Contoh penggunaan: awk -f file.sh data.csv a"
        }
}
