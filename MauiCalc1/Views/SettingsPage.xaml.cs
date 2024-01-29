using System.Collections.ObjectModel;

namespace MauiCalc1;

public partial class SettingsPage : ContentPage
{
    public ObservableCollection<CalcSettings> Items { get; set; } = new();
    CalcSettingsDatabase itemDatabase;
    CalcSettings calcSettings { get; set; } = new();
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
        calcSettings.globalfontsize = value;
    }

    private void ApplyFontSize(object sender, EventArgs args)
    {
        displayButton.FontSize = value;
        itemDatabase.SaveItemAsync(calcSettings);
    }

    protected override async void OnNavigatedTo(NavigatedToEventArgs args)
    {
        calcSettings = await itemDatabase.GetSettingAsync();
        if (calcSettings == null)
        {
            calcSettings = new CalcSettings();
            return;
        }

        MainThread.BeginInvokeOnMainThread(() =>
        {
            FontSizeSlider.Value = calcSettings.globalfontsize;
        });
    }
}