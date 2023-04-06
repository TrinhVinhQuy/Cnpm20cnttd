using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{
    Dictionary<string, Item> listcarts;
    public Dictionary<string, Item> LISTCARTS
    {
        get { return this.listcarts; }
    }
    public Cart()
    {
        listcarts = new Dictionary<string, Item>();
    }
    public void AddCart(String masanpham, string tensanpham, string hinhanh, int soluong, double dongia,int idkhach)
    {
        Item item = new Item(masanpham, tensanpham, hinhanh, soluong, dongia, idkhach);

        if (listcarts.ContainsKey(item.MASANPHAM))

            listcarts[item.MASANPHAM].SOLUONG += item.SOLUONG;
        else
            listcarts.Add(item.MASANPHAM, item);
    }
    public void RemoveCart(String masanpham)
    {
        listcarts.Remove(masanpham);
    }
    public double TotalBill()
    {
        double total = 0;
        foreach (Item item in listcarts.Values)
            total += item.THANHTIEN;
        return total;
    }
}