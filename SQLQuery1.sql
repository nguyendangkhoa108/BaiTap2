use CSDL
go
create trigger CheckSp on PRODUCT
for insert
as 
	begin
		if exists(select * from inserted where SoLuongSanPham <10)
			begin
				print 'so luong san pham duoi 10 ';
				rollback transaction;
				end
	end
Go

CREATE TRIGGER trg_XoaKh3
ON dbo.CUSTOMER
FOR DELETE
AS
IF 'KH5' IN (SELECT Deleted.MaKhachHang FROM Deleted)
BEGIN
PRINT N'Không Thể Xóa Bản ghi này'
ROLLBACK Tran
END

DELETE FROM dbo.CUSTOMER WHERE MaKhachHang LIKE	'KH5'

-----------------------------------------------------
--Tao trigger check so luong san pham
CREATE TRIGGER trg_checkQuantity
ON dbo.PRODUCT
FOR INSERT, UPDATE
AS
	IF(SELECT Inserted.SoLuongSanPham FROM Inserted) < 1
BEGIN
PRINT N'Số lượng sản phẩm tối thiểu là 1'
ROLLBACK TRANSACTION
END

INSERT dbo.PRODUCT(MaSanPham,TenSanPham,MoTa,GiaSanPham,SoLuongSanPham)
VALUES(N'SP5',N'Vở',N'Giấy',6000,0)
-----------------------


