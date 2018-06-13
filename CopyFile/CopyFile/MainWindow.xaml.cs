using Microsoft.Win32;
using System;
using System.ComponentModel;
using System.IO;
using System.Windows;
using System.Windows.Controls;

namespace CopyFile
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        string PathFrom, PathTo, str;
        private BackgroundWorker backgroundWorker;
        public MainWindow()
        {
            InitializeComponent();
            backgroundWorker = (BackgroundWorker)this.FindResource("backgroundWoker");
        }

        private void SelectFrom()
        {
            OpenFileDialog dialog = new OpenFileDialog();
            //dialog.Filter = "all(*.*)|*.*";
            //dialog.Filter = "(*.rtf) | *.rtf | txt файлы(*.txt) | *.txt | (*.exe) | *.exe";
            if (dialog.ShowDialog() == true)
            {
                str = dialog.SafeFileName;
               // MessageBox.Show(str);
                PathFrom = dialog.FileName;
                TextFrom.Text = PathFrom;
            }
            else MessageBox.Show("Файл не выбран!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Warning);
        }
        private void SelecTo()
        {
            SaveFileDialog dialog = new SaveFileDialog();
            //dialog.Filter = "(*.rtf) | *.rtf | txt файлы(*.txt) | *.txt | (*.exe) | *.exe";
            dialog.FileName = str;
            if (dialog.ShowDialog() == true)
            {
                //dialog.FileName = str;
                PathTo = dialog.FileName;
                TextTo.Text = PathTo;
            }
            else MessageBox.Show("Вы не выбрали путь для копирования файла!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Warning);
        }

        private void BackgroundWorker_DoWork(object sender, DoWorkEventArgs e)
        {
            var data = (Tuple<string, string>)e.Argument;

            using (var input = new FileStream(data.Item1, FileMode.Open, FileAccess.Read))
            using (var output = new FileStream(data.Item2, FileMode.Create, FileAccess.Write))
            {
                byte[] buffer = new byte[4096];
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                {
                    if (backgroundWorker.CancellationPending)
                    {
                        e.Cancel = true;
                        return;
                    }

                    output.Write(buffer, 0, read);

                    float pct = (1.0f * input.Position) / input.Length * 100.0f;
                    backgroundWorker.ReportProgress((int)pct);
                }
            }
        }

        private void BackgroundWorker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            ProgressBar.Value = e.ProgressPercentage;
        }

        private void HideProgressBar()
        {
            ProgressBar.Value = 0;
            ProgressBar.Visibility = Visibility.Hidden;
        }

        private void BackgroundWorker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            if (e.Cancelled)
            {
                HideProgressBar();
                MessageBox.Show("Копирование отменено!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            if (e.Error != null)
            {
                HideProgressBar();
                MessageBox.Show("Ошибка копирования: " + e.Error.Message, "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            HideProgressBar();
            MessageBox.Show("Копирование завершено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void CopyFrom_Click(object sender, RoutedEventArgs e)
        {
            SelectFrom();
        }

        private void CopyTo_Click(object sender, RoutedEventArgs e)
        {
            SelecTo();
        }

        private void TextBoxFrom_TextChanged(object sender, TextChangedEventArgs e)
        {
        }

        private void TextBoxTo_TextChanged(object sender, TextChangedEventArgs e)
        {
        }

        private void CopyCancel_Click(object sender, RoutedEventArgs e)
        {
            backgroundWorker.CancelAsync();
        }

        private void Copy_Click(object sender, RoutedEventArgs e)
        {
            ProgressBar.Value = 0;
            ProgressBar.Visibility = Visibility.Visible;
            backgroundWorker.RunWorkerAsync(Tuple.Create(PathFrom, PathTo));          
        }
    }
}
