-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Nov 2021 pada 14.20
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bppkad_inotek2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota_tim`
--

CREATE TABLE `anggota_tim` (
  `id` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `nama_ketua` char(150) NOT NULL,
  `nama_anggota` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota_tim`
--

INSERT INTO `anggota_tim` (`id`, `id_peserta`, `nama_ketua`, `nama_anggota`, `created_date`, `updated_date`) VALUES
(109, 6775521, 'Dimas', 'Samid', '2021-11-10 09:48:01', '0000-00-00 00:00:00'),
(110, 6775521, 'Dimas', 'Leon', '2021-11-10 09:48:01', '0000-00-00 00:00:00'),
(111, 6775521, 'Dimas', 'Susilo', '2021-11-10 09:48:01', '0000-00-00 00:00:00'),
(112, 6775522, 'Deka', '', '2021-11-10 09:58:11', '0000-00-00 00:00:00'),
(113, 6775523, 'Didik', '', '2021-11-10 10:24:13', '0000-00-00 00:00:00'),
(114, 6775524, 'Kemo', '', '2021-11-10 10:28:15', '0000-00-00 00:00:00'),
(115, 6775525, 'Kemi', '', '2021-11-10 10:32:19', '0000-00-00 00:00:00'),
(116, 6775526, 'kemet', '', '2021-11-10 10:35:06', '0000-00-00 00:00:00'),
(117, 6775527, 'Benjot', '', '2021-11-10 10:46:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita_acara_pemenang`
--

CREATE TABLE `berita_acara_pemenang` (
  `id_berita_acara_pemenang` int(11) NOT NULL,
  `id_usulan` varchar(10) NOT NULL,
  `id_subevent` int(11) NOT NULL,
  `pemenang` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidang`
--

CREATE TABLE `bidang` (
  `id` int(11) NOT NULL,
  `bidang` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bidang`
--

INSERT INTO `bidang` (`id`, `bidang`) VALUES
(1, 'Pendidikan'),
(2, 'Kesehatan'),
(3, 'Lingkungan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event` char(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `event`
--

INSERT INTO `event` (`id`, `event`) VALUES
(45, 'Lomba Inovasi'),
(46, 'Lomba Kebersihan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `indikator_penilaian`
--

CREATE TABLE `indikator_penilaian` (
  `id_indikator_penilaian` int(11) NOT NULL,
  `id_subevent` int(11) NOT NULL,
  `indikator` char(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `indikator_penilaian`
--

INSERT INTO `indikator_penilaian` (`id_indikator_penilaian`, `id_subevent`, `indikator`) VALUES
(44, 51, 'Lingkup Inovasi Teknologi yang Dihasilkan'),
(45, 51, 'Kemudahan Dideseminasikan dan Diadopsi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `indikator_penilaian_pemenang`
--

CREATE TABLE `indikator_penilaian_pemenang` (
  `id` int(11) NOT NULL,
  `id_subevent` int(11) NOT NULL,
  `komponen` char(150) NOT NULL,
  `nilai_komponen_min` int(11) NOT NULL,
  `nilai_komponen_max` int(11) NOT NULL,
  `note` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `indikator_penilaian_pemenang`
--

INSERT INTO `indikator_penilaian_pemenang` (`id`, `id_subevent`, `komponen`, `nilai_komponen_min`, `nilai_komponen_max`, `note`) VALUES
(41, 51, 'Tingkat Ketersiapterapan', 0, 20, 'Alat dapat dimanfaatkan'),
(42, 51, 'Kebaruan/Inovasi/Kreativitas', 0, 10, 'Kriteria ini terkait dengan kebaruan ide'),
(43, 51, 'Potensi keberlanjutan/ Komersialisasi', 0, 20, 'Terkait potensi dapat dikembangkan lebih lanjut'),
(44, 51, 'Keunikan daya jual', 0, 15, 'Kriteria berkaitan dengan keunikan'),
(45, 51, 'Tingkat Kemanfaatan', 0, 35, 'Terkait dengan daya ungkit potensi kemanfaatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keterangan_indikator`
--

CREATE TABLE `keterangan_indikator` (
  `id_keterangan_indikator` int(11) NOT NULL,
  `id_indikator_penilaian` int(11) NOT NULL,
  `keterangan` char(255) NOT NULL,
  `nilai_minimal_keterangan` char(3) NOT NULL,
  `nilai_maksimal_keterangan` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keterangan_indikator`
--

INSERT INTO `keterangan_indikator` (`id_keterangan_indikator`, `id_indikator_penilaian`, `keterangan`, `nilai_minimal_keterangan`, `nilai_maksimal_keterangan`) VALUES
(60, 44, 'Inovasi berskala lokal kecamatan/desa', '0', '11'),
(61, 44, 'Inovasi berskala lokal kabupaten/kota', '11', '20'),
(62, 44, 'Inovasi berskala provinsi', '31', '40'),
(64, 45, 'Sangat Sulit', '0', '10'),
(65, 45, 'Agak sulit', '11', '20'),
(66, 45, 'Agak Mudah', '31', '40'),
(67, 45, 'Mudah', '41', '50'),
(68, 44, 'Inovasi berskala nasional', '41', '50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nominator`
--

CREATE TABLE `nominator` (
  `id_nominator` int(11) NOT NULL,
  `id_usulan` int(11) NOT NULL,
  `id_subevent` int(11) NOT NULL,
  `tahun` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `urutan` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian_pemenang`
--

CREATE TABLE `penilaian_pemenang` (
  `id` int(11) NOT NULL,
  `id_usulan` int(11) NOT NULL,
  `id_indikator` char(150) NOT NULL,
  `id_penilai` char(150) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` char(100) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian_proposal`
--

CREATE TABLE `penilaian_proposal` (
  `id` int(11) NOT NULL,
  `id_usulan` char(150) NOT NULL,
  `nilai_proposal` int(11) NOT NULL,
  `id_penilai` char(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian_usulan`
--

CREATE TABLE `penilaian_usulan` (
  `id` int(11) NOT NULL,
  `usulan_id` char(150) NOT NULL,
  `id_indikator` char(150) NOT NULL,
  `nilai` int(11) NOT NULL,
  `id_penilai` char(150) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` char(100) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int(11) NOT NULL,
  `id_usulan` char(150) NOT NULL,
  `id_usr` int(11) NOT NULL,
  `id_bidang` int(11) NOT NULL,
  `interaksi` varchar(100) NOT NULL,
  `nama_ketua` char(255) NOT NULL,
  `email_ketua` char(150) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat_ketua` varchar(255) NOT NULL,
  `ktp` varchar(150) NOT NULL,
  `asal_sekolah` char(255) NOT NULL,
  `kategori_peserta` varchar(100) NOT NULL,
  `nama_tim` char(255) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `id_usulan`, `id_usr`, `id_bidang`, `interaksi`, `nama_ketua`, `email_ketua`, `no_hp`, `alamat_ketua`, `ktp`, `asal_sekolah`, `kategori_peserta`, `nama_tim`, `tahun`, `created_date`, `updated_date`) VALUES
(6775521, '9651256', 137, 1, 'Kelompok', 'Dimas', 'dimas@gmail.com', '08974635252', 'Maospati, Magetan', '667b459c21b46e4871f6ef57c4038d42.png', '', 'umum', 'Tim SS', '2021', '2021-11-10 09:48:01', '2021-11-10 09:49:55'),
(6775522, '9651257', 138, 1, 'Individu', 'Deka', 'deka@gmail.com', '089746352523', 'Plaosan, Magetan', '13821b4c61426ad2aedfe50702b503b2.png', 'SMA 3 Magetan', 'pelajar', 'Tim Suka', '2021', '2021-11-10 09:58:11', '0000-00-00 00:00:00'),
(6775523, '9651258', 142, 1, 'Individu', 'Didik', 'didik@gmail.com', '087634528716', 'Takeran, Magetan', '447ebc9d8b9061c7132bcbf52ff006cf.png', '', 'umum', 'Tim Kuat', '2021', '2021-11-10 10:24:13', '0000-00-00 00:00:00'),
(6775524, '9651259', 143, 1, 'Individu', 'Kemo', 'kemo@gmail.com', '081354637826', 'Karas Magetan', 'c7bb2517ec40e0ca3e8ec02ef0a4a167.png', '', 'umum', 'Black Cobra', '2021', '2021-11-10 10:28:15', '0000-00-00 00:00:00'),
(6775525, '9651260', 144, 1, 'Individu', 'Kemi', 'kemi@gmail.com', '087634528719', 'Bendo magetan', '9203695a9c820ade71210ba3c6d4050c.png', '', 'umum', 'Yolo Crew', '2021', '2021-11-10 10:32:19', '0000-00-00 00:00:00'),
(6775526, '9651261', 145, 1, 'Individu', 'kemet', 'kemet@gmail.com', '081354637826', 'parang magetan', '2f9a05452fe14c873b0ce14202c3c58e.png', '', 'umum', 'Young Crew', '2021', '2021-11-10 10:35:06', '0000-00-00 00:00:00'),
(6775527, '9651262', 146, 1, 'Individu', 'Benjot', 'benjot@gmail.com', '089746352523', 'Ngujung', '7fc459ac478e1abae548cdb5b4135f16.png', '', 'umum', 'Tim Jaya', '2021', '2021-11-10 10:46:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_penilai`
--

CREATE TABLE `setting_penilai` (
  `id` int(11) NOT NULL,
  `id_subevent` int(11) NOT NULL,
  `id_usr` char(10) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` char(100) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `setting_penilai`
--

INSERT INTO `setting_penilai` (`id`, `id_subevent`, `id_usr`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(141, 51, '139', '2021-11-10 10:10:54', 'admin@gmail.com', '0000-00-00 00:00:00', ''),
(142, 51, '140', '2021-11-10 10:11:01', 'admin@gmail.com', '0000-00-00 00:00:00', ''),
(144, 51, '141', '2021-11-10 10:20:18', 'admin@gmail.com', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subevent`
--

CREATE TABLE `subevent` (
  `id` int(11) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `id_event` char(150) NOT NULL,
  `subevent` char(150) NOT NULL,
  `bidang` varchar(150) NOT NULL,
  `mulai` char(150) NOT NULL,
  `akhir` char(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `subevent`
--

INSERT INTO `subevent` (`id`, `tahun`, `id_event`, `subevent`, `bidang`, `mulai`, `akhir`) VALUES
(51, '2021', '45', 'Inovasi Teknologi', 'Pendidikan', '2021-11-10', '2021-11-30'),
(52, '2021', '45', 'Inovasi Daerah A', 'Lingkungan', '2021-09-04', '2021-09-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `total_nilai`
--

CREATE TABLE `total_nilai` (
  `id` int(11) NOT NULL,
  `id_usulan` char(150) NOT NULL,
  `nilai_verifikasi` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` char(100) NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `total_nilai_pemenang`
--

CREATE TABLE `total_nilai_pemenang` (
  `id_total_nilai_pemenang` int(11) NOT NULL,
  `id_usulan` int(15) NOT NULL,
  `nilai_nominator` varchar(100) NOT NULL,
  `id_penilai` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_usr` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `satuan_kerja` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `hak_akses` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_usr`, `nama`, `email`, `password`, `satuan_kerja`, `kecamatan`, `hak_akses`, `status`) VALUES
(1, 'Admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, 'Admin_Bappeda', 'Aktif'),
(136, 'Ahmad Jaka', 'jaka@mail.com', 'e4a5ef7c04c4cd0237130078250ae764', NULL, NULL, 'Penilai', 'Aktif'),
(137, 'Dimas', 'dimas@gmail.com', 'bc3e806c4f220f431fd5759102276ea6', NULL, '', 'Peserta', 'Aktif'),
(138, 'Deka', 'deka@gmail.com', '6ff8ef6c41c223c0deeaf0b5a4712797', NULL, '', 'Peserta', 'Aktif'),
(139, 'Deva', 'deva@gmail.com', '3d1938981e5cfdcd321e72484668cabb', 'Bappeda', 'Sukomoro', 'Penilai', 'Aktif'),
(140, 'Beni', 'beni@gmail.com', '5e1026596ce4872f5729caf6f600bf49', 'Bappeda', 'Sidorejo', 'Penilai', 'Aktif'),
(141, 'Eriko', 'eriko@gmail.com', 'fd5529095c0be07ec686db4059f3d902', 'Bappeda', 'Sidorejo', 'Penilai', 'Aktif'),
(142, 'Didik', 'didik@gmail.com', '0a75ff02a92a63a909a776b9ec7d0253', NULL, '', 'Peserta', 'Aktif'),
(143, 'kemo', 'kemo@gmail.com', '65cd9525c0ed9fcaf6d6fe8b0f4fffe1', NULL, '', 'Peserta', 'Aktif'),
(144, 'kemi', 'kemi@gmail.com', '6432cdbf7de0fde38a796ab78965b913', NULL, '', 'Peserta', 'Aktif'),
(145, 'Kemet', 'kemet@gmail.com', '2fe6e02be9dfb15ca45a4810580dff9d', NULL, '', 'Peserta', 'Aktif'),
(146, 'benjot', 'benjot@gmail.com', '24593e7bcc2d93cde3dab1e9cfcf1824', NULL, '', 'Peserta', 'Aktif'),
(147, 'Didot', 'didot@gmail.com', '1289c801fb3b2b38ed6e4d0e51a06448', NULL, NULL, 'Penilai', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `usulan`
--

CREATE TABLE `usulan` (
  `id` int(11) NOT NULL,
  `user` char(150) NOT NULL,
  `id_usr` int(11) NOT NULL,
  `tahun` varchar(100) NOT NULL,
  `subevent` char(150) NOT NULL,
  `id_subevent` int(11) NOT NULL,
  `judul` char(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `latar_belakang` text NOT NULL,
  `kondisi_sebelumnya` text NOT NULL,
  `sasaran_n_tujuan` text NOT NULL,
  `deskripsi` text NOT NULL,
  `bahan_baku` text NOT NULL,
  `cara_kerja` text NOT NULL,
  `keunggulan` text NOT NULL,
  `hasil_yg_diharapkan` text NOT NULL,
  `manfaat` text NOT NULL,
  `rencana` text NOT NULL,
  `proposal` text NOT NULL,
  `link_video` char(255) NOT NULL,
  `gambar` varchar(150) NOT NULL,
  `jurnal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `usulan`
--

INSERT INTO `usulan` (`id`, `user`, `id_usr`, `tahun`, `subevent`, `id_subevent`, `judul`, `status`, `latar_belakang`, `kondisi_sebelumnya`, `sasaran_n_tujuan`, `deskripsi`, `bahan_baku`, `cara_kerja`, `keunggulan`, `hasil_yg_diharapkan`, `manfaat`, `rencana`, `proposal`, `link_video`, `gambar`, `jurnal`) VALUES
(9651256, 'Dimas', 137, '2021', 'Inovasi Teknologi', 51, 'Think Big As Galaxy', '1', 'Latar Belakang (Permasalahan)\r\n', 'Kondisi Sebelum Inovasi\r\n', 'Sasaran dan Tujuan Inovasi\r\n', 'Deskripsi', 'Bahan Baku\r\n', 'Cara Kerja\r\n', 'Keunggulan', 'Hasil yang Diharapkan\r\n', 'Manfaat Bagi Masyarakat/ Lingkungan\r\n', 'Rencana Keberlanjutan\r\n', '5cad75ce0381e5186c540539e119b01c.png', 'https://youtu.be/ptWgufbjURA', 'f1df60484d94755af567431c379db513.jpg', 'c469e7ed1bc0b6e3e8ae54ad3c1f94391.pdf'),
(9651257, 'Deka', 138, '2021', 'Inovasi Teknologi', 51, 'Inovasi Smart City', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '13821b4c61426ad2aedfe50702b503b2.pdf', 'https://youtu.be/ptWgufbjURA', '13821b4c61426ad2aedfe50702b503b2.jpg', '13821b4c61426ad2aedfe50702b503b21.pdf'),
(9651258, 'Didik', 142, '2021', 'Inovasi Teknologi', 51, 'Peningkatan Mutu Pendidikan Modern', '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '447ebc9d8b9061c7132bcbf52ff006cf.pdf', 'https://youtu.be/DgYeeDGA1Ho', '447ebc9d8b9061c7132bcbf52ff006cf1.png', '447ebc9d8b9061c7132bcbf52ff006cf1.pdf'),
(9651259, 'kemo', 143, '2021', 'Inovasi Teknologi', 51, 'Go Green', '1', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'You’ve gone Incognito\r\nNow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved. Learn more', 'c7bb2517ec40e0ca3e8ec02ef0a4a167.pdf', 'https://youtu.be/ptWgufbjURA', 'c7bb2517ec40e0ca3e8ec02ef0a4a1671.png', 'c7bb2517ec40e0ca3e8ec02ef0a4a1671.pdf'),
(9651260, 'kemi', 144, '2021', 'Inovasi Teknologi', 51, 'Go Clean', '1', 'Latar Belakang (Permasalahan)', 'Latar Belakang (Permasalahan)', 'Latar Belakang (Permasalahan)', 'Chrome won’t save the following information:\r\nYour browsing history\r\nCookies and site data\r\nInformation entered in forms\r\nYour activity might still be visible to:\r\nWebsites you visit\r\nYour employer or school\r\nYour internet service provider', 'Chrome won’t save the following information:\r\nYour browsing history\r\nCookies and site data\r\nInformation entered in forms\r\nYour activity might still be visible to:\r\nWebsites you visit\r\nYour employer or school\r\nYour internet service provider', 'Chrome won’t save the following information:\r\nYour browsing history\r\nCookies and site data\r\nInformation entered in forms\r\nYour activity might still be visible to:\r\nWebsites you visit\r\nYour employer or school\r\nYour internet service provider', 'Chrome won’t save the following information:\r\nYour browsing history\r\nCookies and site data\r\nInformation entered in forms\r\nYour activity might still be visible to:\r\nWebsites you visit\r\nYour employer or school\r\nYour internet service provider', 'Chrome won’t save the following information:\r\nYour browsing history\r\nCookies and site data\r\nInformation entered in forms\r\nYour activity might still be visible to:\r\nWebsites you visit\r\nYour employer or school\r\nYour internet service provider', 'Chrome won’t save the following information:\r\nYour browsing history\r\nCookies and site data\r\nInformation entered in forms\r\nYour activity might still be visible to:\r\nWebsites you visit\r\nYour employer or school\r\nYour internet service provider', 'Chrome won’t save the following information:\r\nYour browsing history\r\nCookies and site data\r\nInformation entered in forms\r\nYour activity might still be visible to:\r\nWebsites you visit\r\nYour employer or school\r\nYour internet service provider', '9203695a9c820ade71210ba3c6d4050c.pdf', 'https://youtu.be/4g_4RDyLmAY', '9203695a9c820ade71210ba3c6d4050c.jpg', '9203695a9c820ade71210ba3c6d4050c1.pdf'),
(9651261, 'Kemet', 145, '2021', 'Inovasi Teknologi', 51, 'Simple', '1', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', 'Take a deep dive and try our list of over 40 unique generators, find placeholder images for your next design, or add a lorem ipsum plugin to the CMS or text editor of your choice.\r\n\r\n', '2f9a05452fe14c873b0ce14202c3c58e.pdf', 'https://youtu.be/w8aW3nGfsoc', '2f9a05452fe14c873b0ce14202c3c58e1.png', '2f9a05452fe14c873b0ce14202c3c58e1.pdf'),
(9651262, 'benjot', 146, '2021', 'Inovasi Teknologi', 51, 'INOTech', '1', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', 'v', 'v', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem', '7fc459ac478e1abae548cdb5b4135f16.pdf', 'https://youtu.be/DgYeeDGA1Ho', '7fc459ac478e1abae548cdb5b4135f161.png', '7fc459ac478e1abae548cdb5b4135f161.pdf');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota_tim`
--
ALTER TABLE `anggota_tim`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `berita_acara_pemenang`
--
ALTER TABLE `berita_acara_pemenang`
  ADD PRIMARY KEY (`id_berita_acara_pemenang`);

--
-- Indeks untuk tabel `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `indikator_penilaian`
--
ALTER TABLE `indikator_penilaian`
  ADD PRIMARY KEY (`id_indikator_penilaian`);

--
-- Indeks untuk tabel `indikator_penilaian_pemenang`
--
ALTER TABLE `indikator_penilaian_pemenang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keterangan_indikator`
--
ALTER TABLE `keterangan_indikator`
  ADD PRIMARY KEY (`id_keterangan_indikator`);

--
-- Indeks untuk tabel `nominator`
--
ALTER TABLE `nominator`
  ADD PRIMARY KEY (`id_nominator`);

--
-- Indeks untuk tabel `penilaian_pemenang`
--
ALTER TABLE `penilaian_pemenang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penilaian_proposal`
--
ALTER TABLE `penilaian_proposal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penilaian_usulan`
--
ALTER TABLE `penilaian_usulan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- Indeks untuk tabel `setting_penilai`
--
ALTER TABLE `setting_penilai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subevent`
--
ALTER TABLE `subevent`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `total_nilai`
--
ALTER TABLE `total_nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `total_nilai_pemenang`
--
ALTER TABLE `total_nilai_pemenang`
  ADD PRIMARY KEY (`id_total_nilai_pemenang`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_usr`);

--
-- Indeks untuk tabel `usulan`
--
ALTER TABLE `usulan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota_tim`
--
ALTER TABLE `anggota_tim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT untuk tabel `berita_acara_pemenang`
--
ALTER TABLE `berita_acara_pemenang`
  MODIFY `id_berita_acara_pemenang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `bidang`
--
ALTER TABLE `bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `indikator_penilaian`
--
ALTER TABLE `indikator_penilaian`
  MODIFY `id_indikator_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `indikator_penilaian_pemenang`
--
ALTER TABLE `indikator_penilaian_pemenang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `keterangan_indikator`
--
ALTER TABLE `keterangan_indikator`
  MODIFY `id_keterangan_indikator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `nominator`
--
ALTER TABLE `nominator`
  MODIFY `id_nominator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT untuk tabel `penilaian_pemenang`
--
ALTER TABLE `penilaian_pemenang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=545;

--
-- AUTO_INCREMENT untuk tabel `penilaian_proposal`
--
ALTER TABLE `penilaian_proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT untuk tabel `penilaian_usulan`
--
ALTER TABLE `penilaian_usulan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT untuk tabel `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6775528;

--
-- AUTO_INCREMENT untuk tabel `setting_penilai`
--
ALTER TABLE `setting_penilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT untuk tabel `subevent`
--
ALTER TABLE `subevent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `total_nilai`
--
ALTER TABLE `total_nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT untuk tabel `total_nilai_pemenang`
--
ALTER TABLE `total_nilai_pemenang`
  MODIFY `id_total_nilai_pemenang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_usr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT untuk tabel `usulan`
--
ALTER TABLE `usulan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9651263;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
