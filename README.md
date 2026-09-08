# Batas Wilayah Kepolisian (GeoJSON)

Batas wilayah Polda, Polres, dan Polsek untuk dashboard **PETA KRIMINALITAS** (visual Icon Map, Power BI).

## Berkas

### Untuk dashboard — dicocokkan lewat `GID`

| Berkas | Fitur | Ukuran | Kunci pencocokan |
|---|---|---|---|
| `polda.json` | 38 | 7,4 MB | `GID_1` = kode satker Polda |
| `polres.json` | 511 | 12,8 MB | `GID_2` = kode satker Polres |
| `polsek.json` | 5.236 | 21,4 MB | `GID_3` = kode satker Polsek |

Setiap fitur memuat `GID_0..GID_3` (kode satker), `NAME_0..NAME_3` (nama satker),
serta `KODE_SATUAN` dan `NAMA_SATUAN` sesuai master resmi.

### Untuk pelaporan — berkunci kode satuan resmi

| Berkas | Fitur | Ukuran |
|---|---|---|
| `Lampiran_B_Polda.geojson` | 36 | 7,2 MB |
| `Lampiran_B_Polres.geojson` | 511 | 12,9 MB |
| `Lampiran_B_Polsek.geojson` | 5.236 | 22,3 MB |

Ketiganya berkunci `Kode Satuan` Lampiran B (Master Kode Satuan Polri) dan membawa
14 kolom master — Nama Satuan, ID Satuan, Polda & Polres Induk, Provinsi, Kabupaten/Kota,
Kecamatan — plus `Luas_km2`. Bisa dipakai langsung tanpa tabel perantara.

## Cakupan terhadap master satker

| Tingkat | Baris master | Berpoligon | Cakupan |
|---|---|---|---|
| Polda | 36 | 36 | 100% |
| Polres | 514 | 511 | 99,4% |
| Polsek | 5.454 | 5.236 | 96,0% |

Bareskrim Polri tidak punya poligon karena memang tidak berwilayah teritorial.

**Tiga Polres tanpa poligon** adalah baris kode lama Polda Papua yang wilayahnya sudah
pindah ke kode Polda Papua Tengah: `060.01.32.24` → `060.01.37.01` (Intan Jaya),
`060.01.32.26` → `060.01.37.04` (Puncak), `060.01.32.16` → `060.01.37.05` (Puncak Jaya).
Master masih memuat kedua kode; wilayahnya hanya boleh dimiliki satu, dan yang dipakai
adalah kode Polda Papua Tengah karena ketiga kabupatennya memang berada di provinsi itu.

**218 Polsek tanpa poligon** adalah satuan yang namanya tidak sepadan dengan kecamatan
mana pun di dalam Polres induknya — umumnya Polsek bernama kota/kawasan (mis. Polsek
Sibuhuan, Polsek Kawasan Pelabuhan Sampit) atau dua Polsek yang berbagi satu kecamatan.
Melengkapinya butuh daftar kecamatan/desa per Polsek dari Polri, bukan tebakan nama.

## Pemekaran Polda Papua

Wilayah Papua sudah dipecah menjadi enam Polda:

| Kode | Polda |
|---|---|
| `060.01.32` | Papua |
| `060.01.33` | Papua Barat |
| `060.01.36` | Papua Barat Daya |
| `060.01.37` | Papua Tengah |
| `060.01.38` | Papua Selatan |
| `060.01.39` | Papua Pegunungan |

**Catatan:** untuk sebagian Polres di wilayah pemekaran, `GID_1` (Polda) sengaja berbeda
dari awalan `GID_2`-nya — misalnya Polres Nabire berkode `060.01.32.15` tetapi induknya
`060.01.37` (Polda Papua Tengah). Ini karena master satker belum memindahkan Polres-nya.
Bukan kesalahan.

## Pemakaian

Isi properti **GeoJSON URL** pada visual Icon Map dengan alamat raw berkas ini.
Wajib HTTPS — visual berjalan di dalam sandbox HTTPS sehingga alamat `http://`
diblokir peramban sebagai *mixed content*.

## Sumber dan lisensi

Poligon dasar dikembangkan dari data batas wilayah publik, lalu kode satkernya
diselaraskan dengan master satker Polri dan wilayah Papua disesuaikan dengan pemekaran Polda.

Penambalan wilayah yang belum berpoligon memakai dua sumber berikut.

**Batas kecamatan dan kabupaten/kota** — [`cahyadsn/wilayah_boundaries`](https://github.com/cahyadsn/wilayah_boundaries),
sesuai Kepmendagri No. 300.2.2-2430 Tahun 2025. Lisensi MIT:

> MIT License — Copyright (c) 2025 cahya dsn
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of this
> software and associated documentation files (the "Software"), to deal in the Software
> without restriction, including without limitation the rights to use, copy, modify, merge,
> publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
> to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or
> substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
> INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
> PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
> FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN THE SOFTWARE.

**Kawasan pelabuhan dan bandara** (Polres Pelabuhan Tanjung Priok, Polres Kawasan Bandara
Ngurah Rai) — © OpenStreetMap contributors, tersedia di bawah
[Open Database License (ODbL)](https://www.openstreetmap.org/copyright).
