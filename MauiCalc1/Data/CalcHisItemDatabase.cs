using SQLite;

namespace MauiCalc1
{
    public class CalcHisItemDatabase
    {
        SQLiteAsyncConnection Database;

        public CalcHisItemDatabase()
        {
        }

        async Task Init()
        {
            if (Database is not null)
                return;

            Database = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
            var result = await Database.CreateTableAsync<CalcHis>();
        }
        public async Task<List<CalcHis>> GetItemsAsync()
        {
            await Init();
            return await Database.Table<CalcHis>().ToListAsync();
        }
        public async Task<CalcHis> GetItemAsync(int id)
        {
            await Init();
            return await Database.Table<CalcHis>().Where(i => i.ID == id).FirstOrDefaultAsync();
        }

        public async Task<int> SaveItemAsync(CalcHis item)
        {
            await Init();
            if (item.ID != 0)
                return await Database.UpdateAsync(item);
            else
                return await Database.InsertAsync(item);
        }

        public async Task<int> DeleteItemAsync()
        {
            await Init();
            return await Database.Table<CalcHis>().DeleteAsync(x => x.ID != 0);
        }
    }
}
