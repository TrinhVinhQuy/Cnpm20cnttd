using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Item
/// </summary>
public class Item
{
    private String masanpham;
    private String tensanpham;
    private double dongia;
    private int soluong;
    private String hinhanh;
    private int idkhach;
    public String MASANPHAM
    {
        set { this.masanpham = value; }
        get { return this.masanpham; }
    }
    public String TENSANPHAM
    {
        set { this.tensanpham = value; }
        get { return this.tensanpham; }
    }
    public String HINHANH
    {
        set { this.hinhanh = value; }
        get { return this.hinhanh; }
    }
    public double DONGIA
    {
        set { this.dongia = value; }
        get { return this.dongia; }
    }
    public int SOLUONG
    {
        set { this.soluong = value; }
        get { return this.soluong; }
    }
    public int IDKHACH
    {
        set { this.idkhach = value; }
        get { return this.idkhach; }
    }
    public double THANHTIEN
    {
        get { return this.soluong * this.dongia; }
    }
    public Item(String masanpham, string tensanpham, string hinhanh, int soluong, double dongia, int idkhach)
    {
        this.masanpham = masanpham;
        this.tensanpham = tensanpham;
        this.hinhanh = hinhanh;
        this.soluong = soluong;
        this.dongia = dongia;
        this.idkhach = idkhach;
    }
    public Item()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}