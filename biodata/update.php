<?php
header ("Content-Type: application/json");
include "konekdb.php";

$id = $_POST['id'];
$nis = $_POST['nis']; 
$nama = $_POST['nama'];
$tplahir = $_POST['tplahir'];
$tglahir = $_POST['tglahir'];
$kelamin = $_POST['kelamin'];
$agama = $_POST['agama'];
$alamat = $_POST['alamat'];

$stmt = $db->prepare("UPDATE siswa SET nama = ?, tplahir = ?, tglahir = ?, kelamin = ?, agama = ?, alamat = ? WHERE id = ?");
$result = $stmt->execute([$nama, $tplahir, $tglahir, $kelamin, $agama, $alamat, $id]);

echo json_encode(['success' => $result]);