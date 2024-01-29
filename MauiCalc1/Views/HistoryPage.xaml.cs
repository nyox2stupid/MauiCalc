using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
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

    private async void OnDeleteClicked(object sender, EventArgs e)
    {
        await itemDatabase.DeleteItemAsync();

        MainThread.BeginInvokeOnMainThread(() =>
        {
            Items.Clear();
        });
    }

    protected override async void OnNavigatedTo(NavigatedToEventArgs args)
    {
        var items = await itemDatabase.GetItemsAsync();

        MainThread.BeginInvokeOnMainThread(() =>
        {
            Items.Clear();
            foreach (var item in items.OrderByDescending(dbitem => dbitem.ID))
            {
                Items.Add(item);
            }
        });
    }

    private async void CollectionView_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
        if (e.CurrentSelection.FirstOrDefault() is not CalcHis item)
            return;
        string clickeditem = item.Berechnung;
        Clipboard.SetTextAsync(clickeditem);
        toaster($"\"{clickeditem}\" copied to clipboard");
    }

    void toaster(string input)
    {
        CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

        string text = input;
        ToastDuration duration = ToastDuration.Short;
        double fontSize = 14;

        var toast = Toast.Make(text, duration, fontSize);

        toast.Show(cancellationTokenSource.Token);
    }
}