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

#### Menginisiasi kode dengan BEGIN
```
BEGIN {FS = ","
        choice = ARGV[2]
        ARGV[2] = ""
        age = 0
      }
```

#### a. Total penumpang KANJ hari itu
Untuk menentukan total penumpang KANJ akan dibutuhkan 
