# StudentListTestApp
Список студентов. Прототип. Данное приложение является основной для реализации идеи создания TeamYorList -  приложения, которое позволит любительским спортивным командам,
вести учет своего состава, а так же планировать мерроприятия и собирать различные данные( напрмер для заказа формы -размерная сетка-цвет) ⚽️ 🏀 🏈
1) Создать класс “Студент” с произвольными характеристиками и методами (обязательно добавить Имя, рейтинг и пол)✅
Реализовано в отдельном файле  ❗️StudentModel через Struct:
 ##
    struct Student {
    let firstName : String
    let lastName : String
    let rating : Int
    let profilUrl: String?
    let gender: GenderSortType
    
    enum GenderSortType: String {
        case male = "Male"
        case famale = "Famale"
    }
    
    init(firstName: String, lastName: String, rating: Int, gender: GenderSortType,   profilUrl: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.rating = rating
        self.gender = gender
        self.profilUrl = profilUrl
    }
##


2) Создать несколько десятков различных локальных объектов класса Студент.✅
Реализовано функцией:
##
    func createStudentsArray() -> [Student]
##
3) Создать ViewController с таблицей, куда поместить всех студентов, сортировка по фамилии.✅
Сортировка произведена при создании массива по фамилии. Таблица создана в отдельном файле CocoaTouc класса: 
##
    class StudentTableViewCell: UITableViewCell !
##
4) Над таблицей разместить searchBar (при желании, можно вынести в navigationBar), при вводе каждого символа производить выборку студентов (искать по фамилии и имени).✅
Вынесено в navigationBar, реализованы методы фильтрации и поиска по фамилии и имени.

Дополнительно:

●	Добавить в класс “Студент” атрибут “Профиль в соц. сетях”, который будет optional. В таблице, при нажатии на ячейку студента, производить переход в webView, где открывать ссылку. Если ссылки нет, то выдавать сообщение (Alert) с произвольным текстом.
Реализовано при помощи WKWebView, в отдельном контроллере DetailViewController.Кроме проверки условия, когда значение опционального атрибута  отсутствует, реализована функция проверки валидности URL:
##
    extension String {
    func canOpenUrl() -> Bool {
        guard let url = URL(string: self), UIApplication.shared.canOpenURL(url) else { return false }
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: self)
    }
##    
●	Добавить в navigationBar кнопку “Фильтры”, по нажатию на которую будет появляться экран фильтров (PresentViewController). На экране поместить фильтры:
Не реализован. Временно заменено на создание scopeBar, и фильтрацию только по гендерной принадлежности 🚻
- только отличники ❓
- только мальчики/девочки❗️

●	Добавить возможность изменить данные какого-либо студента ❌
Не реализованою. Не успел по времени. Планирую реализовать с использование базы данных Realm.
