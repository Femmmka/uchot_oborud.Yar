﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using uchot_oborud.Yar.Classes;

namespace uchot_oborud.Yar.Pages.Classroom.Items
{
    /// <summary>
    /// Логика взаимодействия для Item.xaml
    /// </summary>
    public partial class Item : UserControl
    {

        List<ClassroomContext> AllClassrooms = ClassroomContext.Select();
        List<EquipmentContext> AllEquipment = EquipmentContext.Select();

        ClassroomContext item;

        Main main;
        public Item(ClassroomContext item, Main main)
        {
            InitializeComponent();
            if (MainWindow.init.ActiveUser.Role == "Пользователь")
            {
                Edit.Visibility = Visibility.Hidden;
                Delete.Visibility = Visibility.Hidden;
            }
            Name.Text = item.Name;
            Code.Text = item.Code;
            this.item = item;
            this.main = main;
        }
        private void EditRecord(object sender, RoutedEventArgs e) =>
            MainWindow.init.OpenPages(new Pages.Classroom.Add(this.item));
        private void DeleteRecord(object sender, RoutedEventArgs e)
        {
            bool empty = false;
            foreach (EquipmentContext equip in AllEquipment)
            {
                if (equip.Id_classroom == item.Id) empty = true;
            }
            if (empty)
            {
                if (MessageBox.Show("Вы уверены, что хотите удалить данную запись? При ее удалении пропадут данные об оборудовании с таким статусом", "Предупреждение", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    item.Delete();
                    main.parent.Children.Remove(this);
                }
            }
            else
            {
                item.Delete();
                main.parent.Children.Remove(this);
            }
        }
    }
}
