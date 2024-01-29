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

    private async void OnBackClicked(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
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
            foreach (var item in items)
            {
                Items.Add(item);
            }
        });
    }

    private async void CollectionView_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
        // string clickeditem = Item
        // Clipboard.SetTextAsync(clickeditem);
        // toaster($"\"{t}\" copied to clipboard");
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