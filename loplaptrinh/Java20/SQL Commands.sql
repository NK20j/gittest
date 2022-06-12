-- 1. Liệt kê danh sách databases đang có: 
show databases;

-- 2. Thêm mới 01 database:
create database java20;

-- 3. Chọn 01 DB để làm việc:
use java20;

-- 4. Liệt kê các bảng đang có trong db đã chọn:
show tables;


/**
Xây dựng tables cho bài toán bán hàng (với mỗi loại sản phẩm đc kinh doanh thì bổ sung thông tin cho bảng Sản phẩm) , quản lý:
- Danh sách khách hàng
- Sản phẩm
- Phân loại sản phẩm
- Nhà cung cấp sản phẩm
- Đơn hàng của khách hàng

Quan hệ:
[Sản Phẩm] n -- 1 [Loại Sản phẩm]
[Sản Phẩm] n -- 1 [Nhà Cung Cấp]
[Khách hàng] 1 -- n [Đơn hàng]
[Đơn hàng] n -- n [sản phẩm]
	[Đơn hàng] 1 -- n [Chi tiết đơn hàng] n -- 1 [Sản phẩm]

**/
-- 5. Tạo bảng danh mục nhà cung cấp:
create table nhaCungCap (
	nhaCungCapCode	int(10) primary key auto_increment, 
    tenNhaCungCap	varchar(1000),
    diaChia			varchar(2000),
    nguoiDaiDien	varchar(500),
    phone			varchar(20),
    email			varchar(100)
);

-- 6. Tạo bảng danh mục loại SP:
create table loaiSP (
	loaiSPCode	int(10) primary key auto_increment, 
    tenLoaiSP	varchar(500),
    moTa		varchar(2000)
);

-- 7. Toạ bảng Sản phẩm:
create table sanPham (
	sanPhamCode		int(10) primary key auto_increment, 
    teanSP			varchar(400) not null, -- ghi sai loi chinh ta cho ten cot tean --> ten
    ngayNhap		date, 
    giaNhap			int(10),
    giaBan			int(10),
    soLuong			int(10),
    giamGia			int(5),
    loaiSPCode		int(10),
    nhaCungCapCode	int(10),
    constraint `SP_LoaiSP` foreign key (`loaiSPCode`) references `loaiSP` (`loaiSPCode`), 
    constraint `SP_NhaCungCap` foreign key (`nhaCungCapCode`) references `nhaCungCap` (`nhaCungCapCode`)
);
-- 8. Do bảng sản phẩm có một cột đặt sai tên, là cột 'teanSP', cần đổi lại thành tenSP:
ALTER TABLE `sanPham` 
CHANGE COLUMN `teanSP` `tenSP` VARCHAR(400) NOT NULL ;

-- 9. Tạo bảng khách hàng: 
CREATE TABLE `khachHang` (
  `khachHangCode` int NOT NULL AUTO_INCREMENT,
  `hoTen` varchar(200) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `diaChi` varchar(1000) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`khachHangCode`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 10. Tạo bảng đơn hàng:
CREATE TABLE `donHang` (
  `donHangCode` int NOT NULL AUTO_INCREMENT,
  `khachHangCode` int NOT NULL,
  `ngayDatHang` datetime DEFAULT NULL,
  `ngayYeuCauGiaoHang` datetime DEFAULT NULL,
  `ngayNhanHang` datetime DEFAULT NULL,
  `trangThai` varchar(45) NOT NULL DEFAULT 'Moi',
  `diaChiNhanHang` varchar(500) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `ghiChu` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`donHangCode`),
  KEY `donHang_khachHang_idx` (`khachHangCode`),
  CONSTRAINT `donHang_khachHang` FOREIGN KEY (`khachHangCode`) REFERENCES `khachHang` (`khachHangCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Sửa thông tin bảng đơn hàng do tạo quan hệ khoá ngoại sai: 
ALTER TABLE `java20`.`donHang` 
DROP FOREIGN KEY `donHang_khachHang`;
ALTER TABLE `java20`.`donHang` 
ADD INDEX `donHang_khachHang_idx` (`khachHangCode` ASC) VISIBLE,
DROP INDEX `donHang_khachHang_idx` ;
;
ALTER TABLE `java20`.`donHang` 
ADD CONSTRAINT `donHang_khachHang`
  FOREIGN KEY (`khachHangCode`)
  REFERENCES `java20`.`khachHang` (`khachHangCode`);
  
commit;

ALTER TABLE `java20`.`donHang` 
ADD INDEX `donHang_khachHang_idx` (`khachHangCode` ASC) VISIBLE;

ALTER TABLE `java20`.`donHang` 
ADD CONSTRAINT `donHang_khachHang`
  FOREIGN KEY (`khachHangCode`)
  REFERENCES `java20`.`donHang` (`donHangCode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- 11. Tạo bảng chi tiết đơn hàng:
CREATE TABLE `java20`.`chiTietDonHang` (
  `donHangCode` INT NOT NULL,
  `sanPhamCode` INT NOT NULL,
  `soLuong` INT NULL,
  `giaBan` INT NULL,
  `giamGia` INT NULL,
  `thanhTien` INT NULL,
  INDEX `chiTiet_donHang_idx` (`donHangCode` ASC) VISIBLE,
  INDEX `chiTiet_sanPham_idx` (`sanPhamCode` ASC) VISIBLE,
  CONSTRAINT `chiTiet_donHang`
    FOREIGN KEY (`donHangCode`)
    REFERENCES `java20`.`donHang` (`donHangCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chiTiet_sanPham`
    FOREIGN KEY (`sanPhamCode`)
    REFERENCES `java20`.`sanPham` (`sanPhamCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- 12. Sửa bảng Khách hàng, bổ sung thêm 02 cột userName, Pasword
ALTER TABLE `java20`.`khachHang` 
ADD COLUMN `userName` VARCHAR(100) NOT NULL AFTER `email`,
ADD COLUMN `passWord` VARCHAR(1000) NOT NULL AFTER `userName`;

-- 13. Nhập dữ liệu cho các bảng:
insert into khachHang values(1, N'Nguyễn Văn A', '0987654321', N'Hoàng Mai - Hà Nội', 'nguyenvana@gmail.com', 'nguyenvana', '12345678');
insert into khachHang (hoTen, phone, diaChi, email, userName, passWord) 
	values(N'Nguyễn Văn B', '1234543210', N'Hai Bà Trưng - Hà Nội', 'nguyenvanb@gmail.com', 'nguyenvanb', '12345678');

insert into khachHang (hoTen, phone, diaChi, email, userName, passWord) 
	values(N'Nguyễn Văn C', '0987678921', N'Nam Từ Niêm - Hà Nội', 'nguyenvanc@gmail.com', 'nguyenvanc', '12345678');
    
INSERT INTO loaiSP (`tenLoaiSP`, `moTa`) VALUES  ('Nokia', 'Nokia'), ('SamSung', 'SamSung');
select * from loaiSP;

insert into `nhaCungCap` (tenNhaCungCap,diaChia,nguoiDaiDien,phone,email)
values
	('Nha cung cap 5','Ha Noi','Anh Long','0399251414','duonganhhb@gmail.com'),
	('Nha cung cap 6','Ha Noi','Anh Long','0399251414','duonganhhb@gmail.com');
select * from nhaCungCap;

insert into `sanPham` (`tenSP`,ngayNhap,giaNhap,giaBan,soLuong,giamGia,loaiSPCode,nhaCungCapCode)
values
	('Nokia 110i','2021-2-3',1000,1200,10,10,1,1),
	('Nokia 6006','2021-2-3',1000,1200,10,10,1,1),
	('SamSung Note 9','2021-2-3',1000,1200,10,10,2,1),
	('Nokia A1','2021-2-3',1000,1200,10,10,1,1),
	('SamSung Note 8','2021-2-3',1000,1200,10,10,2,2),
	('Nokia 660i','2021-2-3',1000,1200,10,10,1,1),
	('NOkia 1100','2021-2-3',1000,1200,10,10,1,1),
	('Nokia 1000','2021-2-3',1000,1200,10,10,1,1);

-- 14. Thay đổi giá trị của 1 cell trên record:

UPDATE `java20`.`sanPham` SET `giaNhap` = '500', `giaBan` = '600' WHERE (`sanPhamCode` = '6');
UPDATE `java20`.`sanPham` SET `giaNhap` = '450', `giaBan` = '620' WHERE (`sanPhamCode` = '7');
UPDATE `java20`.`sanPham` SET `giaNhap` = '550', `giaBan` = '800' WHERE (`sanPhamCode` = '8');
UPDATE `java20`.`sanPham` SET `giaNhap` = '1500', `giaBan` = '1750' WHERE (`sanPhamCode` = '4');
UPDATE `java20`.`sanPham` SET `giaNhap` = '850', `giaBan` = '1050' WHERE (`sanPhamCode` = '5');


update sanPham 
set 
	tenSP = 'SamSung Note 10 plus', 
    loaiSPCode = 2, 
    nhaCungCapCode = 2
where sanPhamCode = 4;

-- 15. Truy vấn dữ liệu:
select * from sanPham;

select * from khachHang;

-- 16. phép toán like
select nhaCungCapCode as NCCCode from nhaCungCap where tenNhaCungCap like '%6%';

-- 17. Phép toán distinct:
select distinct nguoiDaiDien from nhaCungCap;

-- 18. Phép between:
select * from sanPham where giaBan between 900 and 1100;

/**
Trong phép toán logic
- Chỉ có 2 giá trị: 0 - 1 ~ Đúng - Sai ~ True - False
- Phép toán:
	+ Nhân: 0 x * = 0
    + Cộng: 1 + * = 1
- AND tương đương phép Nhân
- OR tương đương phép cộng

**/
select * from sanPham where giaNhap < 600 and giaBan between 700 and 1100;
select * from sanPham where giaNhap < 600 or giaBan between 700 and 1100;

UPDATE `java20`.`sanPham` SET `giaNhap` = '500' WHERE (`sanPhamCode` = '8');

-- 19. lấy các sản p hẩm có giá nhập vào nhỏ hơn 600 và giá bán ra nằm trong khoảng [700, 1100]
-- sắp xếp kết quả truy vấntheo giá nhập vào, nếu giá nhập vào bằng nhau thì sắp sếp theo giá bán ra.
select * 
from sanPham 
where giaNhap < 600 or giaBan between 700 and 1100
order by giaNhap DESC, giaBan
limit 5;

-- 20. Hàm min, max: 
select min(giaBan) from sanPham;
select max(giaBan) from sanPham;
select min(giaBan) as 'Gia Thap Nhat', max(giaBan) as 'Gia Cao Nhat' from sanPham;

-- 21. Lấy ra tất cả sản phẩm SamSung đang có trong cửa hàng:
select sp.* from sanPham sp, loaiSP l where sp.loaiSPCode = l.loaiSPCode and l.tenLoaiSP like '%SamSung%';

select 
	sp.sanPhamCode, sp.tenSP, sp.giaNhap, sp.giaBan,
    sp.loaiSPCode, l.tenLoaiSP,
    sp.nhaCungCapCode, n.tenNhaCungCap
from 
	sanPham sp, loaiSP l, nhaCungCap n
where 
	sp.loaiSPCode = l.loaiSPCode and l.tenLoaiSP like '%SamSung%' and
    sp.nhaCungCapCode = n.nhaCungCapCode;


-- 22. lấy ra các sản phẩm là 'SamSung' thuộc nhà cung có tên 'Nha cung cap 6'
-- Cách 01:
select 
	s.sanPhamCode, s.tenSP, s.giaNhap, s.giaBan,
    s.loaiSPCode, l.tenLoaiSP,
    s.nhaCungCapCode, n.tenNhaCungCap
from 
	sanPham s, nhaCungCap n, loaiSP l
where 
	(s.loaiSPCode = l.loaiSPCode and l.tenLoaiSP like '%SamSung%')
	and 
    (n.nhaCungCapCode = s.nhaCungCapCode and n.tenNhaCungCap like '%6');

-- Cách 02: dùng subQuery:
select 
	s.sanPhamCode, s.tenSP, s.giaNhap, s.giaBan,
    s.loaiSPCode, l.tenLoaiSP,
    s.nhaCungCapCode, n.tenNhaCungCap
from 
	sanPham s, 
    (select tenNhaCungCap, nhaCungCapCode from nhaCungCap where tenNhaCungCap like '%6') n, 
    (select loaiSPCode, tenLoaiSP from loaiSP where tenLoaiSP like '%SamSung%') l
where 
	(s.loaiSPCode = l.loaiSPCode)
	and 
    (n.nhaCungCapCode = s.nhaCungCapCode);


-- 23. Thay đổi ngày nhập sản phẩm 
UPDATE `java20`.`sanPham` SET `ngayNhap` = '2021-02-01' WHERE (`sanPhamCode` = '1');
UPDATE `java20`.`sanPham` SET `ngayNhap` = '2021-02-10' WHERE (`sanPhamCode` = '3');
UPDATE `java20`.`sanPham` SET `ngayNhap` = '2021-02-16' WHERE (`sanPhamCode` = '4');
UPDATE `java20`.`sanPham` SET `ngayNhap` = '2021-02-20' WHERE (`sanPhamCode` = '5');
UPDATE `java20`.`sanPham` SET `ngayNhap` = '2021-03-01' WHERE (`sanPhamCode` = '6');
UPDATE `java20`.`sanPham` SET `ngayNhap` = '2021-03-05' WHERE (`sanPhamCode` = '7');
UPDATE `java20`.`sanPham` SET `ngayNhap` = '2021-04-01' WHERE (`sanPhamCode` = '8');

-- 24. Lấy ra các sản phẩm đc nhập vào kho trong tháng 3
select 
	sp.sanPhamCode, sp.tenSP, sp.giaNhap, sp.giaBan,
    sp.loaiSPCode, l.tenLoaiSP,
    sp.nhaCungCapCode, n.tenNhaCungCap,
    sp.ngayNhap
from 
	sanPham sp, loaiSP l, nhaCungCap n
where 
	sp.loaiSPCode = l.loaiSPCode and
    sp.nhaCungCapCode = n.nhaCungCapCode
    and month(sp.NgayNhap) = 3 and day(sp.ngayNhap) > 1;

-- 25. Nhập giá trị cho đơng hàng
INSERT INTO `donhang` (`khachHangCode`, `ngayDatHang`, `ngayYeuCauGiaoHang`, `ngayNhanHang`, `trangThai`, `diaChiNhanHang`, `phone`, `ghiChu`) 
VALUES 
	('1', '2021-5-8', '2021-5-11', '2021-5-11', 'da nhan', 'ha noi', '123456', 'khong'),
	('1', '2021-5-6', '2021-5-7', '2021-5-7', 'da nhan', 'ha noi', '123567', 'khong'),
	('2', '2021-5-9', '2021-5-11', '2021-5-11', 'da nhan', 'ha noi', '234567', 'khong'),
    ('3', '2021-5-9', '2021-5-11', '2021-5-11', 'da nhan', 'ha noi', '134567', 'khong'),
    ('3', '2021-5-10', '2021-6-11', null, 'dang chuyen hang', 'ha noi', '134567', 'khong');

insert into chitietdonhang (donHangCode,sanPhamCode,soLuong,giaBan,giamGia,thanhTien)
values
	(1,1,1000,500,10,450),
    (2,2,10,100,10,900),
    (2,1,3,1000,10,2700),
    (4,2,3,1000,50,1500),
    (4,1,10,100,50,500),
    (2,3,10,100,50,500),
    (1,2,5,500,50,2500),
    (1,2,5,500,50,2500),
    (1,1,6,500,50,2500);

/**
- 26. Lấy chi tiết tất cả các đơn hàng
- săp sếp theo trạng thái đơn hàng, ngày đặt hàng, ngày yêu cầu giao hàng, ngày nhận hàng.
**/ 
select 
	d.donHangCode as 'Mã Đơn Hàng', k.userName, k.hoTen, k.phone, k.diaChi, k.email, 
    d.ngayDatHang, d.ngayYeuCauGiaoHang, d.ngayNhanHang, d.trangThai, 
    d.diaChiNhanHang, d.phone, d.ghiChu,
    s.tenSP, s.giaNhap as 'Giá Nhập Vào', s.giaBan, l.tenLoaiSP, n.tenNhaCungCap, 
    c.soLuong, c.giaBan as 'Giá bán ra thực tế', c.giamGia, c.thanhTien
from 
	khachHang k, donHang d, chiTietDonHang c, sanPham s, loaiSP l, nhaCungCap n
where
	k.khachHangCode = d.khachHangCode and 
    d.donHangCode = c.donHangCode and 
    c.sanPhamCode = s.sanPhamCode and 
    s.loaiSPCode = l.loaiSPCode and 
    s.nhaCungCapCode = n.nhaCungCapCode
order by d.trangThai, d.ngayDatHang, d.ngayYeuCauGiaoHang, d.ngayNhanHang
;

-- Tính chi phí của mỗi đơn hàng
select 
	d.donHangCode as 'Mã Đơn Hàng', k.userName, k.hoTen, k.phone, k.diaChi, k.email, 
    d.ngayDatHang, d.ngayYeuCauGiaoHang, d.ngayNhanHang, d.trangThai, 
    d.diaChiNhanHang, d.phone, d.ghiChu,
    s.tenSP, s.giaNhap as 'Giá Nhập Vào', s.giaBan, l.tenLoaiSP, n.tenNhaCungCap, 
    c.soLuong, c.giaBan as 'Giá bán ra thực tế', c.giamGia, c.thanhTien, 
    (c.soLuong * (c.giaBan - c.giamGia)) as Amount
from 
	khachHang k, donHang d, chiTietDonHang c, sanPham s, loaiSP l, nhaCungCap n
where
	k.khachHangCode = d.khachHangCode and 
    d.donHangCode = c.donHangCode and 
    c.sanPhamCode = s.sanPhamCode and 
    s.loaiSPCode = l.loaiSPCode and 
    s.nhaCungCapCode = n.nhaCungCapCode
order by d.trangThai, d.ngayDatHang, d.ngayYeuCauGiaoHang, d.ngayNhanHang
;

-- tính tổng tiền mỗi đơn hàng
select 
	d.donHangCode, sum(c.soLuong*(c.giaBan-c.giamGia))
from
	khachhang k, donhang d, chitietdonhang c, sanpham s, loaisp l, nhacungcap n
where
	k.khachHangCode=d.khachHangCode and
    d.donHangCode=c.donHangCode and
    c.sanPhamCode=s.sanPhamCode and
    s.loaiSPCode=l.loaiSPCode and
    s.nhaCungCapCode=n.nhaCungCapCode
group by d.donHangCode;

/**
-- 27. Các lệnh Join
**/
-- Inner Join:
select * 
from sanPham sp inner join loaiSP l on sp.loaiSPCode = l.loaiSPCode and l.tenLoaiSP like '%SamSung%';

select sp.* from sanPham sp, loaiSP l where sp.loaiSPCode = l.loaiSPCode and l.tenLoaiSP like '%SamSung%';

-- left join
select k.*, d.* from khachHang k left join donhang d on k.khachHangCode = d.khachHangCode;

insert into khachHang (hoTen, phone, diaChi, email, userName, passWord) 
	values(N'Nguyễn Văn D', '1029837465', N'Bắc Từ Niêm - Hà Nội', 'nguyenvand@gmail.com', 'nguyenvand', '12345678');
    
select k.*, d.* from khachHang k left join donhang d on k.khachHangCode = d.khachHangCode;

-- right join
select d.*, k.* from donhang d right join khachHang k on k.khachHangCode = d.khachHangCode;
