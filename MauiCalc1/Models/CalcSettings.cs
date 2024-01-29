using SQLite;

namespace MauiCalc1
{
    public class CalcSettings
    {
        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }
        public int globalfontsize { get; set; }
    }
}
