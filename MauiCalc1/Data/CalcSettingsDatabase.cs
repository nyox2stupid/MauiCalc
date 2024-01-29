using SQLite;

namespace MauiCalc1
{
    public class CalcSettingsDatabase
    {
        SQLiteAsyncConnection Database;

        public CalcSettingsDatabase()
        {
        }

        async Task Init()
        {
            if (Database is not null)
                return;

            Database = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
            var result = await Database.CreateTableAsync<CalcSettings>();
        }
        public async Task<List<CalcSettings>> GetItemsAsync()
        {
            await Init();
            return await Database.Table<CalcSettings>().ToListAsync();
        }
        public async Task<CalcSettings> GetItemAsync(int id)
        {
            await Init();
            return await Database.Table<CalcSettings>().Where(i => i.ID == id).FirstOrDefaultAsync();
        }

        public async Task<int> SaveItemAsync(CalcSettings item)
        {
            await Init();
            if (item.ID != 0)
                return await Database.UpdateAsync(item);
            else
                return await Database.InsertAsync(item);
        }
    }
}
