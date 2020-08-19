-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 19 Agu 2020 pada 13.40
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbakademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(8) NOT NULL,
  `kode_mk` char(8) NOT NULL,
  `nama_dosen` varchar(50) DEFAULT NULL,
  `ttl` text,
  `jk` varchar(1) NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `alamat` varchar(50) NOT NULL,
  `id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`nip`, `kode_mk`, `nama_dosen`, `ttl`, `jk`, `no_telp`, `alamat`, `id`) VALUES
('1010100', '10101', 'Milea ', '1983-11-30', 'P', '083123232332', 'Bandung', 1),
('1010200', '10102', 'Jessica', '1984-03-11', 'P', '084242947241', 'Jakarta', 2),
('1010300', '10103', 'mila', '1981-09-10', 'P', '0842724628362', 'Medan', 3),
('1010400', '10104', 'reza', '1980-11-02', 'L', '084292942841', 'Papua', 4),
('1010500', '10005', 'velly', '1997-04-09', 'L', '083212644291', 'aceh', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` char(8) NOT NULL,
  `nama_jurusan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
('1', 'TEKNIK INFORMATIKA'),
('2', 'TEKNIK SIPIL'),
('3', 'PERTANIAN'),
('4', 'AKUTANSI'),
('5', 'KEDOCTERAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `nama_mhs` varchar(30) DEFAULT NULL,
  `ttl` text NOT NULL,
  `jk` varchar(1) DEFAULT NULL,
  `no_telp` varchar(30) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `id_jurusan` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama_mhs`, `ttl`, `jk`, `no_telp`, `alamat`, `id_jurusan`) VALUES
(0, '10118023', 'rena', '', 'P', NULL, NULL, 'KEDOCTER'),
(1, '10118018', 'irman', '1998-30-11', 'L', '083284726383', 'Bandung', '1'),
(2, '10118019', 'lisa', '1997-04-06', 'P', '083742723842', 'Thailand', '2'),
(3, '10118020', 'jennie', '1994-07-12', 'P', '087428428392', 'Korea', '3'),
(4, '10118021', 'gery', '1997-04-08', 'L', '084729323252', 'Jakarta', '4'),
(5, '10118022', 'anne', '1998-03-04', 'P', '084287234257', 'Pranciss', '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` char(8) NOT NULL,
  `nama_mk` varchar(30) DEFAULT NULL,
  `sks` smallint(6) DEFAULT NULL,
  `semester` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`, `semester`) VALUES
('1001', 'Basis Data 2', 4, 4),
('1002', 'Metode Numerik', 3, 4),
('1003', 'Provis', 4, 4),
('1004', 'Rpl', 3, 4),
('1005', 'Kimia', 6, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `kode_mk` char(8) NOT NULL,
  `nim` char(8) NOT NULL,
  `uts` smallint(6) DEFAULT NULL,
  `uas` smallint(6) NOT NULL,
  `nip` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`kode_mk`, `nim`, `uts`, `uas`, `nip`) VALUES
('1001', '10118022', 80, 60, '1010100'),
('1002', '10118019', 80, 80, '1010500'),
('1003', '10118020', 70, 90, '1010200'),
('1004', '10118018', 80, 100, '1010400'),
('1005', '10118021', 80, 40, '1010300');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`,`nim`) USING BTREE,
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kode_mk`) USING BTREE,
  ADD KEY `nim` (`nim`),
  ADD KEY `nip` (`nip`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `mahasiswa` (`id_jurusan`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `nilai` (`nim`);

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `matakuliah` (`kode_mk`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
