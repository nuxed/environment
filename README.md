<p align="center"><img src="https://avatars3.githubusercontent.com/u/45311177?s=200&v=4"></p>

![Coding standards status](https://github.com/nuxed/environment/workflows/coding%20standards/badge.svg?branch=develop)
![Static analysis status](https://github.com/nuxed/environment/workflows/static%20analysis/badge.svg?branch=develop)
![Unit tests status](https://github.com/nuxed/environment/workflows/unit%20tests/badge.svg?branch=develop)
[![Total Downloads](https://poser.pugx.org/nuxed/environment/d/total.svg)](https://packagist.org/packages/nuxed/environment)
[![Latest Stable Version](https://poser.pugx.org/nuxed/environment/v/stable.svg)](https://packagist.org/packages/nuxed/environment)
[![License](https://poser.pugx.org/nuxed/environment/license.svg)](https://packagist.org/packages/nuxed/environment)

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
    case Environment\Mode::Development:
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
