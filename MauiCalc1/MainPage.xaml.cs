using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using Microsoft.Maui.Animations;
using SQLite;
using System.Collections.ObjectModel;
using System.Data;
using System.Globalization;
using System.Threading.Tasks;

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
            //else if (CalcContent.Text.Length < 17)
            //{
            //    CalcContent.Text += btn;
            //}
            //else
            //{
            //    toaster("max decimal index count reached");
            //}
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
                CalcContent.Text = "" + (Convert.ToDecimal(new DataTable().Compute(CalcContent.Text.Replace(',', '.'), null), CultureInfo.InvariantCulture));
                // CalcContent.Text = RoundOrNot(CalcContent.Text);
                //CalcContent.Text = RoundOrNot(CalcContent.Text);
                //while (CalcContent.Text[CalcContent.Text.Length - 1] == '0')
                //{
                //    CalcContent.Text.Remove(CalcContent.Text.Length - 1);
                //}
                CalcHis calcHis = new CalcHis();
                calcHis.Berechnung = CalcContent.Text;
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

        string RoundOrNot(string input)
        {
            try
            {
                // if digits exist after '.' && last digit is 9
                if (input.Length - 1 > input.IndexOf('.') && int.Parse("" + input[input.Length - 1]) >= 5 && input.Length > 1) {
                    // get decimal count after '.': input.Length - input.IndexOf('.')
                    int decount = input.Length - input.IndexOf('.');
                    // string addup = 0.(amount of 0's for decimal count - 1)1
                    // decimal addup = decimal.Parse(input.Substring(0, decount));
                    string addup = "0.";
                    for (int i = 0; i < decount - 2; i++)
                    {
                        addup += 0;
                    }
                    addup += (10 - int.Parse("" + input[input.Length - 1]));
                    // input =
                    input = "" + (decimal.Parse(input) + decimal.Parse(addup));
                }
            }
            catch {
            }
            return input;
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

        private void OnSettingsClicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PushModalAsync(new SettingsPage(), true);
        }

        private async void OnLoadClicked(object sender, EventArgs e)
        {
            var items = await itemDatabase.GetItemsAsync();

            MainThread.BeginInvokeOnMainThread(() =>
            {
                Items.Clear();
                //foreach (var item in items)
                CalcContent.Text = items.LastOrDefault().Berechnung;                    
            });
        }
    }
}