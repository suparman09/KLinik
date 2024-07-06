-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2024 pada 16.52
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berobat`
--

CREATE TABLE `berobat` (
  `id_berobat` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `tgl_berobat` date DEFAULT NULL,
  `keluhan_pasien` varchar(255) DEFAULT NULL,
  `hasil_diagnosa` varchar(255) DEFAULT NULL,
  `penatalaksanaan` enum('Rawat jalan','Rawat inap','Rujuk','Lainya') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berobat`
--

INSERT INTO `berobat` (`id_berobat`, `id_pasien`, `id_dokter`, `tgl_berobat`, `keluhan_pasien`, `hasil_diagnosa`, `penatalaksanaan`) VALUES
(1, 1, 2, '2024-07-10', '  banyak    batuk                                                                                                        ', '  lambung                                                                                                            ', 'Rawat inap'),
(2, 2, 2, '2024-07-17', ' sakit kepala                                     ', 'muntah                                      ', 'Rujuk'),
(4, 1, 1, '2024-07-01', NULL, NULL, NULL),
(5, 1, 1, '2024-07-01', ' s                                                                                 ', '            sakit pinggang                                                                      ', 'Lainya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(5) NOT NULL,
  `nama_dokter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`) VALUES
(1, 'asasa asa'),
(2, 'aji mx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `nama_obat` varchar(100) DEFAULT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`nama_obat`, `id_obat`) VALUES
('bodrex migrain', 2),
('mixagrip', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(5) NOT NULL,
  `nama_pasien` varchar(50) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `umur` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `umur`) VALUES
(1, 'joni', 'L', 12),
(2, 'joni', 'L', 12),
(3, 'qwqemwe', 'L', 23);

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep_obat`
--

CREATE TABLE `resep_obat` (
  `id_resep` int(11) NOT NULL,
  `id_berobat` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `resep_obat`
--

INSERT INTO `resep_obat` (`id_resep`, `id_berobat`, `id_obat`) VALUES
(8, 2, 2),
(9, 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nama_lengkap` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Aji');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berobat`
--
ALTER TABLE `berobat`
  ADD PRIMARY KEY (`id_berobat`),
  ADD KEY `FK__pasien` (`id_pasien`),
  ADD KEY `FK__dokter` (`id_dokter`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `FK__berobat` (`id_berobat`),
  ADD KEY `FK__obat` (`id_obat`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berobat`
--
ALTER TABLE `berobat`
  MODIFY `id_berobat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `resep_obat`
--
ALTER TABLE `resep_obat`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `berobat`
--
ALTER TABLE `berobat`
  ADD CONSTRAINT `FK__dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD CONSTRAINT `FK__berobat` FOREIGN KEY (`id_berobat`) REFERENCES `berobat` (`id_berobat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
