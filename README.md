# SISOP-1-2026-IT-039

## Laporan Resmi Modul 1 Sisop oleh Elisabeth L. S. S. | 039

### Soal 1
### Penjelasan
Soal meminta kita untuk membantu menganalisis data penumpang KANJ (Kereta Argo Ngawi Jesgejes) menggunakan cmd Linux dan bantuan awk. Beberapa hal yang diminta adalah,

  a. Total penumpang KANJ hari itu  
  b. Jumlah gerbong yang beroperasi hari itu  
  c. Menemukan siapa penumpang tertua di KANJ hari itu  
  d. Rata-rata usia penumpang KANJ hari itu  
  e. Banyaknya penumpang business class KANJ hari itu
  (+) Pesan untuk contoh penulisan command

#### Menginisiasi kode dengan BEGIN
```
BEGIN {FS = ","
        choice = ARGV[2]
        ARGV[2] = ""
        age = 0
      }
```
: `BEGIN` digunakan untuk mempersiapkan variabel yang nanti akan digunakan.  
: `FS` adalah Field Separator, artinya file `passenger.csv` akan dibaca berdasarkan tanda koma (,).  
: `choice = ARGV[2]` berarti mengambil array kedua dari command di terminal, yang artinya adalah pilihan analisis kita (a-e).  
: `ARGV[2] = ""` dibuat kosong agar tidak error karena nanti sistem akan membaca array kedua sebagai file bukan input.  
: `age` diinisiasi sebagai 0 menjadi umur tertinggi untuk sementara.

#### a. Total penumpang KANJ hari itu
```
NR > 1 {
  if (choice == "a") {
    count++
  }
```

: `NR > 1` artinya untuk Nomor Baris lebih dari 1, dan akan dijalankan untuk tiap pemilihan input (a-e), karena NR = 1 adalah header kategori maka tidak diikutsertakan ke proses analisis.  
: Jika `choice = a`, maka setiap baris data variabel `count` akan melakukan increment berarti akhir baris adalah jumlah penumpang KANJ.

#### b. Jumlah gerbong yang beroperasi hari itu 
```
NR > 1 {
  ...
  if (choice == "b") {
    gerbong[$4] = 1
  }
```

: `[$4]` artinya kolom ke-4 di `passenger.csv` yang merupakan kolom gerbong.  
: Jika `choice = b`, maka array gerbong akan menghitung tiap jumlah gerbong unik.

#### c. Menemukan siapa penumpang tertua di KANJ hari itu
```
NR > 1 {
  ...
  if (choice == "c") {
    if ($2 > age) {
      age = $2
      oldest = $1
      }
  }
```

: `$2` artinya kolom ke-2 di `passenger.csv` yang merupakan kolom usia.  
: `$1` artinya kolom ke-1 di `passenger.csv` yang merupakan kolom nama penumpang.  
: Jika `choice = c`, maka akan masuk ke situasi looping selanjutnya jika `$2 > age`, maka variabel `age` akan menyimpan `$2` tersebut dan variabel `oldest` akan menyimpan nama penumpang sesuai array yang sedang di-screening.

#### d. Rata-rata usia penumpang KANJ hari itu 
```
NR > 1 {
  ...
  if (choice == "d") {
    sum += $2
    count++
  }
```

: Jika `choice = d`, maka variabel `sum` akan menyimpang jumlah `$2` dan variabel `count` akan menyimpan banyak data yang ada.  
: Nanti akan dipakai untuk penghitungan rata-rata di bagian `END`.

#### e. Banyaknya penumpang business class KANJ hari itu
```
NR > 1 {
  ...
  if (choice == "e") {
    if ($3 == "Business") {
      business++
    }
  }
}
```

: Jika `choice = e`, maka akan terjadi looping jika `$3` berisi "Business", maka variabel `business` akan increment dan menghasilkan jumlah kelas "Business" yang ada.

#### Bagian END
```
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
```

: Bagian `END` dijalankan setelah seluruh isi file sudah dibaca, dijadikan tempat memberikan output.  

### Output
