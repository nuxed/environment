<p align="center"><img src="https://avatars3.githubusercontent.com/u/45311177?s=200&v=4"></p>

<p align="center">
<a href="https://travis-ci.org/nuxed/environment"><img src="https://travis-ci.org/nuxed/environment.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/nuxed/environment"><img src="https://poser.pugx.org/nuxed/environment/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/nuxed/environment"><img src="https://poser.pugx.org/nuxed/environment/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/nuxed/environment"><img src="https://poser.pugx.org/nuxed/environment/license.svg" alt="License"></a>
</p>

# Nuxed Environment

The Nuxed Environment component provides functions that help you manage environment variables.

### Installation

This package can be installed with [Composer](https://getcomposer.org).

```console
$ composer require nuxed/environment
```

### Example

```hack
use namespace Nuxed\Environment;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  await Environment\load('.env');

  if(!Environment\contains('APP_MODE')) {
    Environment\put('APP_MODE', 'prod');
  }

  $mode = Environment\mode();
  switch($mode) {
    case Environment\Mode::Developement:
      // Dev
    case Environment\Mode::Production:
      // Prod
    case Environment\Mode::Test:
      // Test
  }
}
```

---

### Security

For information on reporting security vulnerabilities in Nuxed, see [SECURITY.md](SECURITY.md).

---

### License

Nuxed is open-sourced software licensed under the MIT-licensed.
