namespace Nuxed\Environment;

use namespace HH\Lib\Str;

/**
 * Retrieve the current applications mode based on the `APP_MODE` environment
 * variable.
 */
function mode(): ?Mode {
  if (!contains('APP_MODE')) {
    return null;
  }

  $mode = get('APP_MODE') as nonnull |> Str\lowercase($$);
  $modes = Mode::getNames();

  foreach ($modes as $value => $_) {
    $name = (string)$value;
    if ($mode === $name || Str\starts_with($mode, $name)) {
      return $value;
    }
  }

  return null;
}
