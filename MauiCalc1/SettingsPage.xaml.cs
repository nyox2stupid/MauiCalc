namespace MauiCalc1;

public partial class SettingsPage : ContentPage
{
	public SettingsPage()
	{
		InitializeComponent();
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
}