package com.finalproject.festival.domain;

import java.sql.Timestamp;

public class Product {
	
	private int productno;
	private String productname;
	private String productcontent;
	private int productprice;
	private String productimage;
	private String productlocation;
	private Timestamp productopendate;
	private Timestamp productclosedate;
	private int productbookmarkcount;
	private int productreadcount;
	private int productticketcount;
	private int productremainticketcount;
	private String adminpassword;
	
	public Product() {}
	
	public Product(int productno,  String productname, String productcontent,  int productprice, String productimage, String productlocation, 
			Timestamp productopendate, Timestamp productclosedate, 
			int productbookmarkcount, int productreadcount, int productticketcount,  int productremainticketcount,
			String adminpassword) {
		
		this.productno = productno;
		this.productname = productname;
		this.productcontent = productcontent;
		this.productprice = productprice;
		this.productimage = productimage;
		this.productlocation = productlocation;
		this.productopendate = productopendate;
		this.productclosedate = productclosedate;
		this.productbookmarkcount = productbookmarkcount;
		this.productreadcount = productreadcount;
		this.productticketcount = productticketcount;
		this.productremainticketcount = productremainticketcount;
		this.adminpassword = adminpassword;
	}

	public int getProductno() {
		return productno;
	}

	public void setProductno(int productno) {
		this.productno = productno;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductcontent() {
		return productcontent;
	}

	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getProductlocation() {
		return productlocation;
	}

	public void setProductlocation(String productlocation) {
		this.productlocation = productlocation;
	}

	public Timestamp getProductopendate() {
		return productopendate;
	}

	public void setProductopendate(Timestamp productopendate) {
		this.productopendate = productopendate;
	}

	public Timestamp getProductclosedate() {
		return productclosedate;
	}

	public void setProductclosedate(Timestamp productclosedate) {
		this.productclosedate = productclosedate;
	}

	public int getProductbookmarkcount() {
		return productbookmarkcount;
	}

	public void setProductbookmarkcount(int productbookmarkcount) {
		this.productbookmarkcount = productbookmarkcount;
	}

	public int getProductreadcount() {
		return productreadcount;
	}

	public void setProductreadcount(int productreadcount) {
		this.productreadcount = productreadcount;
	}

	public int getProductticketcount() {
		return productticketcount;
	}

	public void setProductticketcount(int productticketcount) {
		this.productticketcount = productticketcount;
	}

	public int getProductremainticketcount() {
		return productremainticketcount;
	}

	public void setProductremainticketcount(int productremainticketcount) {
		this.productremainticketcount = productremainticketcount;
	}

	public String getAdminpassword() {
		return adminpassword;
	}

	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}

}
