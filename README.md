# Batas Wilayah Kepolisian (GeoJSON)

Batas wilayah Polda, Polres, dan Polsek untuk dashboard **PETA KRIMINALITAS** (visual Icon Map, Power BI).

## Berkas

| Berkas | Fitur | Ukuran | Kunci pencocokan |
|---|---|---|---|
| `polda.json` | 38 | 4,7 MB | `GID_1` = kode satker Polda |
| `polres.json` | 559 | 8,6 MB | `GID_2` = kode satker Polres |
| `polsek.json` | 5.634 | 18,7 MB | `GID_3` = kode satker Polsek |

Setiap fitur memuat `GID_0..GID_3` (kode satker) dan `NAME_0..NAME_3` (nama satker).
Visual mencocokkan poligon lewat **kode**, bukan nama.

## Cakupan terhadap master satker

| Tingkat | Master | Berkode di sini | Belum ada poligon |
|---|---|---|---|
| Polda | 38 wilayah | 38 | 0 |
| Polres | 487 | 485 | 3 |
| Polsek | 4.870 | 4.780 | 101 |

Polda sudah lengkap 100%. Bareskrim Polri tidak punya poligon karena memang
tidak berwilayah teritorial.

Tiga Polres yang belum punya poligon: Pelabuhan Tanjung Priok (Polres pelabuhan,
tanpa wilayah kabupaten), Manggarai Timur, dan Manokwari Selatan.

## Pemekaran Polda Papua

Wilayah Papua sudah dipecah menjadi enam Polda:

| Kode | Polda | Polres |
|---|---|---|
| `060.01.32` | Papua | 10 |
| `060.01.33` | Papua Barat | 6 |
| `060.01.36` | Papua Barat Daya | 5 |
| `060.01.37` | Papua Tengah | 8 |
| `060.01.38` | Papua Selatan | 4 |
| `060.01.39` | Papua Pegunungan | 9 |

Poligon keenam Polda dibangun dari gabungan poligon Polres anggotanya.

**Catatan:** untuk Polres di wilayah pemekaran, `GID_1` (Polda) sengaja berbeda
dari awalan `GID_2`-nya — misalnya Polres Nabire berkode `060.01.32.15` tetapi
induknya `060.01.37` (Polda Papua Tengah). Ini karena master satker belum
memindahkan Polres-nya. Bukan kesalahan.

## Pemakaian

Isi properti **GeoJSON URL** pada visual Icon Map dengan alamat raw berkas ini.
Wajib HTTPS — visual berjalan di dalam sandbox HTTPS sehingga alamat `http://`
diblokir peramban sebagai *mixed content*.

## Sumber

Dikembangkan dari poligon dasar publik, lalu kode satkernya diselaraskan dengan
master satker Polri dan wilayah Papua disesuaikan dengan pemekaran Polda.
