using System.Collections.ObjectModel;
namespace MauiCalc1;

public partial class HistoryPage : ContentPage
{
    public ObservableCollection<CalcHis> Items { get; set; } = new();
    CalcHisItemDatabase itemDatabase;
    public HistoryPage()
	{
        InitializeComponent();
        itemDatabase = new CalcHisItemDatabase();
        BindingContext = this;
    }

    private async void OnBackClicked(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
    }

    private async void OnLoadClicked(object sender, EventArgs e)
    {
        var items = await itemDatabase.GetItemsAsync();

        MainThread.BeginInvokeOnMainThread(() =>
        {
            Items.Clear();
            foreach (var item in items)
            {
                Items.Add(item);
            }
        });

        //Label label = new Label { Text = ttt };
    }

    private async void OnDeleteClicked(object sender, EventArgs e)
    {
        await itemDatabase.DeleteItemAsync();
    }
}