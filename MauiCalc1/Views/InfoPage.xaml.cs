using System.Collections.ObjectModel;

namespace MauiCalc1;

public partial class InfoPage : ContentPage
{
    public InfoPage()
    {
        InitializeComponent();
    }
    private async void OnGitClicked(object sender, EventArgs e)
    {
        try
        {
            Uri uri = new Uri("https://github.com/nyox2stupid/MauiCalc");
            await Browser.Default.OpenAsync(uri, BrowserLaunchMode.SystemPreferred);
        }
        catch (Exception ex)
        {
            // An unexpected error occurred. No browser may be installed on the device.
        }
    }
}