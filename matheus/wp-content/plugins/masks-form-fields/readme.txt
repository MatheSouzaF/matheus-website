=== Masks Form Fields ===
Contributors: ivanpetermann
Donate link: https://ivanpetermann.com/donation
Tags: form, mask, phone, field, contact form 7
Requires at least: 4.5
Tested up to: 6.5
Requires PHP: 5.6
Stable tag: 1.11.1
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

A plugin to add masks in the form’s fields.

== Description ==

Add a class in the form field.

Example of use with [Contact Form 7](https://wordpress.org/plugins/contact-form-7/): 

`[tel your-phone class:phone placeholder "Phone"]`

Listing of classes available for use.

`
('span.start, input.start').mask('00/0000');
('span.date, input.date').mask('00/00/0000');
('span.time, input.time').mask('00:00:00');
('span.time2, input.time2').mask('00:00');
('input.date_time').mask('00/00/0000 00:00:00');
('input.date_time2').mask('00/00/0000 00:00');
('input.cep').mask('00000-000');
('input.zip').mask('00000');
('input.phone, input[name="phonebr"]').mask(PhoneMaskBehavior, nonoOptions);
('input.phone_us').mask('(000) 000-0000');
('input.taxid').mask('00-0000000');
('input.ssn').mask('000-00-0000');
('input.mixed').mask('AAA 000-S0S');
('input.cpf').mask('000.000.000-00', { reverse: true });
('input.cnpj').mask('00.000.000/0000-00', { reverse: true });
('input.money').mask('000.000.000.000.000,00', { reverse: true });
('input.money2').mask('#.##0,00', { reverse: true });
('input.money3').mask('#,##0.00', { reverse: true });
('input.money4').mask('000,000,000,000,000.00', { reverse: true });
('input.money5').mask('#.##0', { reverse: true });
('input.money6').mask('#,##0', { reverse: true });
('input.ip_address').mask('099.099.099.099');
('input.percent').mask('##0,00%', { reverse: true });
('input.percent2').mask('##0.00%', { reverse: true });
('input.percent3').mask('990,0%', { reverse: true });
('input.percent4').mask('990.0%', { reverse: true });
('input.percent5').mask('#,##0%', { reverse: true });
('input.percent6').mask('#.##0%', { reverse: true });
`

[Click here](https://gist.github.com/petermann/fd1a898e02ca91a0d7231a9f8ee662b4) for more details on how to add custom mask.

**Optional**
- Added option for the format of the Brazilian phone number, with attribute `name` equal to `phonebr`.

== Installation ==

Installing "Masks Form Fields" can be done either by searching for "Masks Form Fields" via the "Plugins > Add New" screen in your WordPress dashboard, or by using the following steps:

1. Download the plugin via WordPress.org
2. Upload the ZIP file through the 'Plugins > Add New > Upload' screen in your WordPress dashboard
3. Activate the plugin through the 'Plugins' menu in WordPress


== Frequently Asked Questions ==

= What is the plugin for? =

This plugin to add masks in the form’s fields.

= How to add custom mask? =

[Click here](https://gist.github.com/petermann/fd1a898e02ca91a0d7231a9f8ee662b4) for more details on how to add custom mask.

== Changelog ==

= 1.11.1 =
* Fixed JS minification conflict: Added semicolon after JSON declaration in wp_add_inline_script. (commit#3529ce1)
* Added option for the format of the Brazilian phone number, with attribute 'name' equal to 'phonebr'. (commit#9c14400)

= 1.10 =
* Replaced wp_localize_script with wp_add_inline_script. (commit#6f6dc2d)
* Updated minimum WordPress version requirement from 3.9 to 4.5.
* Tested in WordPress 6.5

= 1.9 =
* Fixed conflict with another library.
* Tested in WordPress 5.9

= 1.8 =
* Added five new mask formats. (date_time2, money5, money6, percent5, percent6)
* Updated readme with usage example.

= 1.7 =
* Added new mask formats. (start, time2, zip, taxid, ssn, money3, money4, percent2, percent3, percent4)

= 1.6 =
* Tested in WordPress 5.8

= 1.5 =
* Fixed the incorrect value in the localize script.
* Tested in WordPress 5.7

= 1.4 =
* Updated Readme description
* Updated jQuery Mask library
* Tested in WordPress 5.5

= 1.3 =
* 2019-06-10
* Tested in WordPress 5.2

= 1.2 =
* 2017-11-20
* Tested in WordPress 4.9

= 1.1 =
* 2017-8-7
* Bug fix: remove date and time mask on body class.
* Add mask only span and input fields.

= 1.0 =
* 2016-11-3
* Initial release

== Upgrade Notice ==

= 1.9 =
* Fixed conflict with another library.
* Tested in WordPress 5.9

== Credits ==

[jQuery Mask Plugin](https://github.com/igorescobar/jQuery-Mask-Plugin)
