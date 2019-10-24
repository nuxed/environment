namespace Nuxed\Environment;

use namespace HH\Lib\Str;

/**
 * Retrieve the current applications mode based on the `APP_MODE` environment
 * variable.
 *
 * To be safe, in case the `APP_MODE` variable is not set,
 * this functions fails to Mode::Production
 */
function mode(): Mode {
  $mode = get('APP_MODE', 'prod') as nonnull
    |> Str\lowercase($$);
  if (Str\starts_with($mode, 'dev')) {
    return Mode::Development;
  }

  if (Str\starts_with($mode, 'test')) {
    return Mode::Test;
  }

  return Mode::Production;
}
