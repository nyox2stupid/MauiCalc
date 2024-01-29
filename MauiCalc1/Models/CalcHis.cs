using SQLite;

namespace MauiCalc1
{
    public class CalcHis
    {
        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }
        public string Berechnung { get; set; }
    }
}
