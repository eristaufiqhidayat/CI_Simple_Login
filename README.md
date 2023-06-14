# Simple Login and Management Menu v

- FW CodeIgniter 4,

- template AdminLTE,

- Auth sistem Myth/Auth,

- database MySql

#### Screenshot Login

![App Screenshot](menu_login.jpg)

#### Screenshot Menu

![App Screenshot](CI_Simple_login.jpg)

#### Screenshot Reset Password

![App Screenshot](reset_password.jpg)

#### Screenshot Relationsip table

![App Screenshot](relationsip.jpg)

## Prerequisites

The following requirements must be met to be able to use the GitHub Actions Importer:

- Apache, Php and MySql Must be installed.

## 1. Installation CodeIgneter 4

### Create directory project in root

### example

For xampp with mysql database

```bash
mkdir c:\xamp\htdocs\CI_Simple_Login
```

### Change Directory

```bash
cd c:\xamp\htdocs\CI_Simple_Login
```

### execute this command

```bash
composer create-project codeigniter4/appstarter .
```

### edit app/Config/App.php

```bash
public string $baseURL = 'http://localhost/CI_Simple_Login/public/';
```

### edit app/Config/Constants.php, create new define

```bash

define('BPATH', 'http://localhost/CI_SIMPLE_LOGIN');
```

### Rename env to .env

![App Screenshot](envsetting.jpg)

## 2. Installation Myth:Auth

### for Login

```bash
composer require myth/auth
```

### edit app/Config/Autoload.php

```bash
    $psr4 = [
        'Config'      => APPPATH . 'Config',
        APP_NAMESPACE => APPPATH,
        'App'         => APPPATH,
        'Myth\Auth'   => APPPATH . 'ThirdParty/myth-auth/src',
    ];
```

### execute this command.

```bash
composer create-project codeigniter4/appstarter .
```

### MY Configuration

Group Default "user"
My Conf requireActivation = null

### edit \vendor\myth\auth\src\Config\Auth.php

```bash
public $defaultUserGroup = 'user';
```

```bash
public $requireActivation = null;
```

### quick installation

1. Create Folder CI_Simple_Login inside htdocs and copy all source code
2. execute dummydata.sql in mysql server (phpmyadmin)
3. login : admin pass : 123

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

"Intinya Bebas dan Gratis"

Eris Taufiq H
