<?php
if(isset($_GET['file'])) {
    $file = $_GET['file'];

    switch($file) {
        case 'logo':
            header('Content-Type: image/png');
            echo base64_decode('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UmVhZHlxyWU8AAADIWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS41LWMwMTQgNzkuMTUxNDgxLCAyMDEzLzAzLzEzLTEyOjA5OjE1ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjVEMDRGMUQxQTRFNzExRTZCMTVFREZBMTc3MEU3RjA3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjVEMDRGMUQyQTRFNzExRTZCMTVFREZBMTc3MEU3RjA3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NUQwNEYxQ0ZBNEU3MTFFNkIxNUVERkExNzcwRTdGMDciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NUQwNEYxRDBBNEU3MTFFNkIxNUVERkExNzcwRTdGMDciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7p88BTAAAHDUlEQVR42uxcf0hdVRx/OleubUlSRo4k2ZjrByVYWWDkLIZjTNyw3mhEsv5YMQYGY/WHwUIqQmgQMhYYGGUtKFYsLB7NSsqCEb3A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');
            break;
    }

    exit() or die();
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PHP Stack</title>
    <style type="text/css">
        body{padding: 0;margin: 0; background-color: #fdfdfd;font-size: 13px;color: #979797; font-family: sans-serif}
        header{width: 100%;height: 72px;background-color: #1daded}
        .site-logo{display: inline-block;width: 95px;margin: 13px 0;}
        .php-infoBtn{font-size: 16px;color: #fff;float: right;line-height: 70px;text-decoration: none}
        h1{font-size: 36px;margin: 14px 0 6px 0; color: #5c565a;font-weight: lighter}
        h3{color: #5c565a; font-size: 18px; padding-bottom: 18px;font-weight: lighter;margin-bottom: 0;border-bottom: 2px solid #ffde5a;display: inline-block}
        section.container{padding-top: 50px;padding-bottom: 85px;}
        .container{max-width: 1120px;margin: 0 auto;padding-left: 15px;padding-right: 15px}
        .list-container{width: 46%;margin: 0 2% 0 0; float: left;max-width: 538px}
        ul{border-top: 1px solid #f0f0f0;padding: 30px 0 0 16px;margin: -1px 0 15px 0;max-width: 550px}
        ul li{line-height: 21px;list-style: square;margin-bottom: 7px}
        ul li a{font-size: 13px; line-height: 21px; color: #979797;text-decoration: none}
        footer{height: 55px;line-height: 55px;background-color: #fff}
        footer div{margin: 0 auto;}
        @media screen and (min-width: 600px) and (max-width: 960px) {}
        @media (max-width: 599px) {
            h1 {font-size: 24px;}
            .list-container{width: 100%;margin: 0}
            section.container{padding-top: 25px}
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <a href="#" class="site-logo">
            <img src="?file=logo" alt="logo">
        </a>
    </div>
</header>
<section class="container">
    <h1>Some Useful Links for You to Get Started</h1>
    <div class="list-container">
        <h3>Knowledge Base</h3>
        <ul>
            <li><a href="https://support.cloudways.com/how-do-i-take-my-website-live-from-cloudways//?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How do I take my website live from Cloudways?</a></li>
            <li><a href="https://support.cloudways.com/how-to-change-php-fpm-settings/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to change PHP-FPM on Cloudways</a></li>
            <li><a href="https://support.cloudways.com/what-can-i-do-from-the-packages-tab-of-server-settings-packages-section/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">What can I do from packages tab</a></li>
            <li><a href="https://support.cloudways.com/how-to-manage-your-databases-using-the-integrated-database-manager/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to access MySQL Database</a></li>
            <li><a href="https://support.cloudways.com/do-you-offer-addons/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to setup Add-ons.</a></li>
            <li><a href="https://support.cloudways.com/how-to-automate-git-deployment-via-cloudways-api/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to automate Git Deployment via Cloudways API.</a></li>
            <li><a href="https://support.cloudways.com/how-to-upgrade-to-php-7/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to upgrade to PHP 7.</a></li>
            <li><a href="https://support.cloudways.com/how-to-install-phpmyadmin-on-cloudways/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install PHPMyAdmin On Cloudways.</a></li>
            <li><a href="https://support.cloudways.com/how-to-check-logs-via-sshsftp/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to check logs via SSH/SFTP</a></li>
        </ul>
    </div>
    <br clear="all">
    <div class="list-container">
        <h3>CMS you can install</h3>
        <ul>
            <li><a href="https://www.cloudways.com/blog/install-phpbb-on-cloud-server/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install PHPBB on Cloudways. </a></li>
            <li><a href="https://www.cloudways.com/blog/how-to-install-october-cms/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install OctoberCMS on Cloudways. </a></li>
            <li><a href="https://www.cloudways.com/blog/xcart-on-cloud/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install X-Cart on Cloudways. </a></li>
            <li><a href="https://www.cloudways.com/blog/install-zen-cart-on-cloud/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install Zen Cart on Cloudways. </a></li>
            <li><a href="https://www.cloudways.com/blog/install-craft-cms-on-cloud/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install Craft CMS on Cloudways .</a></li>
        </ul>
    </div>

    <div class="list-container">
        <h3>Frameworks you can install</h3>
        <ul>
            <li><a href="https://www.cloudways.com/blog/install-yii-2-framework-on-cloud/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install Yii 2 Framework on Cloudways.</a></li>
            <li><a href="https://www.cloudways.com/blog/install-symfony-3-on-cloud/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install Symfony 3 Framework on Cloudways.</a></li>
            <li><a href="https://www.cloudways.com/blog/install-cakephp-on-cloud/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install CakePHP Framework on Cloudways. </a></li>
            <li><a href="https://www.cloudways.com/blog/host-codeigniter-php-on-cloud/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install CodeIgniter Framework on Cloudways.</a></li>
            <li><a href="https://www.cloudways.com/blog/install-nette-on-cloud-using-ssh/?utm_source=PHP%20Stack%20Page&utm_medium=PHP%20Stack%20Page&utm_campaign=PHP%20Stack%20Page">How to install Nette Framework on Cloudways.</a></li>
        </ul>
    </div>
    <br clear="all">
</section>
<footer><div class="container">&copy; 2011-<?=date('Y');?> Cloudways Ltd. All right reserved</div></footer>
</body>
</html>