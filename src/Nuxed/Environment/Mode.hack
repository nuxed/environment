namespace Nuxed\Environment;

enum Mode: int {
  /**
   * The application is running in dev environment.
   */
  Development = 1;

  /**
   * The application is running in production.
   */
  Production = 2;

  /**
   * The application is running tests.
   */
  Test = 3;
}
