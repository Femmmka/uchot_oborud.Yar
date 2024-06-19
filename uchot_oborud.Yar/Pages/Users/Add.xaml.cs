using System;
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

namespace uchot_oborud.Yar.Pages.Users
{
    public partial class Add : Page
    {
        UsersContext users;
        List<RolesContext> AllRoles = RolesContext.Select();
        public Add(UsersContext users = null)
        {
            InitializeComponent();

            foreach (Models.Roles item in AllRoles)
                role.Items.Add(item.roles);

            if (users != null)
            {
                this.users = users;
                login.Text = users.login;
                Password.Password = users.Password;
                Surname.Text = users.Surname;
                Name.Text = users.Name;
                role.SelectedIndex = AllRoles.FindIndex(x => x.roles == users.Role);
                email.Text = users.Email;
                Patronymic.Text = users.Patronymic;
                Telephone.Text = users.Phone;
                btnAdd.Content = "Изменить";
            }
        }

        private void AddRecord(object sender, RoutedEventArgs e)
        {
            if (login.Text == "" || !Classes.Common.CheckRegex.Match("^[А-Яа-яA-Za-z]*$", login.Text))
            {
                MessageBox.Show("Необходимо правильно указать логин (без цифр)");
                return;
            }

            if (Password.Password == "")
            {
                MessageBox.Show("Необходимо указать пароль");
                return;
            }

            if (Surname.Text == "" || !Classes.Common.CheckRegex.Match("^[А-Яа-яA-Za-z]*$", Surname.Text))
            {
                MessageBox.Show("Необходимо правильно указать фамилию");
                return;
            }

            if (Name.Text == "" || !Classes.Common.CheckRegex.Match("^[А-Яа-яA-Za-z]*$", Name.Text))
            {
                MessageBox.Show("Необходимо указать имя");
                return;
            }

            if (Patronymic.Text == "" || !Classes.Common.CheckRegex.Match("^[А-Яа-яA-Za-z]*$", Patronymic.Text))
            {
                MessageBox.Show("Необходимо указать отчество");
                return;
            }

            if (email.Text == "" || !Classes.Common.CheckRegex.Match("^((\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)\s*[;]{0,1}\s*)+$", email.Text))
            {
                MessageBox.Show("Необходимо указать электронную почту");
                return;
            }

            if (Telephone.Text == "" || !Classes.Common.CheckRegex.Match("^((\+7|7|8)+([0-9]){10})$", Telephone.Text))
            {
                MessageBox.Show("Необходимо указать номер телефона");
                return;
            }

            if (users == null)
            {
                UsersContext newUser = new UsersContext(
                    0,
                    login.Text,
                    Password.Password,
                    AllRoles.Find(x => x.roles == role.SelectedItem).roles,
                    email.Text,
                    Surname.Text,
                    Name.Text,
                    Patronymic.Text,
                    Telephone.Text
                    );
                newUser.Add();
                MessageBox.Show("Запись добавлена");
            }
            else
            {
                users = new UsersContext(
                    users.Id,
                    login.Text,
                    Password.Password,
                    AllRoles.Find(x => x.roles == role.SelectedItem).roles,
                    email.Text,
                    Surname.Text,
                    Name.Text,
                    Patronymic.Text,
                    Telephone.Text
                    );
                users.Update();
                MessageBox.Show("Запись обновлена");
            }

            MainWindow.init.OpenPages(new Pages.Users.Main());
        }
    }
}
