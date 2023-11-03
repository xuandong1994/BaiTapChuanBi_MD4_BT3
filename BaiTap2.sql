create database IF NOT EXISTS baitap2;
use baitap2;
create table IF NOT EXISTS khachhang(
MaKH varchar(4) not null,
TenKH varchar(30) not null,
DiaChi varchar(50),
NgaySinh date,
SoDT varchar(15), 
primary key(MaKH)
);
create table IF NOT EXISTS NhanVien (
MaNV varchar(4) not null,
HoTen varchar(30) not null,
GioiTinh varchar(4) not null,
DiaChi varchar (50) not null,
NgaySinh datetime not null,
DienThoai varchar (15),
Email varchar(255),
NoiSinh varchar(20) not null,
NgayVaoLam date,
MaNQL varchar(4),
primary key(MaNV)
);
create table IF NOT EXISTS NhaCungCap(
MaNCC varchar(5) primary key,
TenNCC varchar(50),
DiaChi varchar(50),
DienThoai varchar(15),
Email varchar(30),
website varchar(30)
);
create table IF NOT EXISTS LoaiSanPham (
MaLoaiSP varchar(4) primary key,
TenLoaiSP varchar(50),
GhiChu varchar(100)
);
create table IF NOT EXISTS SanPham(
MaSP varchar(4) primary key,
MaloaiSP varchar(4),
TenSP varchar(30),
DonViTinh varchar(100),
GhiChu varchar(100)
);
create table IF NOT EXISTS PhieuNhap(
SoPN varchar(4) primary key,
MaNV varchar(4),
MaNCC varchar(5),
NgayNhap date,
GhiChu varchar(100)
);
create table IF NOT EXISTS CTPHIEUNHAP(
MaSP varchar(4),
SoPN varchar(4),
SoLuong smallint,
GiaNhap real,
primary key(MaSP,SoPN)
);
create table IF NOT EXISTS PHIEUXUAT(
SoPX varchar(4) primary key,
MaNV varchar(5),
MaKH varchar(4),
NgayBan date,
GhiChu text
);
create table IF NOT EXISTS CTPHIEUXUAT(
SoPX varchar(4),
MaSP varchar(4),
SoLuong smallint,
GiaBan real,
primary key (SoPX, MaSP)
);
-- bai 2 
alter table PhieuNhap add foreign key (MaNCC) references NhaCungCap(MaNCC);
alter table PhieuNhap add foreign key (MaNV) references nhanvien(MaNV);
alter table CTPHIEUNHAP add foreign key (MaSP) references SanPham(MaSP);
alter table CTPHIEUNHAP add foreign key (SoPN) references PhieuNhap(SoPN);
alter table SanPham add foreign key(MaLoaiSP) references LoaiSanPham(MaLoaiSP);
alter table PHIEUXUAT add foreign key (MaNV) references nhanvien(MaNV);
alter table PHIEUXUAT add foreign key (MaKH) references khachhang(MaKH);
alter table CTPHIEUXUAT add foreign key(SoPX) references PHIEUXUAT(SoPX);
alter table CTPHIEUXUAT add foreign key (MaSP) references SanPham(MaSP);
alter table nhanvien add tuoi varchar(3);
insert into khachhang value
('KH01','Nguyễn Văn A','Hà Nội','1994-09-10','0984727353'),
('KH02','Nguyễn Văn B','HCM', '2000-10-20','0984227353'),
('KH03','Nguyễn Văn C','Nam Định','1998-10-19','0984527353'),
('KH04','Nguyễn Văn D','Bình Phước','1999-09-10','0984627353'),
('KH05','Nguyễn Văn E','Hà Nội','1996-09-19','0984827353'),
('KH06','Nguyễn Văn T','HCM','1998-11-20','0984827353'),
('KH07','Nguyễn Văn H','HCM','1996-11-30','0984827353');
-- thêm dữ liệu bảng nhân viên
insert into nhanvien value
('N001','Hồ Xuân Hùng','nam','Nghệ An','1999-06-18','0974364738','hung@gmail.com','Nghệ An',null,null,'25'),
('N002','Trịnh công Phúc','nam','Hồ Chí Minh','2000-02-18','0974364928','phuc@gmail.com','Hồ Chí Minh',null,'N001','42'),
('N003','Cao Cường','nam','Hà Nam','2001-06-20','0974937738','cuong@gmail.com','Hà Nam',null,'N002','23'),
('N004','Lê Đức Phát','nữ','Hồ Chí Minh','2004-05-30','097439473','phat@gmail.com','Hồ CHí Minh',null,'N001','20'),
('N005','Nguyễn Thị Minh Châu','nữ','Hồ Chí Minh','1998-1-18','097438756','Chau@gmail.com','Hồ chí Minh',null,'N001','26');

insert into nhacungcap value
('NCC01','TenNCC01','HCM','0987654321','tenncc@gmail.com',null),
('NCC02','TenNCC02','HN','0986654321','tenncc1@gmail.com',null),
('NCC03','TenNCC03','HCM','0957654321','tenncc2@gmail.com',null),
('NCC04','TenNCC04','HCM','0947654321','tenncc3@gmail.com',null),
('NCC05','TenNCC05','HCM','0937654321','tenncc4@gmail.com',null);
insert into loaisanpham value 
('ML01','Ma van loai','abc'),
('ML02','Ma van loai2','abc'),
('ML03','Ma van loai3','abc'),
('ML04','Ma van loai4','abc'),
('ML05','Ma van loai5','abc');
insert	into sanpham value
('SP01', 'ML01','San van pham1','chai','bbbbb'),
('SP02', 'ML02','San van pham2','lọ','bbbbb'),
('SP03', 'ML03','San van pham3','chai','bbbbb'),
('SP04', 'ML04','San van pham4','quần','bbbbb'),
('SP05', 'ML05','San van pham5','chai','bbbbb'),
('SP06', 'ML05','Nước xả vải Comfort','chai','bbbbb');



-- bai 3
INSERT INTO phieunhap VALUE
 ('PN05', 'N001', 'NCC01', '1999-03-01', 'ttttt'),
 ('PN10', 'N002', 'NCC02', '1999-03-01', 'vvvvv'),
 ('PN11', 'N002', 'NCC02', '1999-03-20', 'vvvvv'),
 ('PN12', 'N002', 'NCC02', '1999-03-25', 'vvvvv');
insert into phieuxuat values
('PX05','N001','KH01','1999-03-01','ccccc'),
('PX10','N002','KH01','1999-02-01','bbbb'),
('PX11','N002','KH01','1999-05-01','bbbb'),
('PX06','N002','KH01','1999-4-01','bbbb'),
 ('PX07','N001','KH01','1999-4-20','bbbb'),
('PX08','N003','KH01','1999-4-30','bbbb'),
('PX09','N004','KH01','1999-5-01','bbbb'),
('PX14','N005','KH01','1999-5-10','bbbb');

insert into nhanvien value
('N006','Xuan Dong',1,'Nam Dinh','1994-10-09','097658538','dong@gmail.com','Nghệ An',null,null,'30');
insert into ctphieunhap value
('SP01','pn05',5,500000),
('SP02','pn10',10,700000),
('SP03','pn11',6,600000),
('SP05','pn12',5,500000);
insert into ctphieuxuat value
('PX05','SP01',2,700000),
('PX10','SP02',2,1000000),
('PX09','SP03',2,800000),
('PX14','SP01',2,700000);
-- bai 4
update khachhang set sodt = '0987654321' where makh like 'kh03';
update nhanvien  set diachi = 'Hà nội' where manv like 'N001';  
-- bai 5
delete from  nhanvien where manv like 'N006';
delete from sanpham where masp like 'SP04';
-- bài 6: Liệt kê thông tin về nhân viên trong cửa hàng, gồm: mã nhân viên, họ tên nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi
--  Kết quả sắp xếp theo tuổi.
select manv,hoten,gioitinh,ngaysinh,diachi,dienthoai,tuoi from nhanvien order by tuoi ;
-- Liệt kê các hóa đơn nhập hàng trong tháng 3/1999, gồm thông tin số phiếu nhập, mã nhân viên nhập hàng, họ tên nhân viên, họ tên nhà cung cấp, ngày nhập hàng, ghi chú.
select * from phieunhap pn where month(pn.ngaynhap) = 3 and year(pn.ngaynhap) = 1999 ;
-- Liệt kê tất cả sản phẩm có đơn vị tính là chai, gồm tất cả thông tin về sản phẩm.
select * from sanpham sp  where sp.donvitinh like 'chai';
-- Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: số phiếu nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá nhập, thành tiền
select ctpn.sopn,sp.masp,sp.tensp,sp.maloaisp,ctpn.soluong,ctpn.gianhap, sum(ctpn.soluong * ctpn.gianhap) as tatol
from ctphieunhap ctpn join sanpham sp on ctpn.masp = sp.masp
GROUP BY ctpn.sopn, sp.masp, sp.tensp, sp.maloaisp, ctpn.soluong, ctpn.gianhap;
-- Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm thông tin:
-- mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại, email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng.
select ncc.mancc, ncc.tenncc,ncc.diachi,ncc.dienthoai,ncc.email, pn.sopn,pn.ngaynhap
 from nhacungcap ncc join phieunhap pn on ncc.mancc = pn.mancc
 group by ncc.mancc, ncc.tenncc,ncc.diachi,ncc.dienthoai,ncc.email, pn.sopn,pn.ngaynhap
 order by pn.ngaynhap;
 -- Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 1999 gồm thông tin:
-- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu
-- select * from phieuxuat px  where month(px.ngayban) <= 6 and year(px.ngayban) = 1999;
select px.sopx, nv.manv,px.ngayban, sp.masp, sp.donvitinh, ctpx.soluong, ctpx.giaban,(ctpx.soluong * ctpx.giaban ) as doanhthu from phieuxuat px
 join ctphieuxuat ctpx on px.sopx = ctpx.sopx
 join nhanvien nv on px.manv = nv.manv
 join sanpham sp on ctpx.masp = sp.masp
 where month(px.ngayban) <=6 and year(px.ngayban) = 1999;
 -- Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành (gồm tất cả thông tin của khách hàng)
 select *from khachhang kh where month(kh.ngaysinh) = month(curdate());
 -- Liệt kê các hóa đơn bán hàng từ ngày 15/04/1999 đến 15/05/1999 gồm các thông tin:
 -- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
select px.sopx, nv.manv, px.ngayban, sp.masp, sp.donvitinh, ctpx.soluong, ctpx.giaban,(ctpx.soluong * ctpx.giaban ) as doanhthu
 from phieuxuat px join ctphieuxuat ctpx on px.sopx = ctpx.sopx
 join nhanvien nv on px.manv = nv.manv
 join sanpham sp on ctpx.masp = sp.masp
 where px.ngayban between '1999-04-15' and '1999-05-15';
-- Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: số phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá.
select px.sopx, px.ngayban, kh.makh, kh.tenkh , sum(ctpx.soluong * ctpx.giaban) as 'Tổng tiền'
 from phieuxuat px join khachhang kh on px.makh = kh.makh
 join ctphieuxuat ctpx on px.sopx = ctpx.sopx
 group by  px.sopx, px.ngayban, kh.makh, kh.tenkh ;
 -- Cho biết tổng số chai nước xả vải Comfort đã bán trong 6 tháng đầu năm 1999. Thông tin hiển thị: tổng số lượng.
select sum(ctpx.soluong) as 'Tổng số lượng'
from phieuxuat px join khachhang kh on px.makh = kh.makh
 join ctphieuxuat ctpx on px.sopx = ctpx.sopx
 where month(px.ngayban) <= 6 and year(px.ngayban) = 1999;
 -- Tổng kết doanh thu theo từng khách hàng theo tháng, gồm các thông tin: tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền.
 select month(px.ngayban) as 'tháng' ,kh.makh, kh.tenkh, kh.diachi, sum(ctpx.soluong * ctpx.giaban) as 'Tổng tiền'
 from khachhang kh join phieuxuat px on kh.makh = px.makh
 join ctphieuxuat ctpx on px.sopx = ctpx.sopx
 group by month(px.ngayban) ,kh.makh, kh.tenkh, kh.diachi;
 -- Thống kê tổng số lượng sản phẩm đã bán theo từng tháng trong năm, gồm
-- thông tin: năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng
select year(px.ngayban)as 'năm', month(px.ngayban) as 'tháng' , sp.masp, sp.tensp, sp.donvitinh, sum(ctpx.soluong) as 'Tổng số lượng'
 from sanpham sp join ctphieuxuat ctpx on sp.masp = ctpx.masp
join phieuxuat px on px.sopx = ctpx.sopx
group by year(px.ngayban), month(px.ngayban) , sp.masp, sp.tensp, sp.donvitinh;
-- Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 1999, thông tin hiển thị gồm: tháng, doanh thu.
select month(px.ngayban) as 'tháng',(ctpx.soluong * ctpx.giaban ) as doanhthu
 from phieuxuat px join ctphieuxuat ctpx on px.sopx = ctpx.sopx
 join nhanvien nv on px.manv = nv.manv
 join sanpham sp on ctpx.masp = sp.masp
 where month(px.ngayban) <=6 and year(px.ngayban) = 1999;
 -- .Liệt kê các hóa đơn bán hàng của tháng 5 và tháng 6 năm 2018, gồm các
-- thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng, tổng trị giá.
select px.sopx, px.ngayban, nv.hoten, kh.tenkh, sum(ctpx.soluong * ctpx.giaban) as 'tổng tiền'
from phieuxuat px join ctphieuxuat ctpx on px.sopx = ctpx.sopx
join nhanvien nv on nv.manv = px.manv
join khachhang kh on kh.makh = px.makh
WHERE (MONTH(px.ngayban) = 5 OR MONTH(px.ngayban) = 6) AND YEAR(px.ngayban) = 2018
group by  px.sopx, px.ngayban, nv.hoten, kh.tenkh;
-- 6.15 .Cuối ngày, nhân viên tổng kết các hóa đơn bán hàng trong ngày, thông tin
-- gồm: số phiếu xuất, mã khách hàng, tên khách hàng, họ tên nhân viên bán hàng, ngày bán, trị giá.
	select px.sopx, kh.makh, kh.tenkh, nv.hoten, px.ngayban, sum(ctpx.soluong * ctpx.giaban) as 'tổng tiền'
	from phieuxuat px join ctphieuxuat ctpx on px.sopx = ctpx.sopx
	join nhanvien nv on nv.manv = px.manv
	join khachhang kh on kh.makh = px.makh
	where date(px.ngayban) = curdate()
	group by  px.sopx, kh.makh, kh.tenkh, nv.hoten, px.ngayban;
-- Thống kê doanh số bán hàng theo từng nhân viên, gồm thông tin:
-- mã nhânvviên, họ tên nhân viên, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.
select nv.manv, nv.hoten, sp.masp , sp.tensp, sp.donvitinh, sum(ctpx.soluong * ctpx.giaban) as 'tổng tiền'
	from phieuxuat px join ctphieuxuat ctpx on px.sopx = ctpx.sopx
	join nhanvien nv on nv.manv = px.manv
	join sanpham sp on sp.masp = ctpx.masp
    where nv.manv like 'mã nhân viên '
    group by nv.manv, nv.hoten, sp.masp , sp.tensp, sp.donvitinh;
-- Liệt kê các hóa đơn bán hàng cho khách vãng lai (KH01) trong quý 2/1999,
-- thông tin gồm số phiếu xuất, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, đơn giá, thành tiền    
select px.sopx, px.ngayban, sp.masp, sp.tensp, sp.donvitinh, ctpx.soluong, ctpx.giaban, (ctpx.soluong * ctpx.giaban) as 'thành tiền'
	from phieuxuat px join ctphieuxuat ctpx on px.sopx = ctpx.sopx
	join nhanvien nv on nv.manv = px.manv
	join sanpham sp on sp.masp = ctpx.masp
    where px.makh = 'KH01' and month(px.ngayban) between 4 and 6 and year(px.ngayban) = 1999;
 -- Liệt kê các sản phẩm chưa bán được trong 6 tháng đầu năm 2018,
 -- thông tin gồm: mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính.
 select sp.masp, sp.tensp, sp.maloaisp, sp.donvitinh from sanpham sp where sp.masp not in
 ( select ctpx.masp from ctphieuxuat ctpx join phieuxuat px on ctpx.sopx = px.sopx
  where month(px.ngayban) <=6 and year(px.ngayban) = 1999
 );
 -- 6.19 .Liệt kê danh sách nhà cung cấp không giao dịch mua bán với cửa hàng trong quý 2/2018
 -- gồm thông tin: mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số điện thoại.
 select ncc.mancc, ncc.tenncc, ncc.diachi, ncc.dienthoai from nhacungcap ncc where ncc.mancc not in
 ( SELECT pn.mancc
    FROM phieunhap pn
    JOIN ctphieunhap ctpn ON pn.sopn = ctpn.sopn
    WHERE YEAR(pn.ngaynhap) = 2018 AND MONTH(pn.ngaynhap) BETWEEN 4 AND 6
 );
 -- Cho biết khách hàng có tổng trị giá đơn hàng lớn nhất trong 6 tháng đầu năm 1999. 
 select kh.MaKH, kh.TenKH, sum(ctpx.soluong * ctpx.giaban) as 'tổng tiền'
 from khachhang kh join phieuxuat px on kh.makh = px.makh
 join ctphieuxuat ctpx on px.sopx = ctpx.sopx
 where month(px.ngayban) <= 6 and year(px.ngayban) =1999
 group by kh.MaKH, kh.TenKH
 order by 'tổng tiền' desc limit 1;
 -- 6.21 Cho biết mã khách hàng và số lượng đơn đặt hàng của mỗi khách hàng
 select kh.makh, count(px.sopx) as soluongdathang from khachhang kh join phieuxuat px on kh.makh = px.makh
 join ctphieuxuat ctpx on ctpx.sopx = px.sopx
 group by kh.makh;
 -- 6.23 Cho biết số lượng nhân viên nam, số lượng nhân viên nữ
select count(CASE WHEN nv.gioitinh = 'nam' THEN 1 END) AS soluong_nam,
count(CASE WHEN nv.gioitinh = 'nữ' THEN 1 END) AS soluong_nu
from nhanvien nv; 
 