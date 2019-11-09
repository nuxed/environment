namespace Nuxed\Environment;

enum Mode: string as string {
  /**
   * The application is running in dev environment.
   */
  Development = 'dev';

  /**
   * The application is running in production.
   */
  Production = 'prod';

  /**
   * The application is running tests.
   */
  Test = 'test';

  /**
   * The application is running in a local environment.
   */
  Local = 'local';
}
