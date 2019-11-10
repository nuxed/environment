namespace Nuxed\Environment;

use namespace Nuxed\Filesystem;

/**
 * Bootstrap your environment.
 *
 * Loads a .env file and the corresponding .env.local, .env.$mode and .env.$mode.local files if they exist.
 *
 * .env.local is always ignored in test env because tests should produce the same results for everyone.
 * .env.dist is loaded when it exists and .env is not found.
 *
 * @param string  $path         A file to load
 * @param Mode    $defaultMode  The app mode to use when none is defined
 */
async function bootstrap(
  string $path,
  Mode $defaultMode = Mode::Development,
): Awaitable<void> {
  $path = Filesystem\Path::create($path);
  $dist = Filesystem\Path::create($path->toString().'.dist');
  if ($path->exists() || !$dist->exists()) {
    await load($path->toString());
  } else {
    await load($dist->toString());
  }

  $mode = mode();
  if (null === $mode) {
    $mode = $defaultMode;
    put('APP_MODE', $mode);
  }

  $local = Filesystem\Path::create($path->toString().'.local');
  if ($mode !== Mode::Test && $local->exists()) {
    await load($local->toString());
  }

  if (Mode::Local === $mode) {
    return;
  }

  $modeSpecific = Filesystem\Path::create($path->toString().'.'.$mode);
  if ($modeSpecific->exists()) {
    await load($modeSpecific->toString());
  }

  if (Mode::Test === $mode) {
    return;
  }

  $localModeSpecifc = Filesystem\Path::create(
    $modeSpecific->toString().'.local',
  );
  if ($localModeSpecifc->exists()) {
    await load($localModeSpecifc->toString());
  }
}
