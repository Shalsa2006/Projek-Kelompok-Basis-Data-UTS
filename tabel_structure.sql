
-- DROP and CREATE TABLES for rental mobil (PostgreSQL)

DROP TABLE IF EXISTS fotos, kerusakan, transaksi, jadwal, drivers, cars, employees, customers CASCADE;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    fname VARCHAR(60),
    lname VARCHAR(60),
    alamat TEXT,
    no_hp VARCHAR(30),
    email VARCHAR(120)
);

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    fname VARCHAR(60),
    lname VARCHAR(60),
    alamat TEXT,
    no_hp VARCHAR(30),
    email VARCHAR(120),
    jabatan VARCHAR(60),
    password_hash VARCHAR(200)
);

CREATE TABLE drivers (
    driver_id INTEGER PRIMARY KEY,
    fname VARCHAR(60),
    lname VARCHAR(60),
    alamat TEXT,
    no_hp VARCHAR(30),
    sim VARCHAR(50),
    pengalaman INT,
    biaya_driver INT
);

CREATE TABLE cars (
    car_id INTEGER PRIMARY KEY,
    model VARCHAR(60),
    tahun INT,
    merk VARCHAR(60),
    warna VARCHAR(30),
    power VARCHAR(60),
    harga_sewa INT
);

CREATE TABLE jadwal (
    jadwal_id INTEGER PRIMARY KEY,
    nota VARCHAR(30) UNIQUE,
    car_id INT REFERENCES cars(car_id),
    driver_id INT REFERENCES drivers(driver_id),
    tanggal_sewa DATE,
    tanggal_kembali DATE
);

CREATE TABLE transaksi (
    nota VARCHAR(30) PRIMARY KEY,
    pelanggan_id INT REFERENCES customers(customer_id),
    karyawan_id INT REFERENCES employees(employee_id),
    tanggal_transaksi DATE
);

CREATE TABLE kerusakan (
    kerusakan_id INTEGER PRIMARY KEY,
    nota VARCHAR(30) REFERENCES transaksi(nota),
    deskripsi TEXT,
    biaya_kerusakan INT
);

CREATE TABLE fotos (
    foto_id INTEGER PRIMARY KEY,
    foto_path VARCHAR(255),
    kerusakan_id INT REFERENCES kerusakan(kerusakan_id),
    deskripsi TEXT
);

-- Indexes
CREATE INDEX idx_jadwal_car ON jadwal(car_id);
CREATE INDEX idx_jadwal_driver ON jadwal(driver_id);
CREATE INDEX idx_transaksi_pelanggan ON transaksi(pelanggan_id);
