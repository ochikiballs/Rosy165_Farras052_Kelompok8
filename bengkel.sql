-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Bulan Mei 2023 pada 19.21
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bengkel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_service`
--

CREATE TABLE `detail_service` (
  `kd_sparepart` varchar(10) NOT NULL,
  `harga` int(10) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `no_faktur` varchar(25) NOT NULL,
  `ongkos` int(10) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `detail_service`
--

INSERT INTO `detail_service` (`kd_sparepart`, `harga`, `jumlah`, `no_faktur`, `ongkos`, `subtotal`) VALUES
('SP0002', 20000, 2, '19081100001', 8000, 48000),
('SP0003', 200000, 2, '19081100001', 10000, 410000),
('SP0001', 175000, 1, '23052300001', 10000, 185000),
('SP0004', 60000, 1, '23052300001', 5000, 65000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_login` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `email`, `password`, `status`, `id_login`) VALUES
('OCY', 'ocy15@gmail.com', '1234', 'ADMIN', 'LG0002'),
('RIDHO ', 'ridho@gmail.com', '1234', 'ADMIN', 'LG0003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mekanik`
--

CREATE TABLE `mekanik` (
  `kd_mekanik` varchar(10) NOT NULL,
  `nm_mekanik` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `mekanik`
--

INSERT INTO `mekanik` (`kd_mekanik`, `nm_mekanik`, `alamat`, `no_telepon`) VALUES
('MK0001', 'DASUK', 'LEGOK NYENANG', 988765),
('MK0002', 'AWANG', 'sukabumii', 857987);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` varchar(10) NOT NULL,
  `nm_pelanggan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nm_pelanggan`, `alamat`, `no_telepon`) VALUES
('PL0001', 'ALWAN', 'SUKABUMI', 98765),
('PL0002', 'REVAN', 'SUKABUMI', 9876);

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_motor`
--

CREATE TABLE `service_motor` (
  `no_faktur` varchar(25) NOT NULL,
  `tanggal` date NOT NULL,
  `kd_pelanggan` varchar(10) NOT NULL,
  `kd_mekanik` varchar(10) NOT NULL,
  `no_polisi` varchar(15) NOT NULL,
  `keluhan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `service_motor`
--

INSERT INTO `service_motor` (`no_faktur`, `tanggal`, `kd_pelanggan`, `kd_mekanik`, `no_polisi`, `keluhan`) VALUES
('19081100001', '2019-08-11', 'PL0001', 'MK0002', 'F 3456 QPO', 'perbaiki semuanya'),
('23052200001', '2023-05-22', 'PL0001', 'MK0001', 'B A COT', 'mesin klitik'),
('23052300001', '2023-05-18', 'PL0001', 'MK0001', 'ASDAads', 'asdas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sparepart`
--

CREATE TABLE `sparepart` (
  `kd_sparepart` varchar(10) NOT NULL,
  `nm_sparepart` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `stok` int(10) NOT NULL,
  `ongkos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `sparepart`
--

INSERT INTO `sparepart` (`kd_sparepart`, `nm_sparepart`, `harga`, `stok`, `ongkos`) VALUES
('SP0001', 'BAN LUAR', 175000, 26, 10000),
('SP0002', 'SPION', 20000, 17, 8000),
('SP0003', 'JOK', 200000, 0, 10000),
('SP0004', 'Noken As', 60000, 2, 5000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_service`
--
ALTER TABLE `detail_service`
  ADD KEY `kd_sparepart` (`kd_sparepart`),
  ADD KEY `no_faktur` (`no_faktur`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `mekanik`
--
ALTER TABLE `mekanik`
  ADD PRIMARY KEY (`kd_mekanik`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);

--
-- Indeks untuk tabel `service_motor`
--
ALTER TABLE `service_motor`
  ADD PRIMARY KEY (`no_faktur`),
  ADD KEY `kd_mekanik` (`kd_mekanik`),
  ADD KEY `kd_pelanggan` (`kd_pelanggan`);

--
-- Indeks untuk tabel `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`kd_sparepart`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `service_motor`
--
ALTER TABLE `service_motor`
  ADD CONSTRAINT `service_motor_ibfk_1` FOREIGN KEY (`kd_mekanik`) REFERENCES `mekanik` (`kd_mekanik`),
  ADD CONSTRAINT `service_motor_ibfk_2` FOREIGN KEY (`kd_pelanggan`) REFERENCES `pelanggan` (`kd_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
