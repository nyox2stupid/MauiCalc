using System.Collections.ObjectModel;

namespace MauiCalc1;

public partial class SettingsPage : ContentPage
{
    public ObservableCollection<CalcSettings> Items { get; set; } = new();
    CalcSettingsDatabase itemDatabase;
    public SettingsPage()
    {
        InitializeComponent();
        itemDatabase = new CalcSettingsDatabase();
        BindingContext = this;
    }
    int value = 0;
    void OnSliderValueChanged(object sender, ValueChangedEventArgs args)
    {
        value = (int)args.NewValue;
        displayButton.Text = String.Format("Apply Font size {0}", value);
        displayButton.FontSize = value; 
    }

    private void ApplyFontSize(object sender, EventArgs args)
    {
        displayButton.FontSize = value;
        
    }

    private async void OnBackClicked(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
    }

    protected override async void OnNavigatedTo(NavigatedToEventArgs args)
    {
        // int val = item
        // FontSizeSlider.Value = val;
    }
}