using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using System.Collections.ObjectModel;
using System.Data;
using System.Globalization;

namespace MauiCalc1
{
    public partial class MainPage : ContentPage
    {
        bool img = false;
        int egg = 0;

        public ObservableCollection<CalcHis> Items { get; set; } = new();
        CalcHisItemDatabase itemDatabase;

        public MainPage()
        {
            InitializeComponent();
            itemDatabase = new CalcHisItemDatabase();
            BindingContext = this;
        }

        private void OnCounterClicked(object sender, EventArgs e)
        {
            HapticFeedback.Default.Perform(HapticFeedbackType.Click);
            Button button = (Button)sender;
            string btn = button.Text;
            if (CalcContent.Text[CalcContent.Text.Length-1] == '+' || CalcContent.Text[CalcContent.Text.Length-1] == '-' || CalcContent.Text[CalcContent.Text.Length - 1] == '*' || CalcContent.Text[CalcContent.Text.Length - 1] == '/' || CalcContent.Text == "0")
            {
                if (btn == "+" || btn == "-" || btn == "*" || btn == "/" )
                {
                    DisplayAlert("Are you retarted?", "You cant place a symbol there!", "sorry im retarted");
                    //Vibration.Vibrate(1000);
                }
                else if (CalcContent.Text == "0" && btn != ".")
                {
                    CalcContent.Text = btn;

                }
                else
                {
                    CalcContent.Text += btn;
                }
            }
            else if (CalcContent.Text[CalcContent.Text.Length - 1] == '.' && btn == ".")
            {
                DisplayAlert("Are you retarted?", "You cant place a symbol there!", "sorry im retarted");
                //Vibration.Vibrate(1000);
            }
            else
            { 
                CalcContent.Text += btn; 
            }
            SemanticScreenReader.Announce(CalcContent.Text);
        }
        private void OnClearClicked(object sender, EventArgs e)
        {
            //Vibration.Vibrate(125);
            CalcContent.Text = "0";
        }
        private void OnCalcClicked(object sender, EventArgs e)
        {
            //Vibration.Vibrate(125);
            if (egg == 10)
            {
                CatImg.Source = "https://i.ibb.co/PtyyVhz/IMG-20240112-WA0020.jpg";
                img = true;
                egg = 0;
            }
            else if(CalcContent.Text == "0" && img == false)
            {
                egg++;
            }
            else if(CalcContent.Text == "0" && img == true) {
                CatImg.Source = "";
                img = false;
            }
            try
            {
                string berechnungtosave = CalcContent.Text;
                CalcContent.Text = "" + (Convert.ToDouble(new DataTable().Compute(CalcContent.Text.Replace(',', '.'), null), CultureInfo.InvariantCulture));
                berechnungtosave += "=" + CalcContent.Text;
                CalcHis calcHis = new CalcHis();
                calcHis.Berechnung = berechnungtosave;
                itemDatabase.SaveItemAsync(calcHis);
            }
            catch
            {
                DisplayAlert("Error!", "Invalid Operation", "Ok");
            }
        }

        private void OnBackClicked(object sender, EventArgs e)
        {
            //Vibration.Vibrate(35);
            if (CalcContent.Text.Length == 1)
            {
                CalcContent.Text = "0";
            }
            else  if (CalcContent.Text.Length > 1)
            {
                CalcContent.Text = CalcContent.Text.Remove(CalcContent.Text.Length - 1);
            }
        }

        private void OnLabelClicked(object sender, EventArgs e)
        {
            if (CalcContent.Text != "0")
            {
                //Vibration.Vibrate(125);
                Clipboard.SetTextAsync(CalcContent.Text);

                toaster($"\"{CalcContent.Text}\" copied to clipboard");
            }
        }

        private async void OnSecretClicked(object sender, EventArgs e)
        {
            string result = await DisplayPromptAsync("vibrate test", "Enter time (ms) to vibrate", keyboard: Keyboard.Numeric);
            if (int.Parse(result) > 0) {
                //Vibration.Vibrate(int.Parse(result));
            }
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

        private async void OnSettingsClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync(nameof(SettingsPage), true);
        }

        private async void OnHistoryClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync(nameof(HistoryPage), true);
        }

        private async void OnInfoClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync(nameof(InfoPage), true);
        }

        private async void OnLoadClicked(object sender, EventArgs e)
        {
            var items = await itemDatabase.GetItemsAsync();

            MainThread.BeginInvokeOnMainThread(() =>
            {
                Items.Clear();
                CalcContent.Text = items.LastOrDefault().Berechnung;                    
            });
        }
    }
}